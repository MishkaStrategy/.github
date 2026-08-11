# GitHub Actions storage policy

- GitHub Actions artifacts are temporary diagnostics only: upload them only on
  failure or cancellation and set `retention-days: 1`.
- Do not upload routine successful CI output.
- Publish canonical acceptance and release evidence directly from the producing
  job to an immutable GitHub Release asset bound to the exact commit SHA.
- Store small JSON/SHA/metadata manifests in the repository's `evidence` branch
  (or a non-conflicting `ci-evidence` branch).
- Never use a VDS as an evidence or CI-output storage backend.

Project-specific test commands, compatibility runners, and acceptance gates stay
inside each project. The organization templates standardize only storage and
evidence transport.
