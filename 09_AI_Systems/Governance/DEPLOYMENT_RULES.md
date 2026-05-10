# DEPLOYMENT RULES

## Status

GOVERNANCE PLACEHOLDER

Detailed deployment facts require completion after the Netlify deployment audit.
Do not populate with guessed or unconfirmed information.

See open items at the bottom of this file.

---

## Core Principles

1. No direct commits to main for experimental or AI-assisted work
2. All changes flow from staging through pull request review
3. No AI-generated output reaches production without human review
4. Deployment authority is retained by Daniel Cobb

---

## Branch-to-Deployment Mapping

| Branch | Environment | Notes |
|---|---|---|
| main | Production | Confirmed Netlify auto-deploy target |
| staging | Preview/Validation | Pre-production only |

cehinfrastructureindex.com is deployed from an external repo (ceh-pricing-engine) and is governed separately until migration is confirmed.

---

## What Blocks a Deployment

- Unresolved governance violations (hierarchy errors, narrative drift)
- Unreviewed AI-generated content on a production path
- Known security issues (hardcoded credentials, exposed keys)
- Branch protection bypasses (no --no-verify, no force push to main)

---

## Open Items — Requires Netlify Audit

- [ ] Confirm build command and publish directory for each Netlify site
- [ ] Confirm exact branch each Netlify site deploys from
- [ ] Document rollback procedure per domain
- [ ] Document environment variable locations per deployment
- [ ] Establish PR review requirements before staging → main merge
- [ ] Confirm DNS ownership and registrar for each domain

---

## Related Files

- `10_Operations/NETLIFY_DEPLOYMENT_MAP.md` — domain and branch mapping
- `10_Operations/ENVIRONMENT_VARIABLES_AUDIT.md` — secrets governance
- `10_Operations/BRANCH_STRATEGY.md` — branch rules and workflow
- `09_AI_Systems/Governance/AUDIT_CHECKLIST.md` — pre-deployment checklist
