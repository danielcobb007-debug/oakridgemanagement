# BRANCH_AND_DEPLOYMENT_RECONCILIATION_PLAN

## Purpose

This document defines a safe operational reconciliation path between the current live deployment model and the intended governance-aligned branch and deployment model for the ORM ecosystem.

It is designed to move the ecosystem toward a clearer operational structure without destabilizing currently live public properties.

This plan is governed by:

- `SYSTEM_OF_RECORD.md`
- `DEPLOYMENT_AUTHORITY_MAP.md`
- `ENVIRONMENT_AND_BRANCH_MATRIX.md`
- `REPO_OWNERSHIP_MAP.md`

This is a controlled transition document.

It is not:

- a branch rename instruction
- a same-day deployment cutover checklist
- a Netlify reconfiguration guide
- a repository restructuring plan
- a modernization mandate

Its purpose is to preserve continuity first, and improve governance alignment second.

---

# 1. Current-State Operational Assessment

## Verified current state

Current verified production condition:

- `oakridgemanagement.net` currently deploys from the GitHub `master` branch through Netlify
- that production environment is live and stable
- current governance framework envisions a future structured model:
  - `main` → production
  - `staging` → pre-production
  - `dev` → active development

## Operational meaning

This means the ecosystem currently has a gap between:

- actual production deployment behavior
and
- intended governed branch/environment model

## Assessment

The current production model is operationally valid but governance-transitional.

It should be treated as:

- stable
- real
- protected
- not yet final-state governance alignment

---

# 2. Governance Drift Summary

## Primary drift

The main source of drift is that production authority is currently tied to `master`, while governance intends a future model centered on:

- `main`
- `staging`
- `dev`

## Secondary drift

Additional likely drift areas include:

- inconsistent branch conventions across repositories
- Netlify deployment assumptions tied to legacy branch naming
- incomplete staging discipline across the ecosystem
- branch naming that may reflect historical behavior rather than approved long-term governance

## Drift interpretation rule

This drift does not mean the current system is broken.

It means the current system is:

- operationally working
- governance-incomplete
- in need of controlled reconciliation rather than abrupt correction

---

# 3. Risks of Immediate Branch Restructuring

Immediate branch restructuring would create disproportionate operational risk.

## Risk 1: accidental production interruption
If Netlify is currently bound to `master`, changing branch names or production source prematurely could break public deploy continuity.

## Risk 2: unclear branch authority during transition
Renaming or repointing branches before environment protections are formalized could create ambiguity about which branch is authoritative.

## Risk 3: hidden workflow dependencies
Existing deploy hooks, previews, contributor habits, or Netlify settings may still assume `master`.

## Risk 4: cross-repo inconsistency
If one repo changes branch governance before others are ready, the ecosystem may become more confusing rather than less.

## Risk 5: AI-assisted confusion
AI systems operating under a future-state assumption could misinterpret current branch authority and recommend unsafe actions.

## Risk 6: governance appearing stronger than runtime reality
A branch model that exists only in documents but not in deploy plumbing becomes a trap if treated as already active.

---

# 4. Recommended Phased Reconciliation Strategy

## Phase 1: document and freeze current production truth
Treat the current live state as the protected operational baseline.

Goals:
- explicitly document that `master` is current production authority for `oakridgemanagement.net`
- prevent accidental branch redefinition
- stop implicit assumptions from spreading

## Phase 2: establish future-state branch model in governance only
Continue using:
- `main` = intended future production branch
- `staging` = intended future pre-production branch
- `dev` = intended future active development branch

But do not activate this operationally yet unless validated.

## Phase 3: map actual branch and Netlify dependencies
Before any branch cutover:
- inventory Netlify branch settings
- inventory preview behavior
- inventory branch protections
- inventory CI/CD assumptions if present
- inventory contributor workflows tied to `master`

## Phase 4: create a controlled shadow alignment path
When ready, use a controlled transition path such as:
- keep `master` as live production source temporarily
- validate `main` as a production-candidate mirror branch
- validate `staging` as pre-production branch
- validate `dev` as non-production branch

## Phase 5: cut over only after all protections are confirmed
Only once branch parity, Netlify config, rollback, and approval rules are all confirmed should production branch authority be reassigned.

---

# 5. Netlify Transition Considerations

## Netlify principle

Netlify is part of the operational control surface.
It must be transitioned carefully and only after branch authority is understood.

## Key Netlify considerations

Before any production branch transition, verify:

- which branch is currently configured as the production branch
- whether branch deploys or deploy previews are enabled
- whether redirects or environment variables differ by branch
- whether forms, identity, and protected routes rely on current production branch behavior
- whether there are unpublished but important provider-side settings not reflected in repo files

## Netlify rule

Do not treat Git branch changes as independent from Netlify.

In this ecosystem, branch authority and Netlify production authority are coupled operationally.

---

# 6. GitHub Branch Migration Considerations

## GitHub principle

GitHub branch migration must follow operational safety, not naming preference.

## Required considerations

Before any future migration:
- confirm `master` history integrity
- confirm whether `main` already exists and whether it is current or stale
- confirm whether `staging` is actively used
- confirm whether `dev` exists or would be introduced later
- confirm branch protection rules
- confirm collaborator expectations and current habits

## Branch migration rule

A future branch model should be introduced through controlled equivalence, not symbolic renaming alone.

The question is not “what should the branch be called?”
The question is “which branch is actually trusted to deploy and roll back production safely?”

---

# 7. Deployment Continuity Protections

## Continuity principle

The current stable production surface must remain protected throughout any branch reconciliation.

## Required protections

- do not interrupt `oakridgemanagement.net` production continuity
- do not change production branch mapping during unrelated content or governance updates
- do not combine branch migration with major route, canonical, or domain changes
- keep a known-good production reference branch during transition
- ensure the current production deploy source remains restorable

## Continuity rule

Branch governance reconciliation must be operationally reversible at every meaningful step.

---

# 8. Rollback Protections

## Rollback principle

Rollback must be defined before branch authority changes, not after.

## Rollback requirements

Before any branch cutover:
- preserve current `master` production state
- confirm ability to redeploy prior known-good production from current production branch
- confirm Netlify can be repointed back if needed
- confirm that branch cutover can be reversed without route or content drift
- confirm that governance docs still recognize the transitional safety model until cutover is complete

## Rollback rule

No production branch transition should occur unless rollback is simpler than the migration itself.

---

# 9. AI-Agent Operational Protections

## AI principle

AI agents must not act as though the future branch model is already live.

## AI protections

AI systems must:
- treat `master` as the verified current production branch for `oakridgemanagement.net`
- treat `main/staging/dev` as intended future governance model unless production cutover is explicitly completed
- avoid recommending direct branch renames or deploy changes without current-state validation
- avoid conflating repo governance targets with live operational truth

## AI rule

AI may describe the target model.
AI must not silently substitute it for the current live model.

---

# 10. Transitional-State Governance Rules

## Transitional branch rule

Until production branch reconciliation is formally completed:

- `master` remains the current operational production branch for `oakridgemanagement.net`
- `main`, `staging`, and `dev` remain governance-target branches unless explicitly activated
- no document should imply the production transition has already occurred

## Transitional deployment rule

A future-state branch model may be documented now, but operational authority must remain tied to verified live deployment behavior until migration is complete.

## Transitional communication rule

All branch-related documentation during transition should clearly label:
- current verified state
- intended future state
- migration not yet executed

---

# 11. Safe Sequencing Order

1. Confirm and document current Netlify production branch for each live property.
2. Confirm current GitHub branch inventory and actual usage.
3. Mark `master` as protected current production truth for `oakridgemanagement.net`.
4. Validate whether `main` is suitable to become the future production branch.
5. Validate whether `staging` can safely become a pre-production branch.
6. Decide whether `dev` is needed immediately or later.
7. Create branch-role parity and contributor guidance before any cutover.
8. Test Netlify branch reassignment in a controlled, non-production-safe way if possible.
9. Approve rollback plan.
10. Cut over only after validation and explicit approval.
11. Update governance docs only once the operational transition is actually complete.

---

# 12. Validation Checkpoints

## Checkpoint 1: current-state confirmation
- `master` confirmed as current production branch
- Netlify production settings verified
- current production deploy stable

## Checkpoint 2: future-branch readiness
- `main` confirmed to reflect desired production-candidate state
- `staging` confirmed usable for pre-production review
- no hidden branch conflicts

## Checkpoint 3: deploy-path readiness
- branch-linked deploy behavior understood
- redirects, auth, and forms unaffected by branch swap
- environment variable behavior understood

## Checkpoint 4: rollback readiness
- known-good production preserved
- repointing production branch is reversible
- responsible operator knows the rollback sequence

## Checkpoint 5: governance alignment confirmation
- documents updated only when reality matches them
- no remaining ambiguity about production branch authority

---

# 13. Conditions Required Before Migration

The branch/deployment reconciliation should not proceed until all of the following are true:

- current production branch mapping is fully verified
- `main` is confirmed as a valid future production candidate
- `staging` is operationally viable or deliberately deferred
- Netlify settings have been inventoried
- rollback procedure is explicitly documented
- no simultaneous high-risk canonical, route, or domain migration is underway
- human approval is explicit
- AI workflows are updated to reflect transitional truth

---

# 14. Deferred Decisions

The following decisions may be deferred until after branch authority is stabilized:

- whether `dev` is needed immediately
- whether all repos must adopt identical branch naming at the same time
- whether future preview environments should be standardized
- whether Netlify should remain the long-term deployment system
- whether later repo consolidation changes branch policy
- whether branch protections need to be expanded beyond production-critical repos

Deferred means “not yet required for safe reconciliation,” not “unimportant.”

---

# 15. Explicit Anti-Chaos Rules

The following rules are mandatory.

## Anti-Chaos Rule 1
Do not rename `master` simply because the future model prefers `main`.

## Anti-Chaos Rule 2
Do not cut production over to `main` without explicit Netlify and rollback validation.

## Anti-Chaos Rule 3
Do not combine branch transition with route, domain, canonical, or protected-surface restructuring.

## Anti-Chaos Rule 4
Do not allow documentation to imply a branch transition has occurred before it actually has.

## Anti-Chaos Rule 5
Do not standardize all repos at once unless each repo is independently ready.

## Anti-Chaos Rule 6
Do not let AI agents assume future branch authority as present tense operational truth.

## Anti-Chaos Rule 7
Do not replace stable ambiguity with unstable certainty.

## Anti-Chaos Rule 8
Production continuity outranks branch aesthetic preference.

---

# Operational Summary

## Current truth
- `master` currently powers `oakridgemanagement.net` production through Netlify.
- That state is stable and must be preserved.

## Future target
- `main` → production
- `staging` → pre-production
- `dev` → active development

## Reconciliation principle
Move toward the governed model only through:
- verification
- staged alignment
- rollback readiness
- explicit approval
- minimal disruption

## Final rule
The ORM ecosystem should reconcile branch and deployment governance deliberately, not symbolically.

Stable production is an asset.
Governance alignment should protect it, not endanger it.