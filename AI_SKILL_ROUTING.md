# MishkaStrategy AI Skill Routing

**Policy version:** 1.2  
**Updated:** 2026-08-21  
**Scope:** ChatGPT, Codex, and compatible AI agents working on `MishkaStrategy` repositories

## Purpose

Use specialized Skills or Plugins whenever they materially improve correctness, completeness, verification, safety, or execution quality.

Routing efficiency must never become an excuse to skip a relevant specialized workflow, reduce reasoning depth, or prefer a faster but materially weaker execution path.

## When to load this policy

Load this file when:

- specialized Skill/Plugin selection is materially relevant or non-obvious;
- the work enters a specialized domain such as CI debugging, security, deployment, Figma, Cloudflare, data analysis, release engineering, or another installed workflow;
- an important capability may be missing;
- a failure or changed task stage suggests the previous routing decision should be reconsidered.

It does not need to be reread after every internal milestone if the domain and selected workflow are unchanged, but reread it whenever doing so could improve correctness.

## Routing unit: the continuous workstream

A routing decision may be reused across a continuous workstream while the domain, environment, required capability, selected Skill instructions, and higher-precedence rules remain materially unchanged.

Reuse is an I/O optimization only. It is not a reason to skip reconsideration when a new stage, failure mode, security concern, deployment step, or other specialized requirement appears.

## Selection algorithm

When routing is relevant:

1. classify the current workstream and stage;
2. inspect the capabilities available in the current environment;
3. identify the most relevant installed specialized workflow(s);
4. read the selected Skill/Plugin instructions sufficiently to follow all prerequisites, ordering, validation, and tool constraints;
5. use every materially relevant workflow needed for a correct result; avoid both unnecessary chains and under-routing;
6. discover an additional capability when an important capability is missing and discovery would materially improve or unblock the result;
7. execute the original work through implementation and verification; do not stop at routing.

Do not choose a weaker workflow solely because it is faster or uses fewer tool calls.

## Skill instruction reuse

Never infer a Skill workflow from its name alone. Read the required `SKILL.md` or equivalent instructions before first relevant use.

After that, reuse the loaded instructions while safe, but reread when:

- the Skill/version may have changed;
- a new stage depends on another section;
- the environment/capability materially changed;
- a failure suggests the remembered workflow is incomplete or stale;
- correctness would benefit from rechecking the canonical instructions.

## Multi-Skill workflows

Use multiple Skills when each has a concrete role in the requested outcome. Do not minimize the chain so aggressively that a material validation, security, deployment, or domain-specific workflow is omitted.

Example:

```text
GitHub Actions failure
-> GitHub repository/PR context
-> CI-fix workflow
-> exact-head verification
```

Avoid speculative ceremony, but prefer complete coverage over superficial speed.

## ChatGPT adapter

In ordinary ChatGPT Chat:

- keep the current chat as the user's working surface unless the user requests otherwise or a required capability is genuinely unavailable there;
- do not switch surfaces merely because the work is long or code-heavy;
- respect the product-level model/reasoning mode chosen by the user; this routing policy does not authorize lowering reasoning effort for speed;
- use native/built-in capabilities and installed Plugins/Skills when they materially improve the work;
- use discovery when an important specialized capability is missing;
- reuse a valid routing decision across the workstream, but re-evaluate it when the technical stage or requirements change;
- do not claim an arbitrary GitHub-hosted Skill was installed when the product does not support that action.

If connection, OAuth, admin approval, installation, or user confirmation is genuinely required, surface that requirement when it blocks or materially changes execution; continue independent safe work where possible.

## Codex adapter

Respect applicable `AGENTS.md` / `AGENTS.override.md` scope and precedence.

Use installed matching Skills when they materially help. Read instructions before first relevant use and reread whenever a changed stage or failure makes that useful.

Use `find-skills` or another supported discovery mechanism when a missing specialized capability would materially improve or unblock the task and the environment permits discovery/installation.

Do not reinstall or rediscover a suitable Skill unnecessarily, but do not suppress discovery merely to reduce tool calls when capability is genuinely missing.

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

## Quality floor

Routing must not reduce:

- reasoning depth;
- necessary repository/code inspection;
- security or release checks;
- test and CI verification;
- answer completeness;
- useful audits or cross-checks;
- the user's selected product-level reasoning mode.

Response latency and tool-count reduction are secondary to correctness for complex work.

## Success condition

Routing succeeds only when it improves the user's actual outcome. The objective is thorough, verified execution with sensible reuse of unchanged instructions — not minimal tool usage and not the shortest possible response.