# MishkaStrategy AI Agent Bootstrap

**Policy version:** 2.0  
**Updated:** 2026-08-21

## Why this file exists

`MishkaStrategy/.github` is the canonical location for organization-wide AI policy, but repository files are not automatically injected into every ChatGPT conversation or Codex working directory.

The bootstrap must stay small so long ordinary ChatGPT HQ sessions do not spend execution/context budget repeatedly loading policy material.

## Canonical files

- `AI_AGENT_POLICY.md` — compact always-loaded organization core;
- `AI_SKILL_ROUTING.md` — deferred, load only when specialized routing/discovery is materially needed.

## ChatGPT bootstrap

For ordinary ChatGPT chats used as project HQ, use this persistent/bootstrap instruction:

```text
For non-trivial work involving a MishkaStrategy repository, treat the current
ordinary ChatGPT conversation as one continuous working session.

At the start of that working session, or when policy changed, read the current
main version of MishkaStrategy/.github/AI_AGENT_POLICY.md and follow it with
the target repository's own instructions.

Do not automatically load AI_SKILL_ROUTING.md. Load it only when non-obvious
Skill/Plugin selection or capability discovery is materially needed.

Reuse unchanged policy, repository instructions, prompts, and already-loaded
Skill instructions across PRs, merges, CI cycles, reviews, and milestones.
Refresh mutable GitHub state and changed files rather than repeating the full
bootstrap. Continue related safe work in the same chat until the requested
scope is complete, a real blocker requires the owner, or an actual platform/
tool limitation prevents further progress.
```

Ordinary Chat remains a valid long-running HQ surface. Do not require Work, Codex, or a fresh chat merely because development is lengthy or code-heavy.

## Codex bootstrap

For Codex, use a short global reference such as:

```text
For non-trivial MishkaStrategy repository work, load the current main
MishkaStrategy/.github/AI_AGENT_POLICY.md once for the working session.
Load AI_SKILL_ROUTING.md only when specialized Skill routing/discovery is
materially needed. Reuse unchanged policy and Skill instructions across the
continuous workstream.
```

Keep Codex-specific local configuration in its normal global/repository instruction layers rather than duplicating organization policy.

## Repository bootstrap

Root `AGENTS.md` files should point to the compact core policy by default:

```text
For non-trivial work in this repository, load the current main
MishkaStrategy/.github/AI_AGENT_POLICY.md once for the current working session.
Do not automatically load AI_SKILL_ROUTING.md; load it only when non-obvious
specialized routing/discovery is materially needed.

In ordinary ChatGPT Chat, the current conversation remains the working session
across PRs, merges, CI cycles, reviews, and milestones. Reuse unchanged
instructions and refresh only material mutable state between steps.
```

Do not copy the full organization policy into project repositories.

## Refresh rules

Refresh `AI_AGENT_POLICY.md` when:

- starting a genuinely new working session;
- the organization policy changed;
- the current task depends on a policy section that may have changed.

Do not refresh merely because a commit, PR, CI cycle, review, milestone, or internal subtask completed.

Refresh repository state proportionally: current SHAs, PR/Issue/review/CI state, blockers, and changed files. Do not mechanically reread stable governance already loaded in the same session.

## Failure behavior

If GitHub access is temporarily unavailable, reuse a current policy copy already loaded in the active working session. Otherwise continue only where safe under repository/platform rules and state the inability to verify policy only when it materially affects the task.

## Rollout rule

Keep the organization core centralized and compact. Project repositories carry only a short bootstrap reference plus genuinely project-specific governance. This avoids policy drift and minimizes repeated context overhead.