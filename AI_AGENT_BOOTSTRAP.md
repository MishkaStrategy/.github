# MishkaStrategy AI Agent Bootstrap

**Policy version:** 1.0  
**Updated:** 2026-08-18

## Why this file exists

`MishkaStrategy/.github` is the canonical location for organization-wide AI policy, but files in this repository are not automatically injected into every ChatGPT conversation or every Codex working directory.

Each product needs a small bootstrap instruction that points the agent to the current policy. Keep the bootstrap short; keep the real rules in the canonical policy files.

Canonical files:

- `AI_AGENT_POLICY.md`
- `AI_SKILL_ROUTING.md`

## ChatGPT bootstrap

Use the following text in a ChatGPT Project instruction or another persistent instruction surface appropriate to the account/workspace:

```text
For non-trivial work involving repositories owned by MishkaStrategy, treat
MishkaStrategy/.github as the canonical organization-wide AI policy source.

At the start of a new repository working session, after a material pause, or
when policy may have changed, use the connected GitHub capability to read the
current main versions of:

- AI_AGENT_POLICY.md
- AI_SKILL_ROUTING.md

Follow those policies together with the target repository's own instructions.
Do not refetch unchanged organization policy before every tiny subtask.
Repository-specific rules override organization defaults where they conflict.
Do not require me to name Skills explicitly when an available installed Skill
or Plugin clearly matches the task.
```

### ChatGPT behavior expected after bootstrap

For a non-trivial MishkaStrategy repository task, ChatGPT should normally:

1. read the organization policy if it has not already loaded the current version for the working session;
2. inspect relevant project-specific rules;
3. classify the task;
4. automatically route to the best available installed Skill/Plugin or built-in workflow;
5. use supported Plugin discovery only when a missing capability would materially help;
6. continue through execution and verification.

ChatGPT must not claim that it directly installed an arbitrary Skill from a GitHub repository when the product does not support that action.

## Codex bootstrap

Add a short reference to the user's global Codex instructions (for example `$CODEX_HOME/AGENTS.md` / `~/.codex/AGENTS.md`, depending on the active environment):

```text
For non-trivial work on MishkaStrategy repositories, load the current main
versions of MishkaStrategy/.github/AI_AGENT_POLICY.md and
MishkaStrategy/.github/AI_SKILL_ROUTING.md when GitHub/network access is
available. Treat them as organization defaults below applicable repository
AGENTS.md instructions. Reuse a policy already loaded in the current session
unless there is reason to believe it changed.
```

Keep existing Codex-specific local configuration, including `find-skills` setup and local Skill installation rules, in the global Codex configuration. Do not duplicate a large copy of the organization policy there.

## Repository bootstrap

A repository may optionally point to the organization policy from its own `AGENTS.md`, contributor guide, or project instructions when stronger reliability is required.

Recommended short reference:

```text
Organization defaults: before non-trivial work, follow the current main
AI_AGENT_POLICY.md and AI_SKILL_ROUTING.md from MishkaStrategy/.github.
Project instructions in this repository take precedence where they conflict.
```

Do not mechanically copy the full organization policy into every repository. A short reference prevents policy drift and keeps updates centralized.

## Refresh rules

Refresh organization policy when:

- starting a new working session on a MishkaStrategy repository;
- resuming after a material pause;
- the policy repository changed;
- a task depends on a rule that may have been updated;
- the user explicitly asks to refresh or verify policy.

Do not refresh solely because another tiny subtask began in the same active session.

## Failure behavior

If GitHub access is temporarily unavailable:

- use a current policy copy already loaded in the active session if one exists;
- otherwise continue only where safe using repository-specific instructions and available platform rules;
- do not invent organization policy content;
- state the inability to verify the current organization policy if it materially affects the requested work.

## Rollout recommendation

Roll out in this order:

1. keep these files canonical in `MishkaStrategy/.github`;
2. add the short ChatGPT bootstrap to the ChatGPT Project(s) used for MishkaStrategy repository work;
3. add the short Codex bootstrap to global Codex instructions;
4. add repository references only to projects where extra reliability is valuable;
5. measure whether Skill selection improves and whether repeated prompt boilerplate decreases before adding more policy.
