#!/usr/bin/env bash
# Sync published CLI release artifacts from a local opencircuit-dev checkout
# into this publication repository, refresh the versions table in README.md,
# and (optionally) commit + push the result.
#
# Usage:
#   scripts/sync-release-artifacts.sh [--source <path>] [--push] [--no-commit]
#
# Env vars:
#   SOURCE_REPO   Path to an opencircuit-dev checkout (default: sibling
#                 ../opencircuit-dev relative to this repo).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_REPO="${SOURCE_REPO:-$(cd "$REPO_ROOT/.." && pwd)/opencircuit-dev}"
DO_PUSH=0
DO_COMMIT=1

while [ $# -gt 0 ]; do
  case "$1" in
    --source)
      SOURCE_REPO="$2"
      shift 2
      ;;
    --push)
      DO_PUSH=1
      shift
      ;;
    --no-commit)
      DO_COMMIT=0
      shift
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

SRC_ARTIFACTS="$SOURCE_REPO/release-artifacts"
DEST_ARTIFACTS="$REPO_ROOT/release-artifacts"

if [ ! -d "$SRC_ARTIFACTS" ]; then
  echo "error: no release-artifacts directory found at $SRC_ARTIFACTS" >&2
  echo "       set SOURCE_REPO or pass --source <path to opencircuit-dev checkout>" >&2
  exit 1
fi

echo "Syncing release artifacts"
echo "  from: $SRC_ARTIFACTS"
echo "  to:   $DEST_ARTIFACTS"

mkdir -p "$DEST_ARTIFACTS"
rsync -a --delete \
  --exclude ".DS_Store" \
  "$SRC_ARTIFACTS/" "$DEST_ARTIFACTS/"

# Verify every tarball has a matching sha256 checksum file before publishing.
missing=0
while IFS= read -r -d '' tarball; do
  checksum="${tarball}.sha256"
  if [ ! -f "$checksum" ]; then
    echo "error: missing checksum for $tarball" >&2
    missing=1
  fi
done < <(find "$DEST_ARTIFACTS" -type f -name '*.tgz' -print0)
if [ "$missing" -ne 0 ]; then
  exit 1
fi

# Rebuild the versions table between the README markers.
README="$REPO_ROOT/README.md"
VERSIONS_TABLE=$(
  {
    echo "| Version | Artifact | Checksum |"
    echo "| ------- | -------- | -------- |"
    find "$DEST_ARTIFACTS" -mindepth 1 -maxdepth 1 -type d | sort -rV | while read -r dir; do
      version="$(basename "$dir")"
      tgz="$(find "$dir" -maxdepth 1 -name '*.tgz' | head -n1)"
      [ -n "$tgz" ] || continue
      name="$(basename "$tgz")"
      echo "| \`$version\` | [\`release-artifacts/$version/$name\`](release-artifacts/$version/$name) | [\`$name.sha256\`](release-artifacts/$version/$name.sha256) |"
    done
  }
)

python3 - "$README" "$VERSIONS_TABLE" <<'PY'
import sys

readme_path, table = sys.argv[1], sys.argv[2]
start_marker = "<!-- VERSIONS_TABLE_START -->"
end_marker = "<!-- VERSIONS_TABLE_END -->"

with open(readme_path, encoding="utf-8") as f:
    content = f.read()

start = content.index(start_marker) + len(start_marker)
end = content.index(end_marker)
content = content[:start] + "\n\n" + table + "\n\n" + content[end:]

with open(readme_path, "w", encoding="utf-8") as f:
    f.write(content)
PY

echo "Updated $README versions table."

if [ "$DO_COMMIT" -eq 1 ]; then
  cd "$REPO_ROOT"
  git add release-artifacts README.md
  if ! git diff --cached --quiet; then
    latest_version="$(find "$DEST_ARTIFACTS" -mindepth 1 -maxdepth 1 -type d | sort -rV | head -n1 | xargs -I{} basename {})"
    git commit -m "Publish release artifacts ${latest_version:-update}"
    echo "Committed release artifact sync."
  else
    echo "No changes to commit."
  fi
fi

if [ "$DO_PUSH" -eq 1 ]; then
  cd "$REPO_ROOT"
  git push origin HEAD
  echo "Pushed to origin."
fi
