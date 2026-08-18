# MishkaStrategy organization workflows

This repository contains organization-wide defaults and reusable infrastructure for MishkaStrategy repositories.

## AI agent policy

Canonical organization-wide AI-agent defaults:

- [`AI_AGENT_POLICY.md`](AI_AGENT_POLICY.md) — operating rules, precedence, GitHub source-of-truth behavior, verification, safety, and context-efficiency defaults;
- [`AI_SKILL_ROUTING.md`](AI_SKILL_ROUTING.md) — automatic Skill/Plugin selection, multi-Skill workflows, third-party security checks, and separate ChatGPT/Codex adapters;
- [`AI_AGENT_BOOTSTRAP.md`](AI_AGENT_BOOTSTRAP.md) — minimal bootstrap instructions that point ChatGPT, Codex, and repositories to the canonical policy without duplicating it.

The `.github` organization repository is the canonical policy location, but these Markdown files are not automatically injected into every ChatGPT session or Codex working directory. Use the bootstrap instructions to load the current `main` policy for non-trivial MishkaStrategy repository work.

Repository-specific instructions remain authoritative for project-specific test commands, compatibility requirements, deployments, architecture, release gates, and other local decisions.

## GitHub Actions storage and evidence

Available workflow templates:

- baseline project CI with one-day failure/cancelled diagnostics;
- storage-policy guard that rejects durable or routine-success Actions artifacts;
- exact-commit canonical evidence publication to an immutable draft GitHub Release.

Project-specific tests and compatibility runner choices remain in each project.
Canonical evidence is never stored on a VDS.

Organization-wide GitHub Actions storage and evidence standards are defined in `.github/CI_STORAGE_POLICY.md` and the reusable workflow/templates in this repository.
