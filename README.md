# MishkaStrategy organization workflows

This repository contains the organization-wide GitHub Actions storage standard.

Available workflow templates:

- baseline project CI with one-day failure/cancelled diagnostics;
- storage-policy guard that rejects durable or routine-success Actions artifacts;
- exact-commit canonical evidence publication to an immutable draft GitHub Release.

Project-specific tests and compatibility runner choices remain in each project.
Canonical evidence is never stored on a VDS.
Organization-wide GitHub Actions storage and evidence standards
