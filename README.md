# MishkaStrategy organization workflows

This repository contains organization-wide defaults and reusable infrastructure for MishkaStrategy repositories.

## GitHub Actions storage and evidence

Available workflow templates:

- baseline project CI with one-day failure/cancelled diagnostics;
- storage-policy guard that rejects durable or routine-success Actions artifacts;
- exact-commit canonical evidence publication to an immutable draft GitHub Release.

Project-specific tests and compatibility runner choices remain in each project.
Canonical evidence is never stored on a VDS.

Organization-wide GitHub Actions storage and evidence standards are defined in `.github/CI_STORAGE_POLICY.md` and the reusable workflow/templates in this repository.
