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

The current release is published at the repository root:

- `opencircuit-cli-<version>.tgz` — the installable npm package tarball
- `opencircuit-cli-<version>.tgz.sha256` — its SHA-256 checksum

Verify the checksum before installing. The root-level pair is refreshed automatically on each publication.

## Available versions

<!-- VERSIONS_TABLE_START -->

| Version | Artifact | Checksum |
| ------- | -------- | -------- |
| `v1.0.1` | [`opencircuit-cli-1.0.1.tgz`](opencircuit-cli-1.0.1.tgz) | [`opencircuit-cli-1.0.1.tgz.sha256`](opencircuit-cli-1.0.1.tgz.sha256) |

<!-- VERSIONS_TABLE_END -->

## Latest release

The current bundle and checksum are always published at the repository root:

<!-- LATEST_ARTIFACT_START -->

- [`opencircuit-cli-1.0.1.tgz`](opencircuit-cli-1.0.1.tgz)
- [`opencircuit-cli-1.0.1.tgz.sha256`](opencircuit-cli-1.0.1.tgz.sha256)

<!-- LATEST_ARTIFACT_END -->

## Install

```bash
shasum -a 256 -c opencircuit-cli-<version>.tgz.sha256
npm install --global opencircuit-cli-<version>.tgz
oc --version
```

See [QUICKSTART.md](QUICKSTART.md) for the full walkthrough, including
Node.js setup and first commands.

## How this repository is updated

This repository is a generated distribution point. The source repository builds
and validates the CLI, then publishes only the newest tarball and checksum at
this repository root. The source-side `release-artifacts/` directory is build
staging and is not copied into this repository.

Do not hand-edit the root-level tarball or checksum; the next automated publish
replaces them.

## License

Apache License 2.0 — see [LICENSE](LICENSE). Released tarballs carry the same
license as the upstream project.
