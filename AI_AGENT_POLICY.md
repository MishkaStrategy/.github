# MishkaStrategy AI Agent Policy

**Policy version:** 3.0  
**Updated:** 2026-08-21  
**Scope:** repositories owned by `MishkaStrategy`  
**Status:** canonical organization default

## Purpose

This policy intentionally does **not** define artificial execution limits for AI work.

It does not set or imply limits, targets, quotas, thresholds, or cadence for session duration, response duration, reasoning effort, model choice, context usage, tool calls, messages, commits, pull requests, CI runs, reviews, milestones, work cycles, handoffs, rotation, or execution pace.

## Instruction precedence

When instructions conflict, use this order:

1. platform system, safety, permission, and sandbox rules;
2. the user's explicit current request;
3. applicable repository-specific instructions, security/release policy, and project governance;
4. this organization policy;
5. normal agent defaults.

## Repository source of truth

GitHub is the source of truth for repository state unless a repository explicitly defines another canonical source.

Verify repository state as needed for the work being performed.

## Execution

Use the available capabilities, tools, Skills, Plugins, repository context, and engineering judgment needed to carry out the user's request.

The organization policy imposes no additional limits on how long to work, how deeply to reason, how many steps or tools to use, how many milestones to complete, when to stop, when to hand off, or when to start a new chat.

## Repository-specific rules

Repository-specific security, release, ownership, compatibility, testing, CI, architecture, and operational rules remain applicable to their repositories.

This organization policy does not add session-management, model-management, reasoning-management, context-management, routing-management, or pacing rules on top of them.

## Policy maintenance

Keep organization-wide policy minimal. Project-specific requirements belong in the repository that owns them.