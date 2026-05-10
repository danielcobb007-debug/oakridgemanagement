# REPO_OWNERSHIP_MAP

## Purpose

This document defines the official repository governance structure for the Oak Ridge Management ecosystem.

Its purpose is to prevent:

- uncontrolled repository sprawl
- duplicate deploy targets
- ownership ambiguity
- migration confusion
- repo-level narrative drift
- accidental restructuring by convenience
- premature monorepo consolidation
- overlapping public website authority
- duplicated shared assets and systems across repos

This is a governance document.

It is not:

- a Git workflow tutorial
- a branch protection configuration file
- a CI/CD implementation guide
- a deployment script specification
- a code architecture document

This document governs:

- official repository roles
- ownership and hierarchy
- deployment authority by repository
- migration status
- archive/deprecation handling
- AI-agent interaction rules
- future consolidation rules

All repos, branches, websites, deployments, migrations, and AI-assisted work must conform to this map.

---

# 1. Purpose of Repo Governance

Repositories are institutional assets, not merely storage locations for code.

A repository can imply:

- ownership
- deployment authority
- public brand responsibility
- canonical content authority
- product boundaries
- operational control

Without explicit repo governance, repositories drift into overlapping roles, duplicate public surfaces, and ambiguous ownership.

Repo governance exists to ensure that:

- ORM remains the parent governance layer
- CEH Standard remains distinct from CEH Infrastructure Index
- DGE&I remains distinct from standards and parent governance
- live repos do not outgrow their approved institutional purpose
- new repos are not created casually
- future monorepo consolidation follows governance readiness, not convenience

---

# 2. Official Repository Registry

## Repository 1: `oakridgemanagement`

Official role:

- currently active public website repository
- current deployment source for ORM parent site
- current deployment source for CEH Standard public site
- current governance workspace anchor
- current transitional host for selected operational and governance files

Primary current public responsibilities:

- `oakridgemanagement.net`
- `cehstandard.com`

Current institutional classification:

- transitional mixed-scope repository
- operationally active
- governance-sensitive
- not yet a clean final-state monorepo

Future direction:

- likely foundation for ORM-controlled monorepo transition
- must not be treated as final architecture in its current state

## Repository 2: `ceh-pricing-engine`

Official role:

- currently active CEH Infrastructure Index repository
- current deployment source for CEH Infrastructure Index public property
- current product-layer implementation repo

Primary current public responsibilities:

- `cehinfrastructureindex.com`

Current institutional classification:

- active product-layer repository
- product-specific
- governance-sensitive
- operationally independent until formal migration planning is approved

Future direction:

- potential future migration into ORM-controlled monorepo under CEH Index domain structure
- must remain operationally independent until boundary and domain governance are stabilized

## Future Repositories

No additional ecosystem repository should be treated as official unless explicitly added to this registry.

Unregistered repos have no official authority by default.

---

# 3. Repo Ownership Hierarchy

## Parent Repo Governance Principle

Repository hierarchy must reflect institutional hierarchy.

Institutional hierarchy:

1. Oak Ridge Management
2. CEH Standard
3. CEH Infrastructure Index
4. DGE&I

Repository ownership must not imply an inverted structure.

## Repo Ownership Rules

ORM is the governance parent for all official ecosystem repositories.

This means:

- ORM governs repo purpose
- ORM governs repo migration strategy
- ORM governs repo consolidation timing
- ORM governs shared asset policy
- ORM governs public-facing ownership language
- ORM governs canonical deployment interpretation

CEH Standard may have implementation within an ORM-governed repo, but that does not make CEH the parent repo authority.

CEH Infrastructure Index may have its own active repo, but that does not make it independent of ORM governance.

DGE&I-related code or materials may exist in a repo, but that does not make DGE&I the owner of the repo unless explicitly defined.

## Anti-Inversion Rule

No repository structure, naming convention, or deployment pattern may imply that:

- DGE&I is the parent entity
- CEH Infrastructure Index controls ORM
- CEH Standard controls ORM
- website implementation repo convenience overrides governance ownership

---

# 4. Deployment Authority Rules

## Deployment Authority Principle

A repository may deploy content, but deployment authority must remain aligned with institutional governance.

Deploy capability does not equal strategic ownership.

## Deployment Authority by Repo

### `oakridgemanagement`
May currently deploy:

- ORM parent public content
- CEH Standard public content
- approved supporting materials consistent with ORM governance

May not be used to redefine:

- CEH Infrastructure Index canonical ownership
- DGE&I parent-platform status
- official institutional hierarchy

### `ceh-pricing-engine`
May currently deploy:

- CEH Infrastructure Index public content
- approved product-layer pages
- approved access flows and product intelligence surfaces

May not be used to redefine:

- ORM as a product sub-brand
- CEH Standard as subordinate to the Index
- DGE&I as owner of CEH or ORM

## Deployment Authority Rule

No repository may change the public meaning of an entity merely by hosting its files.

---

# 5. Production vs Staging Authority

## Environment Authority Principle

Production and staging environments are governance-controlled states, not only technical states.

## Production Authority

Production branches and production deployments must represent:

- approved public state
- governance-reviewed public narrative
- correct ownership framing
- canonical domain correctness

Production authority remains subject to final human approval.

## Staging Authority

Staging environments may be used for:

- validation
- architecture testing
- content review
- controlled AI-assisted iteration
- pre-production audit

Staging does not authorize:

- governance drift
- narrative experimentation that contradicts approved hierarchy
- silent deploy-boundary changes
- canonical URL ambiguity

## Cross-Repo Environment Rule

Production/staging discipline should become standardized across official repositories, but must not be forced through premature consolidation.

If one repo has weaker branch discipline than another, the solution is governance alignment, not immediate merge.

---

# 6. Governance Repo Rules

## Governance Principle

Governance files must have a clearly designated home and must not fragment across repos without explicit reason.

## Governance Home Rule

The ORM governance workspace is the governing source for:

- platform hierarchy
- entity boundaries
- domain policy
- migration policy
- AI operating rules
- repo authority
- deployment governance

Other repos may contain operational docs relevant to themselves, but they must not become competing governance authorities.

## Prohibited Governance Drift

The following is prohibited:

- duplicating governance rules inconsistently across repos
- redefining ownership inside product repos
- allowing website copy to become the real governance layer by accident
- allowing AI-generated content to invent repo purpose or hierarchy

---

# 7. Website Repo Rules

## Website Repo Principle

Website repos are public presentation surfaces and therefore must remain tightly governed.

## Rules for Website Repos

A website repo must have a clearly defined entity scope.

A repo may be:

- ORM parent-layer site repo
- CEH Standard site repo
- CEH Infrastructure Index site repo
- DGE&I site repo
- transitional mixed-scope repo documented as such

A website repo must not silently expand from one institutional role into several without approval.

## Mixed-Scope Repo Rule

If a repo currently contains multiple entity layers, it must be formally classified as transitional until separation is complete.

That is the current status of `oakridgemanagement`.

## Website Authority Rule

Public page existence does not determine official hierarchy.
Governance does.

---

# 8. Shared-Services Repo Rules

## Shared Services Principle

Shared services may eventually be centralized, but shared services must not become a backdoor for collapsing entity boundaries.

## What Shared Services May Include

A future shared-services repo or monorepo shared layer may include:

- shared CSS tokens
- shared typography
- iconography
- base UI components
- form utilities
- analytics helpers
- shared authentication patterns
- deployment tooling
- QA scripts
- documentation tooling

## What Shared Services Must Not Do

Shared services must not:

- define ownership language
- replace entity-specific narrative
- flatten CEH Standard and CEH Infrastructure Index into one product
- allow DGE&I identity to leak into ORM parent systems without approval
- substitute for governance review

---

# 9. Migration-State Definitions

## Purpose

Every official repository must be classified by migration state so its role is unambiguous.

## Official Migration States

### ACTIVE
Currently live, operational, and approved for ongoing use.

### REVIEW
Still active or historically important, but undergoing governance and architecture review.

### TRANSITIONAL
Operationally valid, but not considered final-state architecture. May contain mixed responsibilities pending cleanup or separation.

### MIGRATE
Approved for planned migration into a future target structure.

### FROZEN
No new structural expansion. Maintained only for stability, preservation, or minimal updates.

### ARCHIVE
Retained for historical preservation only. No active deployment authority.

### DEPRECATED
No longer approved for active use. Must not receive new production responsibility.

## Current Recommended States

- `oakridgemanagement` = `TRANSITIONAL`
- `ceh-pricing-engine` = `ACTIVE` and `REVIEW`

This means:
- `oakridgemanagement` remains operational but is not the final structural model
- `ceh-pricing-engine` remains active but should be reviewed before any consolidation planning

---

# 10. Archive / Deprecation Rules

## Archive Principle

Repositories and files must be archived intentionally, not abandoned informally.

## Archive Rules

A repo should be archived when:

- its deployment role has ended
- its content is no longer authoritative
- its function has been formally replaced
- rollback value is low or preserved elsewhere
- governance has approved retirement

## Deprecation Rules

A repo should be marked deprecated when:

- it must not receive new public responsibilities
- a future replacement is known
- its architecture is no longer preferred
- continued use would create duplication or drift

## Archive Rule

Deprecated does not mean deleted.
Archived does not mean forgotten.
Both states require documentation.

---

# 11. AI-Agent Repo Interaction Rules

## AI-Agent Principle

AI tools may work across repos only within explicit governance boundaries.

## AI-Agent Rules

AI agents may:

- read official repos for audit and comparison
- analyze structure, duplication, and drift
- recommend migration paths
- recommend shared-services opportunities
- validate hierarchy and ownership consistency

AI agents may not:

- invent repo roles
- create duplicate systems casually
- restructure repos without approval
- merge narrative layers by convenience
- treat deploy convenience as ownership truth
- create new repos without human approval
- change canonical relationships implicitly

## Cross-Repo Rule

If an AI agent observes conflicting repo behavior between repos, the agent must treat that as governance drift, not as justification to normalize the drift.

---

# 12. Monorepo Transition Governance

## Monorepo Principle

A future ORM monorepo is a governance and operational decision, not merely a technical refactor.

## Monorepo Preconditions

A monorepo transition should not begin until the following are true:

- entity boundary map is approved
- canonical domain registry is approved
- repo ownership map is approved
- deployment authority is documented
- shared asset inventory exists
- migration inventory exists
- cross-repo duplication audit is complete
- narrative conflicts are known and triaged

## Monorepo Rule

Technical centralization must follow institutional clarity.

A monorepo must preserve:

- separate public deploy targets
- separate entity boundaries
- separate canonical domains
- separate narrative authority by layer

## Anti-Premature-Consolidation Rule

If consolidation would centralize confusion rather than centralize clarity, consolidation must wait.

---

# 13. Anti-Duplication Rules

## Duplication Principle

Duplication is a governance problem when it causes ambiguity.

Not all duplication is bad, but uncontrolled duplication is.

## Prohibited Duplication

The following should not exist in conflicting forms across official repos without explicit reason:

- competing ORM “about” definitions
- competing CEH Standard ownership definitions
- competing CEH Infrastructure Index canonical homes
- competing brand systems
- duplicate shared assets without source-of-truth designation
- duplicate deploy targets for the same public role
- duplicate governance rules with inconsistent wording

## Allowed Duplication

Temporary duplication may be tolerated when:

- migration is incomplete
- rollback safety requires it
- a transition is formally documented
- the duplication is clearly marked non-canonical

## Canonical Source Rule

If the same logical asset exists in more than one place, one location must be declared canonical.

---

# 14. Enforcement / Remediation Authority

## Enforcement Authority

Final enforcement authority resides with:

- Daniel Cobb as final human principal
- Oak Ridge Management as ecosystem governance layer

## Remediation Authority

When a repo drifts from approved role, governance may require:

- documentation correction
- deployment correction
- redirect correction
- branch governance correction
- archive/freeze classification
- migration planning
- content relocation
- shared asset normalization
- repo deprecation

## Violation Standard

The following constitute repo governance violations:

- a repo taking on unapproved public identity
- public deployment that contradicts ownership hierarchy
- creation of duplicate public product surfaces
- uncontrolled proliferation of new repos
- AI-created restructuring without approval
- canonical domain ambiguity caused by repo behavior
- product-layer repos redefining parent-platform governance

## Final Enforcement Rule

No repo, deployment, branch, or AI workflow may override institutional hierarchy through convenience, inertia, or technical implementation.

---

# Official Repository Governance Summary

## Registered Repositories

- `oakridgemanagement`
  - current role: ORM + CEH Standard public deployment + governance workspace anchor
  - state: transitional

- `ceh-pricing-engine`
  - current role: CEH Infrastructure Index public deployment
  - state: active and under review

## Governance Hierarchy

- ORM governs repositories
- CEH Standard remains ORM-owned standards layer
- CEH Infrastructure Index remains ORM-owned product layer
- DGE&I remains execution/reference layer

## Governing Principle

Repositories may evolve.
Deployments may change.
A monorepo may eventually emerge.

But repository structure must always reflect institutional truth, not convenience.