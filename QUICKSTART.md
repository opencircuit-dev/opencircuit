# Open Circuit Quickstart

This guide gets you from zero to a working `oc` command using the packaged
release tarballs published in this repository.

This repository only distributes releases. If you want to contribute to
Open Circuit itself, use the source repository's contributor documentation
instead of this guide.

## 1. Check Node.js

Open Circuit expects a recent Node.js LTS release (24.x at the time of
writing).

```bash
node --version
```

If you use `nvm`:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install 24
nvm alias default 24
nvm use 24

node --version
npm --version
```

## 2. Pick a version

Browse [`release-artifacts/`](release-artifacts) or the table in
[README.md](README.md#available-versions) for the version you want. Each
version directory contains a tarball and its checksum file.

## 3. Verify the checksum

From the directory containing both files for your chosen `<version>`:

```bash
shasum -a 256 -c opencircuit-cli-<version>.tgz.sha256
```

Expected output:

```text
opencircuit-cli-<version>.tgz: OK
```

Do not install a tarball whose checksum does not match.

## 4. Install the CLI

```bash
npm install --global release-artifacts/<version>/opencircuit-cli-<version>.tgz
```

Confirm the install:

```bash
command -v oc
oc --version
```

## 5. First commands

```bash
oc --help
oc                       # Start an interactive session
oc -p "Review this code" # Run one prompt and exit
oc ls                    # List saved sessions
oc --resume              # Resume the previous session
```

## 6. Troubleshooting

### `oc: command not found`

The global npm binary directory may not be on your `PATH`:

```bash
npm prefix --global
```

Add the reported directory to your shell `PATH` and open a new terminal.

### Checksum mismatch

Re-download the tarball and checksum together from this repository; do not
mix files from different versions or sources.

### You want to build from source or contribute

This repository does not contain source code. See the primary Open Circuit
project repository for build-from-source and contributor instructions.
