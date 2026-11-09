# Open Circuit CLI Quickstart

This repository contains installable CLI releases, not source code. To
contribute, use the contributor documentation in the
[source repository](https://github.com/opencircuit-dev/opencircuit-dev).

## 1. Requirements

Use Node.js `>=24.19.0 <27`; `24.19.0` is the project baseline.

```bash
node --version
npm --version
```

## 2. Download the available release

<!-- LATEST_ARTIFACT_START -->

For the newest release, download the root-level bundle and checksum:

- [`opencircuit-cli-1.0.4.tgz`](opencircuit-cli-1.0.4.tgz)
- [`opencircuit-cli-1.0.4.tgz.sha256`](opencircuit-cli-1.0.4.tgz.sha256)

<!-- LATEST_ARTIFACT_END -->

Use only the artifacts linked above. A source repository may have a newer
package version before its release archive is published here.

The downloadable archive is **1.0.4**, including automatic model discovery.
This exact build passed Server1 release/security validation and isolated
runtime/model-picker qualification on Ubuntu1 and Workstation1. See the
[qualification record and checksum](README.md#104-qualification).
Tag/npm publication is not yet supported by the current distribution workflow.

## 3. Verify and install

Run these commands in the directory containing the downloaded files:

```bash
shasum -a 256 -c opencircuit-cli-1.0.4.tgz.sha256
npm install --global ./opencircuit-cli-1.0.4.tgz
command -v oc
oc --version
```

The checksum must report `OK`. Keep the tarball and checksum from the same
release; do not install if they do not match. `oc --version` should report
`1.0.4`. Existing provider configuration does not need to be replaced to upgrade.

## 4. Choose one provider

The package installs starter templates under `~/.ocircuit/templates/` without
overwriting existing files. For first-time setup, copy one template for the
provider you intend to use. If you already have provider configuration and
credentials, keep them; do not overwrite them with the setup commands below
just to upgrade.

```bash
mkdir -p ~/.ocircuit
chmod 700 ~/.ocircuit
cp ~/.ocircuit/templates/config-openai.yaml ~/.ocircuit/config.yaml
chmod 600 ~/.ocircuit/config.yaml
```

Put the provider key in `~/.ocircuit/.env`, not in the configuration file:

```bash
printf '%s\n' 'OPENAI_API_KEY=replace-with-your-key' > ~/.ocircuit/.env
chmod 600 ~/.ocircuit/.env
```

Use `ANTHROPIC_API_KEY` or `GEMINI_API_KEY` for the corresponding provider.
For hosted Open Circuit, use `OCIRCUIT_API_KEY`.

### BYOM and Ollama

The `config-byom.yaml` template is for an OpenAI-compatible endpoint. Set
`BYOM_API_KEY` in `~/.ocircuit/.env`; an unauthenticated local server can use
an empty value. Use HTTPS for remote endpoints. Plain HTTP should only be used
on a trusted network.

The `config-olmo.yaml` template targets an Ollama-compatible server on port
`11434`. Replace the example hostname and model with values reachable from
your machine. OLMo is chat-only in this template because tools are disabled.

## 5. Try `oc`

```bash
oc --help
oc
oc -p "Reply with exactly OK." --silent
oc ls
oc --resume
```

For an explicit configuration:

```bash
oc --config ~/.ocircuit/config.yaml
```

In an interactive session, use `/model` to open the model picker. Use the arrow
keys and Enter to select a chat model, or Esc to cancel.

The 1.0.4 picker also discovers compatible chat models for the
selected OpenAI, Anthropic, Gemini, or OpenAI-compatible provider profile.
Entries are labeled configured or discovered, long lists scroll, and selections
are saved for the matching provider profile across restarts. Endpoint settings
and restrictions such as OLMo's disabled tools are preserved. If discovery
fails, a warning is shown and configured models remain selectable.

When upgrading from 1.0.3, the picker is no longer limited to models explicitly
listed in YAML. Explicitly configured models remain available.

## Troubleshooting

If `oc` is not found after installing, check your Node version and global npm
prefix:

```bash
node --version
npm prefix --global
command -v oc
```

Global npm packages are installed separately for each Node version. If
checksum verification fails, download the matching archive and checksum again.

Local terminal commands use a fixed non-login shell; shell profiles and parent
`PATH` values are not inherited. Public URL retrieval tools accept only public
HTTPS destinations on port 443. See the
[security policy](https://github.com/opencircuit-dev/opencircuit-dev/blob/main/SECURITY.md).

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
