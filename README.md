# Open Circuit — CLI Releases

This repository distributes the Open Circuit CLI (`oc`) as versioned package
tarballs with SHA-256 checksums. Stable releases are also published to npm,
but this repository is the source for downloadable archives and associated
release metadata. It contains release artifacts and installation guidance,
not the application source. Start with the
[QUICKSTART](QUICKSTART.md).

## Current release

<!-- VERSIONS_TABLE_START -->

| Version  | Artifact                                                 | Checksum                                                               |
| -------- | -------------------------------------------------------- | ---------------------------------------------------------------------- |
| `v1.0.3` | [`opencircuit-cli-1.0.3.tgz`](opencircuit-cli-1.0.3.tgz) | [`opencircuit-cli-1.0.3.tgz.sha256`](opencircuit-cli-1.0.3.tgz.sha256) |

<!-- VERSIONS_TABLE_END -->

The release pair is also linked at the repository root:

<!-- LATEST_ARTIFACT_START -->

- [`opencircuit-cli-1.0.3.tgz`](opencircuit-cli-1.0.3.tgz)
- [`opencircuit-cli-1.0.3.tgz.sha256`](opencircuit-cli-1.0.3.tgz.sha256)

<!-- LATEST_ARTIFACT_END -->

Verify the checksum before installing:

```bash
shasum -a 256 -c opencircuit-cli-1.0.3.tgz.sha256
npm install --global ./opencircuit-cli-1.0.3.tgz
oc --version
```

The links above describe the files actually available here. Source repositories
may contain a newer package version before its release is published. The
verified publication process updates the artifact and these version markers
together.

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
[project security policy](https://github.com/open-circuit-dev/opencircuit-dev/blob/main/SECURITY.md).

## Publication

The source repository builds and validates the package before updating this
distribution checkout. The root tarball and checksum, version links, and
packaged-template summary are refreshed from the verified archive. Do not
manually replace the generated artifact files.

Maintainers regenerate the public source and distribution through the canonical
orchestration entry:

```bash
/path/to/opencircuit-orchestration/scripts/opencircuit-orchestration.sh \
  --target self --action opencircuit-cli-release-publish \
  --artifact opencircuit-cli-public
```

The source must be clean on `main`. The action validates the exact revision on
Server1 and updates local outputs without committing or pushing. Tests and
dependency audits must pass before a new archive is staged.

The latest regeneration attempt failed the root dependency audit. The existing
1.0.3 archive is unchanged and predates the model-picker updates now on source
`main`; do not infer archive contents from the source package version.

## License

Apache License 2.0. The release package carries the upstream license.
