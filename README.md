# Open Circuit — CLI Releases

This repository distributes the Open Circuit CLI (`oc`) as versioned npm
package tarballs with SHA-256 checksums. It contains release artifacts and
installation guidance, not the application source. Start with the
[QUICKSTART](QUICKSTART.md).

## Current release

<!-- VERSIONS_TABLE_START -->

| Version | Artifact | Checksum |
| ------- | -------- | -------- |
| `v1.0.1` | [`opencircuit-cli-1.0.1.tgz`](opencircuit-cli-1.0.1.tgz) | [`opencircuit-cli-1.0.1.tgz.sha256`](opencircuit-cli-1.0.1.tgz.sha256) |

<!-- VERSIONS_TABLE_END -->

The release pair is also linked at the repository root:

<!-- LATEST_ARTIFACT_START -->

- [`opencircuit-cli-1.0.1.tgz`](opencircuit-cli-1.0.1.tgz)
- [`opencircuit-cli-1.0.1.tgz.sha256`](opencircuit-cli-1.0.1.tgz.sha256)

<!-- LATEST_ARTIFACT_END -->

Verify the checksum before installing:

```bash
shasum -a 256 -c opencircuit-cli-<version>.tgz.sha256
npm install --global ./opencircuit-cli-<version>.tgz
oc --version
```

The current source package is 1.0.2, but its artifact has not yet been
published to this distribution checkout. The links above describe the files
actually available here. The next verified publication updates the artifact
and these version markers together.

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

The CLI installs templates under `~/.ocircuit/templates/` without overwriting
existing files. Copy one provider template to `~/.ocircuit/config.yaml`.
Keep credentials in the private `~/.ocircuit/.env` file, not in YAML.

```bash
cp ~/.ocircuit/templates/config-openai.yaml ~/.ocircuit/config.yaml
chmod 600 ~/.ocircuit/config.yaml
```

Meta uses `META_MODEL_API_KEY`. For OLMo, set the Ollama server address in
`config-olmo.yaml`; OLMo sessions are chat-only with tools disabled.

<!-- PACKAGED_CONFIGURATION_END -->

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

## License

Apache License 2.0. The release package carries the upstream license.
