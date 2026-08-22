#!/usr/bin/env bash
set -euo pipefail

ORG="${1:-MishkaStrategy}"
if [[ "${ORG}" != "MishkaStrategy" ]]; then
  echo "Refusing to apply MishkaStrategy HQ rulesets to unexpected organization: ${ORG}" >&2
  exit 2
fi

API_VERSION="2026-03-10"
SOURCE_PAYLOAD="rulesets/hq-policy-source-main.json"
ECHO_PAYLOAD="rulesets/echo-hq-main.json"

for file in "${SOURCE_PAYLOAD}" "${ECHO_PAYLOAD}"; do
  test -f "${file}" || {
    echo "Missing ruleset payload: ${file}" >&2
    exit 2
  }
done

gh auth status >/dev/null

# The ECHO required-workflow ruleset must never point at a branch-only copy.
# Bootstrap the workflow into the source repository main branch first, then apply.
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: ${API_VERSION}" \
  "repos/${ORG}/.github/contents/.github/workflows/hq-trusted-echo.yml?ref=main" \
  >/dev/null

upsert_ruleset() {
  local name="$1"
  local payload="$2"
  local id
  local -a ids=()

  mapfile -t ids < <(
    gh api --paginate \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: ${API_VERSION}" \
      "orgs/${ORG}/rulesets" \
      --jq ".[] | select(.name == \"${name}\") | .id"
  )

  if (( ${#ids[@]} > 1 )); then
    echo "Refusing ambiguous update: multiple rulesets named '${name}'" >&2
    printf '  ruleset id: %s\n' "${ids[@]}" >&2
    exit 3
  fi

  id="${ids[0]:-}"
  if [[ -n "${id}" ]]; then
    echo "Updating ruleset ${name} (${id})"
    gh api --method PUT \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: ${API_VERSION}" \
      "orgs/${ORG}/rulesets/${id}" \
      --input "${payload}" \
      >/dev/null
  else
    echo "Creating ruleset ${name}"
    gh api --method POST \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: ${API_VERSION}" \
      "orgs/${ORG}/rulesets" \
      --input "${payload}" \
      >/dev/null
  fi
}

# Protect the policy source first so the required workflow cannot later be
# replaced by a direct push. Then enforce the ECHO gate.
upsert_ruleset "HQ policy source protection" "${SOURCE_PAYLOAD}"
upsert_ruleset "ECHO HQ main gate" "${ECHO_PAYLOAD}"

echo "Applied MishkaStrategy HQ rulesets."
gh api --paginate \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: ${API_VERSION}" \
  "orgs/${ORG}/rulesets" \
  --jq '.[] | select(.name == "HQ policy source protection" or .name == "ECHO HQ main gate") | {id, name, enforcement, target}'
