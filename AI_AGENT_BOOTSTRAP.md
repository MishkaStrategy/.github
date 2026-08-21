# MishkaStrategy AI Agent Bootstrap

**Policy version:** 2.1  
**Updated:** 2026-08-21

## Why this file exists

`MishkaStrategy/.github` is the canonical location for organization-wide AI policy, but repository files are not automatically injected into every ChatGPT conversation or Codex working directory.

The bootstrap should avoid needless repeated retrieval while preserving reasoning depth, verification quality, relevant specialized workflows, and complete execution.

## Canonical files

- `AI_AGENT_POLICY.md` — organization core, including long-running HQ and quality requirements;
- `AI_SKILL_ROUTING.md` — specialized workflow routing, loaded whenever routing is materially relevant.

## ChatGPT bootstrap

For ordinary ChatGPT chats used as project HQ, use this persistent/bootstrap instruction:

```text
For non-trivial work involving a MishkaStrategy repository, treat the current
ordinary ChatGPT conversation as one continuous working session.

At the start of that working session, or when policy changed, read the current
main MishkaStrategy/.github/AI_AGENT_POLICY.md and follow it together with the
target repository's own instructions.

Use AI_SKILL_ROUTING.md whenever specialized Skill/Plugin selection is
materially relevant, non-obvious, or required. Do not skip a relevant workflow
merely to save context, latency, or tool calls.

Reuse unchanged instructions when safe, but reread any policy, prompt, ADR,
contract, architecture file, or Skill instructions whenever correctness or the
current stage requires it. Refresh mutable GitHub state between steps.

Do not trade reasoning depth, inspection, verification, or answer completeness
for response speed or session duration. Respect the product-level model and
reasoning mode selected by the user; repository policy does not authorize a
lower-reasoning fallback.

Continue related safe work in the same chat until the requested scope is
complete, a real blocker requires the owner, or an actual platform/tool
limitation prevents further progress.
```

Ordinary Chat remains a valid long-running HQ surface. Do not require Work, Codex, or a fresh chat merely because development is lengthy or code-heavy.

## Codex bootstrap

For Codex, use a short global reference such as:

```text
For non-trivial MishkaStrategy repository work, load the current main
MishkaStrategy/.github/AI_AGENT_POLICY.md once for the working session.
Use AI_SKILL_ROUTING.md whenever specialized workflow selection is materially
relevant. Reuse unchanged instructions when safe, reread them when correctness
requires it, and never reduce reasoning/verification quality merely to save
context or time.
```

Keep Codex-specific local configuration in its normal global/repository instruction layers rather than duplicating organization policy.

## Repository bootstrap

Root `AGENTS.md` files should point to the organization policy without introducing their own quality-reducing shortcuts:

```text
For non-trivial work in this repository, load the current main
MishkaStrategy/.github/AI_AGENT_POLICY.md once for the current working session.
Use AI_SKILL_ROUTING.md whenever specialized routing is materially relevant.

In ordinary ChatGPT Chat, the current conversation remains the working session
across PRs, merges, CI cycles, reviews, and milestones. Reuse unchanged
instructions when safe and refresh mutable state between steps, but reread any
material context whenever correctness, uncertainty, or a changed stage requires
it. Context efficiency must never reduce reasoning depth, relevant Skill use,
verification quality, or completeness.
```

Do not copy the full organization policy into project repositories.

## Refresh rules

Refresh `AI_AGENT_POLICY.md` when:

- starting a genuinely new working session;
- the organization policy changed;
- the current task depends on a policy section that may have changed.

Do not refresh merely because a commit, PR, CI cycle, review, milestone, or internal subtask completed.

Refresh mutable repository state proportionally, and reread stable governance whenever it is materially useful for correctness. Avoid repetition; do not avoid necessary context.

## Model/reasoning rule

This bootstrap cannot select a ChatGPT model or reasoning level. It must not be interpreted as permission to switch to a faster or lower-reasoning option.

If the user selected a product-level reasoning mode such as High, repository instructions should preserve the requested depth of work rather than optimizing for latency. Actual model availability and routing remain controlled by ChatGPT.

## Failure behavior

If GitHub access is temporarily unavailable, reuse a current policy copy already loaded in the active working session. Otherwise continue only where safe under repository/platform rules and state the inability to verify policy only when it materially affects the task.

## Rollout rule

Keep organization policy centralized. Project repositories carry a short bootstrap reference plus genuinely project-specific governance. Any efficiency wording is about redundant retrieval only, never reduced intelligence, analysis, verification, or answer quality.