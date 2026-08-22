# ECHO HQ Ruleset Bootstrap

## Purpose

This bootstraps the trusted organization-side merge boundary for the ChatGPT-only ECHO HQ pilot.

The required workflow lives in `MishkaStrategy/.github`, outside the ECHO pull request being evaluated. ECHO pull requests cannot modify this source workflow.

## Bootstrap order

1. Merge the trusted-gate PR in `MishkaStrategy/.github` after review.
2. From a fresh checkout of `MishkaStrategy/.github` on `main`, run:

   ```bash
   bash scripts/apply_hq_rulesets.sh
   ```

3. Re-read organization rulesets and confirm both are `active`:
   - `HQ policy source protection`
   - `ECHO HQ main gate`
4. Trigger a new event on the ECHO pilot PR (a new commit, or close/reopen if appropriate) so GitHub evaluates the newly required workflow.
5. Confirm the required organization workflow runs for the exact ECHO PR head.

The GitHub token used by `gh` must have organization `Administration: write` permission. The bootstrap script refuses any organization other than `MishkaStrategy`.

## Ruleset intent

### HQ policy source protection

Targets the default branch of repository id `1330499424` (`MishkaStrategy/.github`) and:

- requires changes through pull requests;
- blocks branch deletion;
- blocks force pushes;
- requires review conversations to be resolved.

No bypass actor is configured by these payloads.

### ECHO HQ main gate

Targets the default branch of repository id `1341969468` (`MishkaStrategy/ECHO`) and:

- requires changes through pull requests;
- blocks branch deletion;
- blocks force pushes;
- requires review conversations to be resolved;
- requires `.github/workflows/hq-trusted-echo.yml` from `MishkaStrategy/.github@main` to pass before merge.

The organization workflow uses `pull_request`, as required for a GitHub ruleset workflow. It executes only trusted policy code. It does not execute ECHO project code.

## Legacy ECHO pull requests

ECHO already had open pull requests before issue #31 introduced `HQ_STATE`. To avoid rewriting or falsely reclassifying historical work, pull requests created before `2026-08-22T17:57:04Z` are grandfathered when they contain no `HQ_STATE` block.

This does not make those pull requests accepted or release-ready. Their existing draft, dependency and acceptance gates remain authoritative.

All newly created ECHO pull requests must contain exactly one valid `HQ_STATE` block.

## High-risk boundary

The trusted workflow classifies workflow/action configuration, `.hq/**`, release gates, dependency metadata, integrations, adapters/manifests, release/deploy/auth/secrets paths as high risk. A new HQ-managed pull request touching any of those paths must declare `human_approval_required=true`.

For the ChatGPT-only pilot, high-risk changes remain non-autonomous at merge time. GitHub rulesets provide the deterministic no-direct-push / no-force-push / required-workflow boundary; explicit human authorization for high-risk merges remains an HQ policy requirement.

## Why the source repository is protected too

A required organization workflow is only a meaningful trust boundary if its source cannot be replaced by a direct push. Therefore source protection is applied before ECHO autonomous merge can ever be enabled.
