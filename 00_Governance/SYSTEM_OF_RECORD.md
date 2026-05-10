# SYSTEM_OF_RECORD

## Purpose

This document defines the official system of record for the Oak Ridge Management ecosystem.

It establishes the authoritative hierarchy for:

- governance
- entity boundaries
- repositories
- domains
- deployments
- standards
- AI systems
- branches
- migration decisions
- archives
- institutional records

This is the highest-level control index for the ORM platform.

Its purpose is to prevent:

- competing sources of truth
- ownership ambiguity
- canonical conflict
- repository drift
- deployment ambiguity
- unauthorized AI-created authority
- narrative inconsistency
- standards misclassification
- premature structural consolidation

This document is not:

- a technical architecture specification
- a CI/CD implementation guide
- a DNS configuration document
- a branch protection settings file
- a design system manual

It is the authority map that determines which records, decisions, and governance artifacts control the platform.

---

# 1. Purpose of the System of Record

A platform becomes unstable when multiple artifacts claim authority over the same question.

Examples include:

- two different documents defining ownership
- a live website contradicting governance files
- a repository implying authority it does not have
- an AI-generated draft being treated as official without approval
- a deployment configuration silently redefining canonical ownership
- a branch state being mistaken for approved production authority

The System of Record exists to answer one question clearly:

**When two artifacts conflict, which one wins?**

This document therefore defines:

- the top-level governance hierarchy
- the precedence order for governance documents
- the authority level of repositories, domains, and deployments
- the role of AI-generated work
- the approval requirements for official records
- the boundary between draft, operational, and authoritative status

---

# 2. Governance Hierarchy

## Institutional Hierarchy

The official ecosystem governance hierarchy is:

1. Oak Ridge Management
2. CEH Standard
3. CEH Infrastructure Index
4. DGE&I

## Governance Control Layer

ORM is the top-level governance authority for the ecosystem.

ORM governs:

- ownership structure
- standards ownership
- public hierarchy
- repository authority
- domain authority
- deployment authority
- migration authority
- AI governance
- archive authority
- shared services governance
- monorepo transition governance

## Human Principal Authority

Final human authority resides with:

- Daniel Cobb

Daniel Cobb is the final approving authority for:

- governance changes
- entity boundary changes
- canonical domain changes
- repository authority changes
- production deployment decisions
- migration approvals
- monorepo transition approvals
- archive/deprecation approvals
- AI operating policy changes

---

# 3. Authority Precedence Rules

## Core Rule

When two artifacts conflict, the higher-authority artifact governs.

## Official Precedence Order

From highest to lowest:

1. Approved human governance decision
2. `SYSTEM_OF_RECORD.md`
3. approved top-level governance boundary documents
4. approved canonical governance registry documents
5. approved migration and repo authority documents
6. approved operational governance docs
7. approved repository structure
8. approved branch/deployment state
9. live public implementation
10. AI-generated drafts and unapproved analysis artifacts

## Interpretation Rule

Implementation does not override governance.

A live deployment does not become correct merely because it exists.

A repository does not become authoritative merely because it is active.

An AI-generated artifact does not become official merely because it is written clearly.

---

# 4. Canonical Governance Documents

## Canonical Governance Core

The following documents are part of the canonical governance core:

- `MASTER_CONTEXT.md`
- `SYSTEM_MAP.md`
- `AI_CONTRACT.md`
- `NARRATIVE_SYSTEM.md`
- `AUDIT_CHECKLIST.md`
- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `REPO_OWNERSHIP_MAP.md`
- `SYSTEM_OF_RECORD.md`

## Governance Record Layer

The following documents are canonical governance records:

- `DECISIONS.md`
- `SESSION_LOG.md`
- `OPEN_LOOPS.md`

## Operational Governance Layer

The following documents are operational governance support artifacts:

- branch strategy
- deployment map
- environment variable audit
- migration inventory
- external repo inventory
- monorepo architecture planning documents

## Governance Document Rule

Only governance documents explicitly recognized by this document or added by approved decision have system-of-record authority.

All other governance-like files are advisory until recognized.

---

# 5. Canonical Repository Authority

## Repository Authority Principle

Repositories are delivery and implementation surfaces.
They are not top-level governance authorities.

## Canonical Repository Authority Source

Repository authority is governed by:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. `REPO_OWNERSHIP_MAP.md`
4. migration and operational governance documents

## Repository Control Rule

A repo may be:

- operationally active
- transitional
- under review
- canonical for a specific deploy target

But no repo may redefine:

- entity hierarchy
- domain ownership
- standards ownership
- DGE&I relationship to ORM
- monorepo timing

## Repo Authority Rule

If repository contents conflict with governance documents, governance documents win.

---

# 6. Canonical Domain Authority

## Domain Authority Principle

Domains are public authority surfaces and must follow governance-defined ownership.

## Domain Authority Source

Canonical domain authority is governed by:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. `CANONICAL_DOMAIN_REGISTRY.md`
4. deployment governance artifacts

## Domain Authority Rule

A domain may be:

- canonical
- supporting
- transitional
- redirected
- staged

But domain behavior may not redefine ownership hierarchy.

If a canonical tag, redirect, or live URL structure conflicts with governance documents, governance documents win.

---

# 7. Deployment Authority Hierarchy

## Deployment Principle

Deployments are operational manifestations of governed artifacts.

They are not the top-level source of truth.

## Deployment Authority Order

For deployment decisions, the precedence order is:

1. approved human production authorization
2. `SYSTEM_OF_RECORD.md`
3. canonical domain governance
4. repo authority governance
5. deployment rules
6. branch rules
7. CI/CD or hosting configuration
8. live deploy state

## Deployment Rule

Production presence does not equal correctness.

A misconfigured live site remains subordinate to governance authority and may require remediation even if it is currently serving traffic.

---

# 8. Branch Authority Hierarchy

## Branch Principle

Branches are workflow states, not governance authorities.

## Branch Authority Order

For branch interpretation, precedence is:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. branch strategy governance
4. deployment governance
5. repository workflow implementation
6. current branch state

## Branch Rule

Typical interpretation:

- `main` = approved production-safe branch
- `staging` = validation / pre-production branch

But branch naming alone does not grant authority.

A branch is only authoritative within the rules established by governance.

---

# 9. AI Governance Authority

## AI Authority Principle

AI systems may support, draft, audit, and validate.
They do not possess final authority.

## AI Governance Source

AI governance is controlled by:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. `AI_CONTRACT.md`
4. related governance files
5. approved prompts and workflows

## AI Role Rule

Claude may:

- draft
- build
- propose
- generate
- prototype

Codex may:

- audit
- validate
- compare
- identify duplication
- identify drift
- review structure

Neither may:

- self-authorize governance changes
- redefine ownership
- designate canonical domains
- create new authoritative records without approval
- treat drafts as final authority

---

# 10. Artifact Validity Rules

## Artifact Classes

Artifacts in the ecosystem fall into the following classes:

### Class A: Authoritative Governance Artifacts
Approved governance documents recognized by the system of record.

### Class B: Official Operational Artifacts
Approved operational records such as deployment maps, branch strategy, migration inventories, and repo registries.

### Class C: Implementation Artifacts
Code, markup, styles, deployment configs, website content, and runtime assets.

### Class D: Historical / Archive Artifacts
Archived files retained for recordkeeping but not active authority.

### Class E: Draft / AI-Generated Artifacts
Generated plans, drafts, prompts, or working documents not yet approved into the governance system.

## Validity Rule

An artifact’s clarity, completeness, or visibility does not determine authority.

Its classification and approval status determine authority.

---

# 11. Conflict Resolution Rules

## Conflict Principle

When two artifacts disagree, the conflict must be resolved by authority level, not by convenience.

## Resolution Order

When conflict occurs, resolve in this order:

1. Determine whether one artifact is explicitly authoritative
2. Check whether a higher-precedence governance document governs the issue
3. Check whether a human decision has already settled the issue
4. If unresolved, escalate for human decision
5. Log the resolution in canonical records

## Conflict Rule

Conflicts must not be silently normalized by implementation updates, redirects, or repo changes without explicit governance resolution.

---

# 12. Migration Authority Rules

## Migration Principle

Migration is a governance act, not merely a file-movement activity.

## Migration Authority Source

Migration authority is governed by:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. `REPO_OWNERSHIP_MAP.md`
4. `CANONICAL_DOMAIN_REGISTRY.md`
5. `PLATFORM_BOUNDARY_MAP.md`
6. migration inventory and monorepo planning artifacts

## Migration Rule

No migration may:

- blur entity boundaries
- merge canonical authority accidentally
- centralize duplicated confusion
- redefine DGE&I relationship by convenience
- collapse CEH Standard and CEH Index into one undifferentiated layer

Migration must follow institutional clarity, not precede it.

---

# 13. Archival Authority Rules

## Archive Principle

Archiving is a governance-controlled state change.

## Archival Authority Source

Archive decisions are governed by:

1. approved human decision
2. `SYSTEM_OF_RECORD.md`
3. repo ownership and migration governance
4. archival and deprecation policy as approved

## Archive Rule

An archived artifact may remain important historically, but it no longer serves as active authority unless explicitly reactivated.

Archives must not silently remain in public or operational decision paths as de facto sources of truth.

---

# 14. Drift Remediation Authority

## Drift Principle

Drift occurs when implementation, repo behavior, live domains, narrative, or AI outputs diverge from approved governance.

## Drift Remediation Authority

Remediation authority resides with:

- Daniel Cobb as final approver
- ORM governance system as controlling standard
- Codex as audit and drift-detection function
- Claude as implementation-support function after approval

## Drift Rule

When drift is identified, approved governance must determine:

- whether the implementation changes
- whether governance changes
- whether the issue is transitional
- whether archival action is needed
- whether migration timing must change

Drift may not be resolved by assumption.

---

# 15. Monorepo Governance Implications

## Monorepo Principle

A monorepo is an implementation pattern, not a new source of truth.

## Monorepo Governance Rule

If a future ORM monorepo is established:

- governance authority remains external to repo convenience
- canonical domains remain distinct by entity
- deployment targets remain entity-aware
- shared services remain subordinate to boundary governance
- public ownership remains governed by platform documents, not folder structure

## Monorepo Source-of-Truth Rule

A monorepo may centralize implementation, but it does not replace the governance hierarchy defined here.

---

# 16. Future Extensibility Principles

## Extensibility Principle

The system of record must support future platform growth without losing clarity.

## New Entities

If future entities, products, standards, portals, or services are added, they must be classified through:

- governance review
- boundary mapping
- domain authority assignment
- repo authority assignment
- deployment authority assignment

No new entity becomes official through mere implementation.

## New Repositories

Any new official repo must be:

- approved
- named
- classified
- entered into the repository registry
- assigned a governance role

## New Domains

Any new domain must be:

- approved
- classified as canonical or supporting
- assigned redirect and ownership rules
- entered into the canonical domain registry

## New AI Systems

Any new AI-assisted workflow must be subordinated to this governance system and may not create parallel authority.

---

# System of Record Summary

## Top-Level Rule

ORM remains the top-level governance authority.

## Human Rule

Daniel Cobb is the final approving authority.

## Document Rule

Governance documents outrank implementation artifacts.

## Repo Rule

Repositories implement authority.
They do not create it.

## Domain Rule

Domains express ownership publicly.
They do not redefine it.

## Deployment Rule

Live state does not override approved state.

## AI Rule

AI may generate artifacts.
Only approved governance may authorize them.

## Final Principle

There must be one system of record.

That system is not:

- the loudest deployment
- the most convenient repo
- the most polished AI draft
- the currently live canonical tag
- the easiest migration path

It is the explicit, governed hierarchy established here and reinforced by approved platform governance documents.