# ENVIRONMENT_AND_BRANCH_MATRIX

## Purpose

This document defines the authoritative operational mapping between:

- repositories
- branches
- deployment environments
- canonical domains
- staging workflows
- rollback relationships
- AI-agent operational restrictions

Its purpose is to prevent:

- environment ambiguity
- branch misuse
- accidental production promotion
- staging/production confusion
- unauthorized deployment
- repo/domain misalignment
- preview environments becoming de facto production
- AI-assisted environment misuse
- future monorepo rollout confusion

This is an operational governance document.

It is not:

- a CI/CD implementation manual
- a hosting provider configuration file
- a DNS or registrar document
- a branch-protection technical ruleset
- a deployment script reference

This matrix must remain subordinate to:

- `SYSTEM_OF_RECORD.md`
- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `REPO_OWNERSHIP_MAP.md`
- `DEPLOYMENT_AUTHORITY_MAP.md`

---

# 1. Purpose of Environment Governance

An environment is not just a technical destination.
It is an operational state with governance meaning.

If environment governance is weak, then:

- staging can become shadow production
- preview deployments can confuse canonical authority
- branch names can be mistaken for approval
- one repo can appear to control the wrong public surface
- AI-assisted deploy activity can bypass review discipline
- rollback relationships become unclear under stress

Environment governance therefore exists to ensure:

- each environment has a defined institutional role
- branches map predictably to environments
- domains map predictably to authorized repos
- public production is protected
- staging remains non-canonical
- preview and sandbox states remain non-authoritative
- future multi-property deployment remains governable

---

# 2. Environment Classifications

## Environment Classes

The ORM ecosystem recognizes the following environment classes.

### Production
Public, canonical, institutionally authoritative deployment environment.

### Staging
Pre-production validation environment used for controlled review, testing, and governed iteration.

### Preview
Temporary or branch-scoped validation environment used for review of isolated changes. Not authoritative.

### Development
Local or developer-controlled environment used for implementation and debugging. Not authoritative.

### Sandbox
AI-assisted or experimental environment used for exploration, prototyping, or validation without public authority.

### Internal / Restricted
Non-public or access-controlled environment used for gated workflows, internal review, or privileged access.

## Classification Rule

An environment’s existence does not grant authority.

Its governance classification determines its authority.

---

# 3. Production Environment Definitions

## Production Principle

Production is the canonical public implementation state.

Production must reflect:

- approved governance
- approved hierarchy
- approved domains
- approved ownership relationships
- approved public narrative

## Production Environment Definition

A production environment is any environment that:

- serves canonical public traffic
- resolves to a canonical domain
- is intended to represent current public truth
- is relied upon as the official public surface

## Current Known Production Domain Targets

### `oakridgemanagement.net`
Production role:
- ORM parent platform

### `cehstandard.com`
Production role:
- CEH Standard canonical public home

### `cehinfrastructureindex.com`
Production role:
- CEH Infrastructure Index canonical public home

### DGE&I public target
Production role:
- execution/reference surface only
- official domain still to be formally designated

## Production Rule

No production environment may exist without explicit domain, repo, and governance alignment.

---

# 4. Staging Environment Definitions

## Staging Principle

Staging exists to validate changes before they become production truth.

Staging is a governance-supported environment, but not a canonical authority surface.

## Staging Environment Definition

A staging environment is any environment that:

- receives pre-production changes
- is used for validation and governance review
- is not the canonical public surface
- is expected to be disposable or promotable

## Staging Use Cases

Staging may be used for:

- narrative review
- layout review
- route review
- access-control review
- canonical verification before promotion
- AI-assisted output validation
- migration rehearsal
- rollback rehearsal

## Staging Rule

Staging must not imply canonical authority, even if it is publicly reachable.

---

# 5. Development / Sandbox Environment Definitions

## Development Principle

Development environments exist for building and testing, not authority.

## Development Environment Definition

A development environment is any local or controlled environment used for:

- implementation
- debugging
- design iteration
- content drafting
- route testing
- non-canonical validation

## Sandbox Environment Definition

A sandbox environment is any experimental environment used for:

- AI-assisted experimentation
- structural exploration
- concept validation
- non-production proofing
- tool or runtime inspection

## Development / Sandbox Rule

Development and sandbox environments may not be treated as approval, release, or canonical signals.

---

# 6. Branch Authority Hierarchy

## Branch Principle

Branches represent workflow state, not institutional truth.

## Branch Authority Order

From highest to lowest operational authority:

1. approved production branch
2. approved staging branch
3. approved feature/review branches
4. temporary AI-generated branches
5. local-only untracked or unpublished branch states

## Standard Branch Meaning

### `main`
Default meaning:
- production-safe branch
- stable release branch
- candidate source for production environments

### `staging`
Default meaning:
- review branch
- validation branch
- pre-production integration branch

### feature branches
Default meaning:
- isolated work branches
- candidate review branches
- not production-authoritative

### AI-created branches
Default meaning:
- non-authoritative working branches
- no implicit production or staging authority

## Branch Rule

A branch becomes authoritative only within a governed environment mapping.

---

# 7. Branch-to-Environment Mapping

## Standard Branch Mapping

### `main`
Maps to:
- canonical production environment
- production release candidate state

### `staging`
Maps to:
- staging environment
- pre-production validation surface

### feature branches
Map to:
- preview environments
- local development environments
- sandbox validation

### AI-created branches
Map to:
- preview or sandbox only
- never directly to canonical production by default

## Mapping Rule

Branch-to-environment mapping must be explicit.

A branch may not gain production authority merely because a provider is technically capable of deploying it.

---

# 8. Repo-to-Environment Mapping

## Repository 1: `oakridgemanagement`

Current environment role:
- active mixed-scope public deployment source
- governance workspace anchor
- transitional deployment repository

Recommended environment classification:

### Production
- ORM parent production surface
- CEH Standard production surface where currently authorized

### Staging
- staging environment aligned to `staging` branch where configured

### Development / Sandbox
- local and branch preview usage only
- must remain non-canonical

## Repository 2: `ceh-pricing-engine`

Current environment role:
- active CEH Infrastructure Index deployment source

Recommended environment classification:

### Production
- CEH Infrastructure Index production surface

### Staging
- if implemented, should be non-canonical pre-production validation environment

### Development / Sandbox
- branch preview or local sandbox only

## Repo-to-Environment Rule

A repo’s environment role must not exceed its governance-approved entity scope.

---

# 9. Repo-to-Domain Mapping

## Official Current Mapping

### `oakridgemanagement`
Authorized public production domains:
- `oakridgemanagement.net`
- `cehstandard.com`

### `ceh-pricing-engine`
Authorized public production domain:
- `cehinfrastructureindex.com`

## Transitional Warning

Even where repos are operationally active, repo location does not redefine entity ownership.

## Repo-to-Domain Rule

No repo may deploy to a new public domain without explicit governance approval and registry alignment.

---

# 10. Promotion Flow Rules

## Promotion Principle

Promotion is the act of moving a change from lower-authority environment to higher-authority environment.

Promotion must be explicit and governed.

## Standard Promotion Flow

### Normal flow
1. Development or sandbox
2. Preview or feature validation
3. Staging
4. Production approval
5. Production deployment

### Simplified safe flow for low-risk content
1. Staging validation
2. Production approval
3. Production deployment

## Promotion Rule

Promotion must not skip governance review when the change affects:

- entity boundaries
- canonical domains
- redirects
- public ownership language
- nav hierarchy
- access control
- repo/domain mapping

## Anti-Shortcut Rule

Technical convenience does not justify bypassing staging or approval where boundary risk exists.

---

# 11. Rollback Relationship Rules

## Rollback Principle

Every production environment should have a clear rollback relationship to a previously valid state.

## Rollback Relationships

### Production rollback
Must be able to revert to:
- prior approved production state
- known-good deploy target
- known-good branch state or release artifact

### Staging rollback
Must be able to revert to:
- prior valid staging state
- previously reviewed integration state

### Preview / sandbox rollback
May be discarded or replaced without formal rollback, provided they do not affect production truth

## Rollback Rule

Rollback authority remains governed by `DEPLOYMENT_AUTHORITY_MAP.md`.

Rollback paths must be known before high-risk production promotion occurs.

---

# 12. AI-Agent Environment Restrictions

## AI Principle

AI may interact with environments only within explicit operational limits.

## AI Restrictions by Environment

### Production
AI may:
- audit
- compare
- validate
- recommend

AI may not:
- deploy
- promote
- rollback
- rebind domains
- alter environment mappings without explicit approval

### Staging
AI may:
- support testing
- propose fixes
- validate behavior
- help compare staging vs production

AI may not:
- treat staging as self-authorizing for production

### Preview / Sandbox
AI may:
- operate most freely here for read/write work when approved by human workflow
- prototype and validate ideas
- compare environment behavior

AI may not:
- redefine production or canonical rules through preview usage

## AI Rule

AI environments are subordinate to human-governed environment authority.

---

# 13. Protected-Environment Rules

## Protected Environment Principle

Certain environments require heightened control because they shape public institutional truth.

## Protected Environments

The following are protected by default:

- all production environments
- any environment bound to a canonical domain
- any environment serving gated partner or investor material
- any environment controlling canonical redirects
- any environment holding sensitive environment-variable mappings

## Protection Rules

Protected environments require:

- explicit human approval for structural changes
- governed branch mapping
- governed rollback capability
- governed secrets handling
- governed domain mapping
- no AI-autonomous promotion

---

# 14. Preview Deployment Rules

## Preview Principle

Preview deployments are useful for speed and safety, but must remain operationally non-authoritative.

## Preview Rules

Preview environments may be created for:

- feature branches
- review branches
- AI-assisted iterations
- design review
- route validation
- migration rehearsal

Preview environments must not:

- use canonical domains
- present themselves as production truth
- override canonical tags intentionally
- replace governance review
- become unofficial staging replacements without approval

## Preview Rule

A preview deployment is a review artifact, not a public authority surface.

---

# 15. Future Monorepo Environment Implications

## Monorepo Environment Principle

A future monorepo may centralize source control while preserving distinct environment authority by property.

## Monorepo Implications

A future ORM monorepo should still support separate environment matrices for:

- ORM parent site
- CEH Standard
- CEH Infrastructure Index
- DGE&I surface
- shared services or internal tools where approved

## Monorepo Mapping Rule

Even inside one repo, each property should retain:

- its own production environment identity
- its own staging environment identity
- its own canonical domain relationship
- its own rollback path
- its own promotion approval path

## Anti-Collapse Rule

A monorepo must not turn multiple entity environments into one undifferentiated deployment surface.

---

# 16. Environment Drift Remediation

## Drift Principle

Environment drift occurs when environment meaning diverges from approved governance.

## Environment Drift Examples

Examples include:

- staging behaving like production
- preview environments carrying canonical behavior
- branch/environment mismatch
- repo/domain/environment mismatch
- unauthorized production deploy from non-production branch
- protected environment changes without approval
- AI-created branch becoming de facto release branch
- DGE&I or CEH Index surface appearing under wrong environment authority

## Remediation Authority

Environment drift remediation authority resides with:

- Daniel Cobb
- ORM governance authority
- approved operational deployment control

## Remediation Actions

Governance may require:

- rollback
- environment freeze
- redirect correction
- branch mapping correction
- deploy target reassignment
- canonical tag correction
- provider configuration correction
- preview shutdown
- staging reset
- documentation correction

## Final Drift Rule

If environment behavior and governance disagree, governance wins and the environment must be corrected.

---

# Environment and Branch Summary Matrix

## Canonical Production Relationships

- `oakridgemanagement.net` ← ORM parent production
- `cehstandard.com` ← CEH Standard production
- `cehinfrastructureindex.com` ← CEH Infrastructure Index production
- DGE&I official production surface ← pending formal domain designation

## Standard Branch Relationships

- `main` → production-safe branch
- `staging` → pre-production validation branch
- feature branches → preview / review
- AI-created branches → sandbox / preview only unless explicitly promoted

## Standard Promotion Path

- dev/sandbox → preview → staging → approved production

## Top-Level Rule

Environment state does not define authority.
Governance defines authority.

## Final Principle

The ORM ecosystem may expand into more repos, more environments, and eventually a monorepo with multiple deploy targets.

But every environment must always answer five questions clearly:

- Which repo owns it?
- Which branch feeds it?
- Which entity does it represent?
- Which domain does it serve?
- Who is authorized to promote or roll it back?

If any of those answers are unclear, the environment is not yet governed enough to be trusted.