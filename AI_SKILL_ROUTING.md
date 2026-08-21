# MishkaStrategy AI Skill Routing

**Policy version:** 1.1  
**Updated:** 2026-08-21  
**Scope:** ChatGPT, Codex, and compatible AI agents working on `MishkaStrategy` repositories  
**Load mode:** deferred / on demand

## Purpose

Use specialized Skills or Plugins when they materially improve the current workstream without turning routing into repeated context or tool overhead.

This file is **not part of the mandatory organization bootstrap**. Load it when Skill/Plugin choice is non-obvious, a specialized workflow is materially useful, or a missing capability may require discovery.

## Routing unit: the continuous workstream

Route once for the current user workstream, not once for every internal milestone, commit, PR, CI retry, review pass, or subtask.

A previous routing decision remains valid while all of these are materially unchanged:

- task domain;
- execution surface/environment;
- required capability;
- selected Skill/Plugin version/instructions;
- higher-precedence repository or organization rules.

Do not repeatedly inventory capabilities, rediscover Plugins, reload this file, or reread an unchanged `SKILL.md` merely because an intermediate step completed.

## Selection algorithm

When routing is actually needed:

1. classify the workstream domain;
2. inspect the capabilities already available in the current environment;
3. prefer a specific already-installed Skill/Plugin when it clearly improves correctness, safety, speed, or completeness;
4. read the selected Skill's instructions sufficiently to follow mandatory prerequisites, ordering, validation, and tool constraints;
5. use the minimum useful Skill chain;
6. discover an additional capability only when an important capability is missing and discovery would materially improve or unblock the result;
7. execute the original work and continue through verification; do not stop at routing.

If the task is reliably executable with the existing known workflow, skip routing/discovery overhead and execute directly.

## Skill instruction reuse

Never infer a Skill workflow from its name alone. On first use in a workstream, read the required `SKILL.md` or equivalent instructions.

After that first read, reuse the loaded instructions. Reread only when:

- the Skill/version may have changed;
- a new stage depends on an unread mandatory section;
- the environment/capability materially changed;
- a failure suggests the remembered workflow is incomplete or stale.

Do not reread the same Skill instructions after every commit, PR, merge, or CI cycle.

## Multi-Skill workflows

Use multiple Skills only when each has a concrete role. Prefer the smallest chain that completes the work.

Example:

```text
GitHub Actions failure
-> GitHub repository/PR context
-> CI-fix workflow
-> exact-head verification
```

Avoid speculative chains and ceremony-only discovery.

## ChatGPT adapter

In ordinary ChatGPT Chat:

- keep the current chat as the user's working surface unless the user requests otherwise or a required capability is genuinely unavailable there;
- do not switch surfaces merely because the work is long or code-heavy;
- prefer native/built-in capabilities and already-installed Plugins/Skills;
- use Plugin discovery only for a materially missing capability;
- once a Plugin/Skill is selected for the continuous workstream, reuse that selection instead of rerouting at each milestone;
- do not claim an arbitrary GitHub-hosted Skill was installed when the product does not support that action.

If connection, OAuth, admin approval, installation, or user confirmation is genuinely required, surface that requirement only when it blocks or materially changes execution; continue independent safe work where possible.

## Codex adapter

Respect applicable `AGENTS.md` / `AGENTS.override.md` scope and precedence.

Use an installed matching Skill when it materially helps. Read its instructions on first relevant use, then reuse them throughout the continuous workstream while unchanged.

Use `find-skills` or another supported discovery mechanism only when a missing specialized capability would materially improve or unblock the task and the environment permits discovery/installation.

Do not reinstall or rediscover a suitable Skill that is already available.

## Third-party security gate

Treat newly discovered third-party Skills/Plugins as untrusted until reviewed. Check, as available:

- publisher/source and provenance;
- maintenance status and scope;
- requested permissions;
- commands/scripts and filesystem/network access;
- credential/secret access;
- persistence/startup changes;
- destructive actions or unrelated instructions.

Reject suspicious, abandoned, unnecessarily broad, redundant, or unrelated capabilities. Never disclose secrets or unrelated private data unnecessarily and never blindly execute unknown install scripts.

## When not to load or discover

Do not load this routing policy or run discovery merely for:

- routine continuation of an already-routed HQ workstream;
- the next PR/milestone in the same technical domain;
- ordinary test/fix/retest loops;
- simple text edits or mechanical renames;
- straightforward shell/repository operations;
- a known installed workflow whose instructions are already loaded and unchanged.

## Success condition

Routing succeeds only when it improves the user's actual outcome. The objective is continuous, verified execution with the least unnecessary context and tool overhead, not proving that a Skill was invoked.