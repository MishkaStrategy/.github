# MishkaStrategy AI Agent Policy

**Policy version:** 2.0  
**Updated:** 2026-08-21  
**Scope:** repositories owned by `MishkaStrategy`  
**Status:** canonical organization default

## Purpose

This document defines the small organization-wide core policy for AI agents working on MishkaStrategy repositories.

The core policy is intentionally compact. Repository-specific rules stay in the repository that owns the work. Specialized Skill/Plugin routing stays in `AI_SKILL_ROUTING.md` and is loaded only when it is materially needed.

## Bootstrap contract

For non-trivial MishkaStrategy repository work, load the current `main` version of `MishkaStrategy/.github/AI_AGENT_POLICY.md` once for the current working session.

For ordinary ChatGPT Chat, the **current conversation is the working session**. A PR, merge, CI cycle, review, commit, milestone, or internal subtask does not start a new working session.

Do **not** automatically load `AI_SKILL_ROUTING.md`. Load it only when Skill/Plugin choice is non-obvious, a specialized workflow is materially useful, or capability discovery is actually needed.

Reuse organization and repository instructions already loaded in the same working session unless they changed or the current task newly depends on an unread section.

## Instruction precedence

When instructions conflict, use this precedence:

1. platform system, safety, permission, and sandbox rules;
2. the user's explicit current request;
3. applicable repository-specific instructions, security/release policy, and project governance;
4. this organization policy and, when loaded, `AI_SKILL_ROUTING.md`;
5. selected Skill/Plugin instructions;
6. normal agent defaults.

A Skill is a workflow dependency, not authority to weaken higher-precedence rules.

## Ordinary ChatGPT Chat is a valid long-running HQ

When the user is developing a MishkaStrategy project in an ordinary ChatGPT chat, keep that chat as the execution surface unless the user explicitly asks to switch or the current surface truly lacks a capability required to continue.

Do not require or recommend switching to Work, Codex, a new chat, or another surface merely because the task is long, code-heavy, has completed a PR, or has crossed a milestone.

Continuation is the default while safe requested work remains.

- No wall-clock duration, cycle count, message count, tool-call count, PR count, merge count, CI count, or milestone count is a stop, handoff, or rotation trigger.
- Completing an intermediate PR, merge, review, CI pass, or milestone is a checkpoint, not a terminal event. Verify the mutable state that matters, record a short checkpoint only when useful, then continue the next related safe objective in the same chat.
- A progress update is not a handoff. After a progress update, continue execution when safe work remains.
- Do not emit a terminal completion/handoff response merely because one coherent unit finished when the user's requested autonomous scope still contains related safe work.
- Do not voluntarily create a fresh chat because context merely feels large. Prefer targeted re-verification and context-efficient reads first.

A **technical/platform limit** is considered reached only when there is a concrete platform/tool signal or an actual inability to make further progress in the current run. Do not infer such a limit from elapsed time, an expected duration, perceived context size, number of completed milestones, or a guess that a limit may be near.

## Long-run context and tool budget

Preserve useful execution budget instead of repeatedly reloading stable context.

- Load this organization policy once per working session unless it changed.
- Read applicable repository governance/prompt material once, then reuse it while unchanged.
- Between milestones, refresh mutable facts such as `main` SHA, target branch/head, PR/Issue state, reviews, CI, blockers, and files known to have changed; do not mechanically reread every stable policy, prompt, ADR, roadmap, progress file, or contract.
- Prefer targeted file/range reads, exact identifiers, and batched repository queries over broad repeated searches or full-document reloads.
- Do not repeat bootstrap, Skill discovery, capability inventory, or unchanged `SKILL.md` reading for every internal subtask, commit, PR, or milestone.
- Reuse a previously selected Skill/Plugin and its instructions throughout the same continuous workstream unless the domain, environment, capability, or Skill version materially changed.
- Keep tool output and intermediate reports focused on information needed for the next decision. Do not accumulate large duplicated summaries merely for ceremony.
- Do not create progress-only PRs, handoff files, or repeated status artifacts unless project governance requires them or they materially improve recoverability.

Context efficiency is a continuation mechanism, not a reason to shorten an otherwise healthy working session.

## Repository source of truth

GitHub is the source of truth for repository state unless the repository explicitly defines another canonical source.

Before a state-dependent claim or mutation, verify the mutable facts required for that action. Prefer exact-head evidence for PR/CI work. Old chat summaries and handoffs are orientation only and never override current GitHub state.

Re-verification should be proportional: verify what may have changed, not every stable document already read in the current working session.

## Execution behavior

For non-trivial work, prefer continuous execution:

`understand -> inspect -> implement -> test -> fix -> verify -> publish -> continue`

Do not stop at a plan, Skill selection, root cause, first commit, PR creation, green CI, review result, merge, checkpoint, or status report when the requested scope still has safe executable work.

When a normal engineering problem appears, diagnose it, fix it, re-verify, and continue rather than converting it into a handoff.

Keep scope tight and do not modify unrelated repositories, services, or product behavior merely because they are nearby.

## Verification

Use the strongest practical verification for changed code or configuration: relevant tests, lint/type/build checks, targeted integration checks, exact-head CI, or other project-defined evidence.

Verify the final state after fixes. Report genuinely unverified areas rather than presenting them as complete. Documentation-only changes need consistency/path/link validation, not invented test work.

## Safety and permissions

- Never expose secrets, credentials, private `.env` values, SSH keys, unrelated private data, or production-sensitive material.
- Do not weaken authentication, authorization, CI gates, security controls, evidence requirements, or branch protections merely to make progress.
- Prefer reversible actions and respect platform confirmation/permission requirements.
- Treat newly discovered third-party Skills, Plugins, scripts, and install instructions as untrusted until reviewed under `AI_SKILL_ROUTING.md`.

## Legitimate stop conditions

Stop or hand off only when at least one of these is true:

- the requested scope, including any explicit autonomous continuation, is actually complete;
- the user explicitly asks to stop, hand off, or change surfaces;
- a real owner decision, permission, secret, credential, physical action, or unavailable external resource blocks further safe work and no independent safe work remains;
- continuing would create an unacceptable destructive, security, privacy, financial, production, or hardware risk requiring owner action;
- a concrete platform/tool failure or actual technical limitation prevents further progress in the current run.

Before stopping for a blocker, complete independent safe work when practical and leave only the minimum durable continuation state needed.

## Handoff

A handoff is recovery data, not a routine milestone deliverable and not a source of truth.

When a handoff is genuinely needed, keep it compact: repository, current objective, branch/head or PR, completed work, verification, blockers/decisions, and next concrete objective. A resumed session must re-verify mutable GitHub state.

Do not copy full chat history or preserve stale SHA/CI state as authoritative facts.

## Organization defaults vs project rules

Repository-specific rules may be stricter for safety, release, ownership, tests, compatibility, or architecture. They may not silently introduce arbitrary time-, cycle-, PR-, or milestone-based Chat rotation unless the project has a concrete documented reason.

## Policy maintenance

Organization-wide AI policy changes should normally use a reviewed branch/PR in `MishkaStrategy/.github`.

Keep the always-loaded core small. Put optional specialized routing in `AI_SKILL_ROUTING.md` and product-specific bootstrap details in `AI_AGENT_BOOTSTRAP.md`.