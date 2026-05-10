# DEPLOYMENT_AUTHORITY_MAP

## Purpose

This document defines the official deployment governance structure for the Oak Ridge Management ecosystem.

Its purpose is to establish authority over:

- production deployments
- staging deployments
- branch-to-environment relationships
- repo-to-domain deployment relationships
- rollback authority
- deploy approval authority
- environment-variable control
- deploy-boundary enforcement
- future multi-environment expansion

This is a governance and operational control document.

It is not:

- a Netlify configuration file
- a CI/CD implementation specification
- a hosting provider setup guide
- a branch protection ruleset
- a DNS or registrar configuration file

This document exists to prevent:

- unauthorized production deployment
- branch ambiguity
- domain confusion
- repo-level deployment drift
- accidental canonical conflicts
- AI-assisted direct-to-production behavior
- hosting convenience overriding institutional hierarchy
- premature deployment consolidation

All deployment decisions must conform to:

- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `REPO_OWNERSHIP_MAP.md`
- `SYSTEM_OF_RECORD.md`

---

# 1. Purpose of Deployment Governance

Deployments are the public operational expression of institutional structure.

If deployment governance is weak, then:

- the wrong entity can appear to own the wrong surface
- a valid repo can deploy invalid public meaning
- a branch can become a de facto authority
- a staging environment can leak into production logic
- a redirect can silently change institutional interpretation
- an AI-assisted change can become public without governance review

Deployment governance exists to ensure that:

- ORM remains the top-level governance authority
- branches do not override governance
- deploy targets do not redefine ownership
- canonical production domains remain institutionally correct
- rollback authority is explicit
- staging exists for validation, not improvisation
- future multi-site deployment remains governed even in a monorepo world

---

# 2. Deployment Authority Hierarchy

## Authority Order

From highest to lowest, deployment authority is governed by:

1. Daniel Cobb as final human approving authority
2. Oak Ridge Management as institutional governance layer
3. `SYSTEM_OF_RECORD.md`
4. `PLATFORM_BOUNDARY_MAP.md`
5. `CANONICAL_DOMAIN_REGISTRY.md`
6. `REPO_OWNERSHIP_MAP.md`
7. `DEPLOYMENT_AUTHORITY_MAP.md`
8. approved branch strategy and deployment records
9. hosting provider configuration
10. current live deploy state

## Governing Rule

Live deployment state is never the highest authority.

If a production environment conflicts with governance, the production environment is wrong until corrected.

---

# 3. Production Deployment Authority

## Production Principle

Production is the public institutional record of implementation.

Because of that, production deployment authority is tightly restricted.

## Production Authority

Production deployments may only occur under authority of:

- Daniel Cobb
- ORM-approved deployment governance
- approved branch and repo authority
- approved canonical domain mappings

## Production Requirements

Before production deployment, the following must be true:

- entity hierarchy is preserved
- domain mapping is correct
- canonical URLs are correct
- no unresolved governance conflict exists
- public narrative matches approved boundaries
- environment variables are governed
- rollback path is known
- deployment target is officially authorized for that entity

## Production Rule

No production deployment may change:

- institutional hierarchy
- canonical domain ownership
- repo authority interpretation
- CEH Standard vs CEH Index separation
- DGE&I reference-implementation status

without explicit governance approval.

---

# 4. Staging Deployment Authority

## Staging Principle

Staging is a governed validation environment.

It exists to test:

- implementation changes
- narrative updates
- design changes
- deployment behavior
- branch integration
- migration-ready changes
- AI-assisted outputs before production exposure

## Staging Authority

Staging environments may be used under ORM governance for:

- controlled testing
- pre-production validation
- branch review
- safe audit of candidate deployment changes

## Staging Limitations

Staging is not authorized to:

- redefine canonical ownership
- become a shadow production authority
- normalize conflicting entity narratives
- override domain governance
- bypass approval hierarchy

## Staging Rule

Staging may host experiments.
It may not create governance reality.

---

# 5. Branch-to-Environment Mapping

## Branch Principle

Branches are workflow states.
Environments are operational states.
The two must be mapped explicitly.

## Standard Mapping Model

### `main`
Default authority:
- production-safe branch
- approved public release branch
- stable deploy source where production is repo-branch coupled

### `staging`
Default authority:
- pre-production validation branch
- controlled review branch
- test deploy source where staging is repo-branch coupled

### feature or temporary branches
Default authority:
- non-production branches
- review or experimental branches only
- not authorized for canonical production deployment

## Cross-Repo Rule

Branch naming may vary operationally across repos today, but governance intent remains:

- production branches must be explicitly known
- non-production branches must not silently acquire production authority
- AI-created branches have no production authority by default

---

# 6. Repo-to-Domain Deployment Mapping

## Official Current Mapping

### `oakridgemanagement`
Current approved production domain responsibilities:

- `oakridgemanagement.net`
- `cehstandard.com`

Current classification:
- active but transitional mixed-scope deployment repo

### `ceh-pricing-engine`
Current approved production domain responsibility:

- `cehinfrastructureindex.com`

Current classification:
- active product-layer deployment repo

## Mapping Rule

A repo may deploy only the domains it is officially authorized to deploy.

Repo convenience does not create deployment authority for new domains.

## Domain Authority Rule

Repo-to-domain mapping must remain consistent with:

- entity boundaries
- canonical domain rules
- repo ownership rules
- production approval hierarchy

---

# 7. Rollback Authority Rules

## Rollback Principle

Rollback is a governance-controlled safety action.

Rollback authority must be explicit before production risk is accepted.

## Rollback Authority

Rollback authority resides with:

- Daniel Cobb
- ORM governance authority
- approved operational deployment control holders acting within approved authority

## Rollback Triggers

Rollback may be required when:

- canonical behavior is broken
- domain ownership signals become ambiguous
- production deploy introduces governance drift
- narrative hierarchy is violated
- access control or authentication breaks
- production deploy damages core public trust or institutional clarity

## Rollback Rule

Every production deploy should be treated as requiring a known rollback path, even when the deployment change appears minor.

---

# 8. Deployment Approval Hierarchy

## Approval Principle

Not all deployable changes carry equal governance weight.

## Approval Tiers

### Tier 1: Routine operational updates
Examples:
- approved formatting corrections
- non-structural content updates
- minor bug fixes
- non-governance visual adjustments

Approval required:
- ORM operational approval under established governance

### Tier 2: Structurally meaningful public changes
Examples:
- page hierarchy changes
- public nav changes
- major cross-link changes
- entity framing shifts
- new access workflows
- new deploy target introduction

Approval required:
- Daniel Cobb direct approval
- governance confirmation before production

### Tier 3: Boundary-affecting deployment changes
Examples:
- canonical tag changes
- domain redirection changes
- repo-to-domain changes
- deployment target reassignment
- CEH Standard / CEH Index boundary changes
- DGE&I public-role changes

Approval required:
- Daniel Cobb explicit approval
- governance documentation update
- deployment only after authoritative decision is logged

---

# 9. AI-Agent Deployment Restrictions

## AI Deployment Principle

AI systems may assist development, review, testing, and planning.
They do not possess deployment authority.

## AI Restrictions

AI agents may not:

- trigger production deploys autonomously
- change canonical production mappings autonomously
- alter hosting configuration with public effect without approval
- create new deploy targets without approval
- change domain routing or redirects without approval
- push AI-generated narrative changes to production without review

## Allowed AI Roles

AI may:

- audit deploy structure
- detect drift
- recommend staging changes
- compare branch/environment mappings
- review deployment files
- propose rollback plans
- validate whether implementation conforms to governance

## AI Rule

AI can advise deployment.
Only governed human authority can authorize it.

---

# 10. Shared Deployment Infrastructure Rules

## Shared Infrastructure Principle

Shared deployment infrastructure may exist, but it must not collapse entity boundaries.

## Allowed Shared Deployment Infrastructure

Shared infrastructure may include:

- shared CI/CD patterns
- shared preview build conventions
- shared deployment checklists
- shared monitoring conventions
- shared secrets governance framework
- shared rollback documentation standards
- shared staging naming conventions

## Restricted Shared Deployment Behavior

Shared deployment infrastructure must not:

- treat all entity surfaces as one undifferentiated site
- blur canonical domain authority
- route unrelated entity traffic through convenience redirects
- redefine CEH Standard as CEH Index or vice versa
- collapse DGE&I into ORM parent surfaces

## Shared Infrastructure Rule

Operational sharing is allowed.
Institutional flattening is not.

---

# 11. Netlify Governance Rules

## Netlify Principle

Netlify is an implementation layer, not a governance layer.

Its configuration must remain subordinate to ORM governance.

## Netlify Governance Requirements

Netlify settings must reflect:

- approved branch-to-environment mapping
- approved repo-to-domain mapping
- approved redirect behavior
- approved canonical public structure
- approved environment-variable handling
- approved auth/access rules

## Netlify Restrictions

Netlify configuration must not be used to:

- silently redefine canonical ownership
- make CEH Infrastructure Index a de facto CEH Standard subpath authority
- make DGE&I a parent-layer surface
- bypass branch governance
- turn preview behavior into unauthorized production behavior

## Netlify Rule

Provider configuration is operational.
Governance remains authoritative.

---

# 12. Environment-Variable Governance

## Environment Variable Principle

Environment variables are controlled deployment assets.

They are not implementation conveniences to be managed casually.

## Authority

Environment variable governance resides with:

- Daniel Cobb
- ORM governance authority
- approved operational deployment control

## Rules

Environment variables must:

- remain out of version-controlled source files unless explicitly safe and intended
- remain documented at governance level where appropriate
- be mapped to the correct repo/site/environment
- be reviewed before production-sensitive deploy changes
- be rotated or remediated when risk is identified

## Environment Rule

No production environment variable arrangement may create hidden authority outside governed deployment control.

---

# 13. Canonical Production Rules

## Canonical Production Principle

Production must express the official institutional topology.

## Canonical Production Rules by Domain

### `oakridgemanagement.net`
Must function as:
- ORM parent platform
- governance and ownership layer
- top-level ecosystem orientation

### `cehstandard.com`
Must function as:
- CEH Standard canonical public home
- methodology and standards layer

### `cehinfrastructureindex.com`
Must function as:
- CEH Infrastructure Index canonical public home
- product and intelligence layer

### DGE&I public surface
Must function as:
- execution/reference implementation layer only
- not parent platform
- not standards owner

## Canonical Production Rule

No production deploy may create ambiguity between:

- CEH Standard and CEH Infrastructure Index
- ORM parent platform and DGE&I execution layer
- canonical owner and convenience host

---

# 14. Drift and Unauthorized Deployment Remediation

## Drift Principle

Deployment drift occurs when production, staging, branch behavior, redirects, or environment mappings diverge from governance.

## Unauthorized Deployment Examples

Examples include:

- production deploy from unauthorized branch
- unauthorized canonical change
- unauthorized redirect change
- unapproved domain reassignment
- staging deploy behaving as public canonical target
- DGE&I content deployed in a way that implies parent authority
- product-layer repo redefining standards ownership through deployment behavior

## Remediation Authority

Remediation authority resides with:

- Daniel Cobb
- ORM governance authority
- approved operational deployment holders under explicit direction

## Remediation Actions

Governance may require:

- immediate rollback
- redirect correction
- domain canonical correction
- branch rule correction
- environment variable review
- staging/production reclassification
- deployment freeze
- documentation correction
- migration pause

---

# 15. Monorepo Deployment Implications

## Monorepo Principle

A future ORM monorepo may centralize source control, but must not centralize public identity into one blurred deploy surface.

## Monorepo Deployment Rules

If a monorepo is created, it must still preserve:

- separate deploy targets
- separate canonical domains
- separate environment mappings
- separate entity identity
- separate approval logic for boundary-affecting changes

## Monorepo Rule

A monorepo may centralize code.
It may not centralize away governance distinctions.

Deployment topology in a monorepo must remain entity-aware.

---

# 16. Future Deployment Extensibility Principles

## Extensibility Principle

Deployment governance must support future growth without losing institutional clarity.

## Future Flexibility Must Allow For

- additional staging layers
- preview environments
- QA environments
- gated/internal environments
- separate DGE&I deploy targets
- separate CEH Index subscriber surfaces
- shared infrastructure tooling with controlled boundaries
- future multi-site monorepo deployment orchestration

## Extensibility Rule

New environments, providers, or deploy targets may be introduced only if they preserve:

- ORM top-level governance authority
- canonical domain clarity
- entity separation
- branch/environment clarity
- rollback capability
- human approval hierarchy

---

# Deployment Authority Summary

## Top-Level Rule

ORM remains the top-level deployment governance authority.

## Human Rule

Daniel Cobb is the final production and rollback authority.

## Canonical Rule

Production deployments must reinforce:

- ORM parent layer
- CEH Standard methodology layer
- CEH Infrastructure Index product layer
- DGE&I execution/reference layer

## Operational Rule

Branches, repos, hosting providers, and live deploy state are all subordinate to governance.

## AI Rule

AI may assist.
AI may not authorize.

## Final Principle

Deployment convenience must never override institutional truth.