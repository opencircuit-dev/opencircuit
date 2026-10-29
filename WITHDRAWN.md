# Withdrawn releases

Open Circuit CLI versions **1.0.0, 1.0.1, and 1.0.2 are withdrawn** as of
2026-10-29. They have been removed from this repository and will not be
republished. The publication tooling refuses any version listed in
[`withdrawn-releases.json`](withdrawn-releases.json).

## Why

- None of these packages included the Apache-2.0 license text, the NOTICE
  attributing the portions derived from
  [Continue](https://github.com/continuedev/continue), or notices for the
  third-party code bundled into the CLI.
- None were published with provenance or a software bill of materials.
- 1.0.1 and 1.0.2 were rebuilt and replaced in place under the same version
  number. Eight different 1.0.1 artifacts and two different 1.0.2 artifacts
  were distributed, so a version number alone does not identify what you
  installed.

## If you installed one of these versions

1. Check what you have: `oc --version`.
2. Remove it: `npm uninstall --global @opencircuit/cli`.
3. Install the next release from this repository once it is published, and
   verify it with the instructions in the [README](README.md).

To identify a specific downloaded tarball, compare its SHA-256
(`shasum -a 256 opencircuit-cli-<version>.tgz`) with the digests listed for
that version in [`withdrawn-releases.json`](withdrawn-releases.json).
