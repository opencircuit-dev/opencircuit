# Open Circuit — Release Artifacts

> Public distribution point for packaged `oc` CLI releases.

[![License](https://img.shields.io/badge/license-Apache--2.0-2563eb)](LICENSE)

This repository publishes signed, versioned release tarballs for the Open
Circuit CLI (`oc`). It does not contain the project's source code. Source
development happens in the primary `opencircuit-dev` repository; this
repository exists so that anyone can install a release without needing
access to that source repository.

New to Open Circuit? Start with **[QUICKSTART.md](QUICKSTART.md)**.

## What is published here

Each release is a directory under [`release-artifacts/`](release-artifacts)
containing:

- `opencircuit-cli-<version>.tgz` — the installable npm package tarball
- `opencircuit-cli-<version>.tgz.sha256` — its SHA-256 checksum

Verify the checksum before installing any tarball you download.

## Available versions

<!-- VERSIONS_TABLE_START -->

| Version | Artifact | Checksum |
| ------- | -------- | -------- |
| `v1.0.0` | [`release-artifacts/v1.0.0/opencircuit-cli-1.0.0.tgz`](release-artifacts/v1.0.0/opencircuit-cli-1.0.0.tgz) | [`opencircuit-cli-1.0.0.tgz.sha256`](release-artifacts/v1.0.0/opencircuit-cli-1.0.0.tgz.sha256) |

<!-- VERSIONS_TABLE_END -->

## Install

```bash
shasum -a 256 -c release-artifacts/<version>/opencircuit-cli-<version>.tgz.sha256
npm install --global release-artifacts/<version>/opencircuit-cli-<version>.tgz
oc --version
```

See [QUICKSTART.md](QUICKSTART.md) for the full walkthrough, including
Node.js setup and first commands.

## How this repository is updated

This repository is a generated mirror. Its contents are produced from the
`opencircuit-dev` source repository's `release-artifacts/` output by
[`scripts/sync-release-artifacts.sh`](scripts/sync-release-artifacts.sh),
which copies new release artifacts, verifies each tarball has a matching
checksum, and refreshes the versions table above. Do not hand-edit
`release-artifacts/`; re-run the sync script instead.

## License

Apache License 2.0 — see [LICENSE](LICENSE). Released tarballs carry the same
license as the upstream project.
