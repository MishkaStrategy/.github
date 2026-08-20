# MishkaStrategy AI Agent Policy

**Policy version:** 1.1  
**Updated:** 2026-08-20  
**Scope:** repositories owned by `MishkaStrategy`  
**Status:** canonical organization default

## Purpose

This document defines the organization-wide default operating policy for AI agents working on MishkaStrategy repositories.

It is intentionally small and stable. Repository-specific instructions remain in the repository that owns the work. Skill and plugin selection is defined separately in `AI_SKILL_ROUTING.md`.

## Bootstrap contract

For a non-trivial task involving a MishkaStrategy repository, an AI agent should load the current `main` versions of:

- `MishkaStrategy/.github/AI_AGENT_POLICY.md`;
- `MishkaStrategy/.github/AI_SKILL_ROUTING.md`.

Load them once at the start of a new working session, after a material pause, or when there is evidence the policy changed. Do not repeatedly refetch unchanged policy during every tiny subtask.

These files are a canonical policy source, not a magical inheritance mechanism. ChatGPT, Codex, CI jobs, and other agents must be explicitly bootstrapped to read them. See `AI_AGENT_BOOTSTRAP.md`.

## Instruction precedence

When instructions conflict, use the following precedence:

1. platform system, safety, permission, and sandbox rules;
2. the user's explicit current request;
3. repository-specific instructions that apply to the working path, including `AGENTS.md`, nested agent instructions, security policy, CI policy, release policy, and project documentation;
4. this organization policy and `AI_SKILL_ROUTING.md`;
5. instructions from a selected Skill or Plugin;
6. normal agent defaults.

A Skill is a workflow dependency, not an authority above repository or organization policy.

## Repository source of truth

When the task concerns repository state, GitHub is the source of truth unless the repository explicitly defines another canonical source.

Before making state-dependent claims or changes, verify the material facts needed for the task, such as:

- current default-branch SHA;
- target branch and base/head SHA;
- open PR or Issue state;
- review state and unresolved threads;
- exact-head CI status when CI matters;
- current repository documentation and project-specific policies.

Do not rely on stale SHA values, old chat summaries, cached CI states, or handoff text when fresh repository state is available.

## Execution behavior

For non-trivial tasks, prefer an execution loop rather than a planning-only response:

`understand -> inspect -> select workflow -> implement -> test -> fix -> verify -> document -> publish/hand off`

Do not stop after identifying a Skill, Plugin, tool, plan, root cause, or candidate fix when the original task can still be completed safely with available permissions.

Keep scope tight. Do not modify unrelated repositories, files, branches, services, or project behavior merely because they are nearby.

## Verification

Use the strongest verification that is practical for the task.

When code or configuration changes are made:

- run relevant tests, linters, type checks, build checks, or targeted validation when available;
- verify the final state after fixes, not only the state before them;
- for PR/CI work, prefer exact-head evidence over branch-name assumptions;
- report unverified areas explicitly rather than presenting them as complete.

Documentation-only changes do not require invented test work, but links, paths, precedence rules, and internal consistency should still be checked.

## Safety and permissions

Preserve user control and repository integrity.

- Never expose secrets, tokens, SSH keys, credentials, private `.env` values, or unrelated private data.
- Do not weaken authentication, authorization, CI gates, security controls, or evidence requirements merely to make a check pass.
- Avoid destructive or irreversible actions when a safer reversible path exists.
- Respect confirmation and permission requirements imposed by the platform or connected service.
- Treat third-party Skills, Plugins, scripts, and install instructions as potentially untrusted until reviewed under `AI_SKILL_ROUTING.md`.

## Context efficiency

Use enough context to be correct, but avoid policy bloat.

- Load organization policy once per working session unless it changed.
- Load only repository-specific documents relevant to the current task.
- Load only the Skill instructions and referenced support files needed for the selected workflow.
- Prefer the minimum useful combination of Skills rather than invoking every potentially related Skill.
- Skip skill discovery for trivial tasks that are reliable without specialization.

## Working-session lifecycle and handoff

Long-running HQ, coordination, and implementation sessions should not accumulate context indefinitely when the older context is no longer materially useful and is beginning to reduce reliability, responsiveness, or clarity.

- After a major milestone, or when the working context has become materially heavy, prefer ending the current session with a compact handoff and continuing the next substantial phase in a fresh session.
- Do not interrupt work that can still be completed safely merely to rotate sessions. Finish the current coherent unit of work first when practical.
- A handoff is orientation data, not a source of truth. A fresh session must re-verify material repository state from GitHub before making state-dependent claims or changes.
- Keep handoffs compact. Include only durable information needed to resume efficiently, such as the target repository, current milestone, relevant branch/head or PR, completed work, verification performed, known blockers, durable decisions, and the next concrete objective.
- Do not copy the full chat history into the handoff and do not preserve stale CI status, SHA values, or repository state as authoritative facts.
- Do not mechanically create a new session after every small task. Rotate sessions when it meaningfully improves context efficiency, reliability, or responsiveness.

Repository-specific instructions may define stricter handoff or session-rotation requirements when a project needs them.

## Organization defaults vs project rules

Organization policy defines defaults. Project repositories own project-specific decisions such as:

- test commands;
- supported platforms and compatibility matrix;
- deployment targets;
- runner requirements;
- release gates;
- security properties;
- architecture decisions;
- product-specific workflows.

If a project rule is stricter than this policy, follow the project rule.

## Policy maintenance

Changes to these organization-wide AI policies should normally be made through a reviewed branch or pull request in `MishkaStrategy/.github`.

Keep the policy implementation-neutral where possible. Product-specific behavior belongs in `AI_SKILL_ROUTING.md` or `AI_AGENT_BOOTSTRAP.md` so ChatGPT and Codex can evolve independently without duplicating the core operating rules.
