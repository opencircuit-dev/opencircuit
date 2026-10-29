# Open Circuit — CLI Releases

This repository distributes the Open Circuit CLI (`oc`) as versioned npm
package tarballs with SHA-256 checksums. It contains release artifacts and
installation guidance, not the application source. Start with the
[QUICKSTART](QUICKSTART.md).

## Current release

<!-- VERSIONS_TABLE_START -->

No release is currently available. Versions 1.0.0–1.0.2 are
[withdrawn](WITHDRAWN.md); the next release will be published here.

<!-- VERSIONS_TABLE_END -->

The release pair is also linked at the repository root:

<!-- LATEST_ARTIFACT_START -->

No artifact is currently published.

<!-- LATEST_ARTIFACT_END -->

Verify the checksum before installing:

```bash
shasum -a 256 -c opencircuit-cli-<version>.tgz.sha256
npm install --global ./opencircuit-cli-<version>.tgz
oc --version
```

The links above describe the files actually available here. Source repositories
may contain a newer package version before its release is published. The
verified publication process updates the artifact and these version markers
together.

## Configuration included in the release

<!-- PACKAGED_CONFIGURATION_START -->

The packaged starter templates are listed here when a release is available.

<!-- PACKAGED_CONFIGURATION_END -->

## Withdrawn releases

Versions 1.0.0, 1.0.1, and 1.0.2 are withdrawn and will not be republished.
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

## License

Apache License 2.0. The release package carries the upstream license.
