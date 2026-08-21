# MishkaStrategy organization workflows

This repository contains organization-wide defaults and reusable infrastructure for MishkaStrategy repositories.

## AI agent policy

Canonical organization-wide AI-agent defaults:

- [`AI_AGENT_POLICY.md`](AI_AGENT_POLICY.md) — compact always-loaded operating core: precedence, continuation-first ordinary Chat behavior, GitHub source of truth, context/tool-budget efficiency, verification, safety, and legitimate stop conditions;
- [`AI_SKILL_ROUTING.md`](AI_SKILL_ROUTING.md) — deferred/on-demand Skill/Plugin routing and discovery policy; it is not part of the mandatory bootstrap when routing is already obvious;
- [`AI_AGENT_BOOTSTRAP.md`](AI_AGENT_BOOTSTRAP.md) — minimal ChatGPT/Codex/repository bootstrap guidance designed to avoid repeatedly loading unchanged policy and routing context.

The `.github` organization repository is the canonical policy location, but these Markdown files are not automatically injected into every ChatGPT session or Codex working directory. Project bootstrap instructions load the compact core policy once per working session and lazy-load specialized routing only when needed.

For ordinary ChatGPT development, the current conversation remains one working session across commits, PRs, merges, CI cycles, reviews, and milestones. Repository-specific instructions remain authoritative for project-specific safety, tests, compatibility, deployments, architecture, release gates, ownership, and other local decisions.

## GitHub Actions storage and evidence

Available workflow templates:

- baseline project CI with one-day failure/cancelled diagnostics;
- storage-policy guard that rejects durable or routine-success Actions artifacts;
- exact-commit canonical evidence publication to an immutable draft GitHub Release.

Project-specific tests and compatibility runner choices remain in each project.
Canonical evidence is never stored on a VDS.

Organization-wide GitHub Actions storage and evidence standards are defined in `.github/CI_STORAGE_POLICY.md` and the reusable workflow/templates in this repository.