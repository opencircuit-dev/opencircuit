# Open Circuit — CLI Releases

This repository distributes the Open Circuit CLI (`oc`) as versioned package
tarballs with SHA-256 checksums and associated release metadata. It contains
release artifacts and installation guidance, not the application source.
Tag/npm publication is not yet supported by the current distribution workflow.
Start with the
[QUICKSTART](QUICKSTART.md).

## Current release

<!-- VERSIONS_TABLE_START -->

| Version | Artifact | Checksum |
| ------- | -------- | -------- |
| `v1.0.5` | [`opencircuit-cli-1.0.5.tgz`](opencircuit-cli-1.0.5.tgz) | [`opencircuit-cli-1.0.5.tgz.sha256`](opencircuit-cli-1.0.5.tgz.sha256) |

<!-- VERSIONS_TABLE_END -->

The release pair is also linked at the repository root:

<!-- LATEST_ARTIFACT_START -->

- [`opencircuit-cli-1.0.5.tgz`](opencircuit-cli-1.0.5.tgz)
- [`opencircuit-cli-1.0.5.tgz.sha256`](opencircuit-cli-1.0.5.tgz.sha256)

<!-- LATEST_ARTIFACT_END -->

Verify the checksum before installing:

```bash
shasum -a 256 -c opencircuit-cli-1.0.5.tgz.sha256
npm install --global ./opencircuit-cli-1.0.5.tgz
oc --version
```

The links above describe the files actually available here. Source repositories
may contain a newer package version before its release is published. The
verified publication process updates the artifact and these version markers
together.

## 1.0.5 verification

The **1.0.5** archive was built from merged source
[`bb445aae649c19c17163244b45a9b5ea4b79fdee`](https://github.com/opencircuit-dev/opencircuit-dev/commit/bb445aae649c19c17163244b45a9b5ea4b79fdee)
and promoted through
[opencircuit-dev/opencircuit#3](https://github.com/opencircuit-dev/opencircuit/pull/3).
It includes automatic model discovery plus the bounded tool recovery,
denial stopping, and file-edit safeguards merged in
[opencircuit-dev/opencircuit-dev#93](https://github.com/opencircuit-dev/opencircuit-dev/pull/93).
Required CI checks for the version update,
[opencircuit-dev/opencircuit-dev#94](https://github.com/opencircuit-dev/opencircuit-dev/pull/94),
passed or were intentionally skipped.

Published `opencircuit-cli-1.0.5.tgz` SHA-256:

```text
e0a668bc3653b4f7bd6027077cb5a60ec29d262e6b4e231b98ffd36bab956210
```

The archive contains 253 package files. Its package version, bundled turn
guard, byte size, checksum, SBOM/notices digests, source commit, and lockfile
digests were checked against the distributed provenance. Its release-artifact
shape check passes. Provenance remains unsigned.

The retained November 9 Server1 adapter report lists 11 passing steps,
including build/typechecks, 12 smoke tests, 916 Core tests (68 skipped),
root/Core/CLI audits at `--audit-level=critical`, and archive generation and
validation. Lower-severity audit findings remain; this is not a zero-finding
security result. The legacy transport wrapper records workload status
`unknown`, not a durable successful receipt. No new Ubuntu1/Workstation1
runtime qualification or live-provider acceptance is claimed for 1.0.5.

## Historical 1.0.4 qualification

The previous **1.0.4** archive and its metadata remain available in Git
history, not at the current root artifact links above. The following
qualification applies only to that earlier archive.

On November 9, 2026, the exact merged source commit
[`553654c7a46917ca3625c9b5e41990d09d1dd50f`](https://github.com/opencircuit-dev/opencircuit-dev/commit/553654c7a46917ca3625c9b5e41990d09d1dd50f)
passed strict release/security validation on Server1. The same archive was
installed and qualified on Ubuntu1 and Workstation1; all 245 installed package
files matched the archive.

Qualified `opencircuit-cli-1.0.4.tgz` SHA-256:

```text
b3bdd6ac1ee321e5a70c0935766154c49ef0c5197df1ac4c112e65f6157f0279
```

The installed model picker passed discovery and selection for OpenAI,
Anthropic, Gemini, and OpenAI-compatible providers, including scrolling,
provider-scoped persistence, restart restoration, and discovery-failure
fallback. These checks used isolated homes and loopback provider fixtures,
not live provider APIs or user credentials. Artifact provenance is unsigned.
See the [qualification record on opencircuit-dev/opencircuit-dev#92](https://github.com/opencircuit-dev/opencircuit-dev/pull/92#issuecomment-6744836005).

The 1.0.4 model-discovery features are not present in the previous 1.0.3 archive.

## Configuration included in the release

<!-- PACKAGED_CONFIGURATION_START -->

## Packaged Configuration

This release includes 6 starter templates:

- `config-anthropic.yaml`
- `config-byom.yaml`
- `config-gemini.yaml`
- `config-meta.yaml`
- `config-olmo.yaml`
- `config-openai.yaml`

The CLI installs these templates under `~/.ocircuit/templates/`. Select one
for `~/.ocircuit/config.yaml`; keep provider credentials in the private
`~/.ocircuit/.env` file, not in a template. Do not activate multiple provider configs.

```bash
cp ~/.ocircuit/templates/config-openai.yaml ~/.ocircuit/config.yaml
chmod 600 ~/.ocircuit/config.yaml
```

Meta uses `META_MODEL_API_KEY`. For OLMo, set your Ollama server address
in `config-olmo.yaml`; OLMo sessions are chat-only with tools disabled.

<!-- PACKAGED_CONFIGURATION_END -->

## Withdrawn releases

Releases before 1.0.3 are withdrawn and will not be republished.
See [WITHDRAWN.md](WITHDRAWN.md) for the reason, the affected artifact
digests, and what to do if you installed one.

## Security and compatibility

Local command execution uses a fixed non-login shell and a minimal environment.
Public URL tools accept only public HTTPS destinations on port 443. These
restrictions can affect existing workflows and are not an operating-system
sandbox. See the
[project security policy](https://github.com/opencircuit-dev/opencircuit-dev/blob/main/SECURITY.md).

## Publication

The source repository builds and validates the package before updating this
distribution checkout. The root tarball and checksum, version links, and
packaged-template summary are refreshed from the verified archive. Do not
manually replace the generated artifact files.

Build and host qualification do not by themselves authorize distribution.
The merged 1.0.5 distribution update promotes the exact published archive,
checksum, SBOM, notices, provenance, and release links together. A rebuilt or
changed archive requires requalification. The root release files track the
current version; the previous 1.0.3 and 1.0.4 files remain available in Git history.

No release tag, npm publication, or stable-release workflow dispatch is part
of this distribution update. Tag/npm publication remains unsupported in the
current distribution workflow.

## License

Apache License 2.0. The release package carries the upstream license.
