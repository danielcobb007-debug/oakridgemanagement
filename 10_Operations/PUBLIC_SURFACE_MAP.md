# PUBLIC_SURFACE_MAP

## Purpose

This document defines the operational public-surface topology for the ORM ecosystem.

Its purpose is to establish a clear map of what each public-facing surface is intended to represent before any future:

- route restructuring
- homepage reassignment
- domain-root changes
- canonical cleanup beyond narrow corrections
- repo migration
- monorepo consolidation

This is an operational topology document.

It is not:

- a redesign brief
- a content strategy deck
- a technical routing specification
- a DNS plan
- a migration execution checklist

This document exists to prevent:

- public-surface ambiguity
- route-to-entity drift
- domain-root confusion
- protected-route spillover
- investor/public surface blending
- execution-layer narrative bleed into governance or standards surfaces
- premature consolidation of unresolved public topology

This map must remain consistent with:

- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `SYSTEM_OF_RECORD.md`
- `REPO_OWNERSHIP_MAP.md`
- `DEPLOYMENT_AUTHORITY_MAP.md`
- `ENVIRONMENT_AND_BRANCH_MATRIX.md`

---

# 1. Purpose of Public-Surface Governance

A public surface is not just a page.
It is a public authority signal.

Every domain root, route tree, login entry point, and protected surface implies:

- who the user is interacting with
- what entity owns the message
- what institution governs the page
- whether the page is public, gated, or execution-sensitive
- whether the content is parent-layer, standards-layer, product-layer, or execution-layer

Without explicit public-surface governance, the ecosystem risks:

- CEH Standard and CEH Infrastructure Index collapsing into one implied property
- DGE&I appearing to own or define ORM and CEH
- investor routes becoming mixed with public thought-leadership routes
- login systems implying the wrong platform hierarchy
- domain roots serving the wrong narrative role

Public-surface governance exists to make the public topology legible before structural changes occur.

---

# 2. Current Public Surface Inventory

## ORM / mixed-scope surface
Current primary public surface:

- `oakridgemanagement.net`

Current observed role:
- ORM parent-layer surface
- CEH Standard context and links
- partner/operator/capital framing
- investor login and protected investor portal access
- mixed public and gated ecosystem positioning

## CEH Standard surface
Current public surface:

- `cehstandard.com`

Current observed role:
- CEH Standard public home
- standards/methodology framing
- but still contains route assumptions and linking patterns that imply CEH Index adjacency or subpath-style relationship

## CEH Infrastructure Index surface
Current public surface:

- `cehinfrastructureindex.com`

Current observed role:
- CEH Infrastructure Index public/product surface
- institutional intelligence and access-request flow
- cross-links to CEH Standard and ORM context
- current operational context indicates:
  - canonical authority has been corrected toward `/ceh-infrastructure-index/`
  - but the domain root still appears to serve CEH Standard-style content or legacy-standard-adjacent assumptions in at least some surface behavior

## DGE&I-related execution and investor surfaces
Current observed public/gated surfaces:
- DGE&I references within ORM and CEH ecosystem pages
- investor-oriented and execution-sensitive paths under the broader ORM deployment model
- no fully isolated, formally designated DGE&I canonical public domain yet established in governance

---

# 3. Intended Public Surface Model

The intended public model is a four-layer ecosystem:

1. ORM parent public surface
2. CEH Standard public surface
3. CEH Infrastructure Index public/product surface
4. DGE&I execution/reference surface

Each must be legible as a distinct public layer.

## Intended representation by layer

### ORM
Represents:
- parent governance layer
- ownership layer
- ecosystem map
- platform thesis
- institutional home

### CEH Standard
Represents:
- methodology layer
- standards publication layer
- certification and benchmarking logic
- versioned standard authority

### CEH Infrastructure Index
Represents:
- product/intelligence layer
- rankings
- market intelligence
- access-controlled analytical product
- CEH-applied market interpretation

### DGE&I
Represents:
- execution/reference implementation layer
- project/deployment platform
- execution and capital formation context
- gated or role-specific operating materials where needed

---

# 4. Domain-to-Entity Mapping

## Official intended mapping

### `oakridgemanagement.net`
Entity:
- Oak Ridge Management

Role:
- parent public surface

### `cehstandard.com`
Entity:
- CEH Standard

Role:
- methodology and standards public surface

### `cehinfrastructureindex.com`
Entity:
- CEH Infrastructure Index

Role:
- product and intelligence public surface

### DGE&I domain
Entity:
- DGE&I

Role:
- execution/reference public surface

Status:
- to be formally designated

## Domain rule

A domain root must primarily represent one entity layer.

A domain may link across the ecosystem.
It may not blur which entity the root belongs to.

---

# 5. Route-to-Entity Mapping

## ORM routes
ORM routes should represent:

- parent-level orientation
- ecosystem overview
- ownership
- governance-safe public materials
- selective public partner context
- public investor entry if intentionally housed there

Examples of acceptable ORM route types:
- `/`
- `/about/`
- `/resources/`
- `/contact/`

## CEH Standard routes
CEH Standard routes should represent:

- methodology
- definitions
- whitepapers
- benchmark logic
- certification framing
- standards governance context

Examples of acceptable CEH Standard route types:
- `/`
- methodology routes
- publication routes
- standards FAQ
- validation/adoption inquiry routes

## CEH Infrastructure Index routes
CEH Index routes should represent:

- product overview
- methodology as applied to the index
- intelligence pages
- market analysis
- subscriber/advisory intake
- access request flows
- gated product extensions if approved

Examples of acceptable CEH Index route types:
- `/`
- `/about`
- `/methodology`
- `/intelligence`
- `/capital-series`
- `/request-access`
- product-specific protected areas where explicitly governed

## DGE&I routes
DGE&I routes should represent:

- execution and deployment context
- reference implementation
- project/operator/capital-facing materials
- gated execution-sensitive materials
- investor or partner workflows if intentionally assigned there

---

# 6. Root-Page Authority Rules

## Root-page principle

The root page of a domain is the strongest public authority signal for that property.

## Root-page rule by property

### ORM root
`oakridgemanagement.net/` must represent ORM first.

### CEH Standard root
`cehstandard.com/` must represent CEH Standard first.

### CEH Infrastructure Index root
`cehinfrastructureindex.com/` must represent CEH Infrastructure Index first.

### DGE&I root
Future DGE&I root must represent DGE&I first.

## Root-page prohibition

A root page must not behave as though it is a different entity merely because:

- the repo is mixed
- the deploy target is convenient
- legacy content still exists
- routing has not yet been cleaned up

---

# 7. Subpath Authority Rules

## Subpath principle

Subpaths may deepen an entity surface.
They must not quietly reassign entity ownership.

## Allowed subpath behavior
Examples:
- CEH Standard methodology pages under CEH Standard
- CEH Index product sections under CEH Index
- ORM overview or resources under ORM

## Restricted subpath behavior
Examples of prohibited or governance-sensitive states:
- CEH Index functioning as a de facto CEH Standard subpath authority
- DGE&I execution surfaces defining ORM parent identity through nested paths
- investor/protected materials being nested in a way that implies public-root ownership they do not actually have

## Subpath rule

If a subpath represents a different entity than the domain root, it must be treated as transitional, explicitly governed, and non-final.

---

# 8. Cross-Domain Linking Rules

## Linking principle

Cross-domain linking is allowed.
Cross-domain identity transfer is not.

## Approved directional logic

### ORM may link to
- CEH Standard
- CEH Infrastructure Index
- DGE&I

### CEH Standard may link to
- ORM
- CEH Infrastructure Index where methodology/product context requires it

### CEH Infrastructure Index may link to
- ORM
- CEH Standard where standards context requires it

### DGE&I may link to
- ORM
- CEH Standard
- CEH Infrastructure Index where contextually justified

## Linking rule

Links must communicate relationship clearly in surrounding copy and route placement.

A cross-link must not be treated as a substitute for correct root or canonical authority.

---

# 9. Login / Protected-Route Surface Rules

## Protected-surface principle

Login and gated routes are public topology signals even when access-controlled.

They must still reinforce the correct entity boundary.

## Protected-route rules

Protected routes must clearly belong to one of:
- ORM restricted surface
- CEH Index restricted/product surface
- DGE&I restricted/execution surface

Protected routes must not:
- imply parent-layer ownership incorrectly
- inherit an unrelated public identity by convenience
- route users into the wrong institutional layer after authentication

## Login rule

A login entry point should map users into the surface that corresponds to the protected material they are actually accessing.

---

# 10. Investor / Public / Private Surface Separation

## Separation principle

Public, investor, and private surfaces must be governed as separate classes even when they share infrastructure.

## Public surfaces
Should contain:
- public narrative
- public positioning
- public methodology
- public resources
- public intake

## Investor or restricted surfaces
Should contain:
- controlled investor materials
- gated execution or underwriting materials
- restricted documents
- privileged context

## Private or internal surfaces
Should contain:
- operational tools
- unpublished materials
- internal workflows
- internal review environments

## Separation rule

A public homepage must not become the de facto front door for a private or execution-sensitive surface without explicit governance approval.

---

# 11. Transitional-State Classifications

## Transitional states are allowed when documented

The following are valid transitional classifications.

### Transitional mixed-root
A root domain currently serves content shaped by more than one entity layer, but governance does not recognize that as final.

### Transitional bridge route
A route exists mainly to connect users from one entity surface to another while future cleanup is pending.

### Transitional protected-route dependency
A login or protected-route flow still depends on legacy route assumptions not yet normalized.

### Transitional narrative overlap
A public page still contains ecosystem language that is broader than its ideal final-state scope.

## Classification rule

A transitional state is acceptable only if:
- it is known
- it is bounded
- it is not mistaken for final architecture

---

# 12. Current Known Surface Conflicts

## Conflict 1: CEH Index root vs CEH Standard-style root behavior
Current operational context indicates:
- CEH Index canonical authority has been corrected toward `/ceh-infrastructure-index/`
- but `cehinfrastructureindex.com` domain root still appears to serve CEH Standard-style content or legacy-standard-adjacent structure

This creates root-surface ambiguity.

## Conflict 2: CEH Standard route assumptions
Known route patterns still imply CEH Index adjacency or subpath-style ownership from the CEH Standard surface.

This creates standards/product boundary ambiguity.

## Conflict 3: Mixed-scope ORM public surface
`oakridgemanagement.net` still carries ORM parent content alongside partner, standards, and investor-oriented ecosystem context.

This is acceptable as transitional, but not ideal as final-state public topology.

## Conflict 4: DGE&I narrative bleed
DGE&I still appears across broader ecosystem public surfaces without a fully isolated public-surface assignment.

This increases execution-layer bleed risk.

## Conflict 5: Protected-route ambiguity
Some login/protected-route assumptions still appear tied to legacy cross-surface route logic rather than clean entity-local surface ownership.

---

# 13. Immediate No-Change Zones

The following areas should not be broadly restructured yet.

## No-change zone 1
Do not reassign domain roots immediately.

## No-change zone 2
Do not collapse CEH Standard and CEH Infrastructure Index into one public route tree.

## No-change zone 3
Do not move investor/protected materials across entity surfaces until login and protected-route behavior are fully mapped.

## No-change zone 4
Do not force route normalization through broad redirects without route inventory and validation.

## No-change zone 5
Do not treat current mixed public surfaces as evidence that governance boundaries should be relaxed.

---

# 14. Future Remediation Candidates

These are candidates for future remediation after decisions are made, not immediate actions.

- CEH Index root-page normalization
- CEH Standard route cleanup where CEH Index bridge assumptions remain
- explicit DGE&I public-surface designation
- clearer public separation between ORM public pages and gated investor/execution surfaces
- public route inventory and ownership tagging
- protected-route reassignment review
- consistent cross-domain route labeling

---

# 15. Public-Surface Decision Rules

Before any route restructuring, homepage reassignment, or root change, governance must answer:

1. Which entity owns this surface?
2. What should the domain root represent?
3. Is this route public, restricted, or internal?
4. Is this route parent-layer, standards-layer, product-layer, or execution-layer?
5. Does the route reinforce or blur domain-root authority?
6. Does login behavior route users to the correct institutional surface?
7. Is the current state transitional or intended?

## Decision rule

If those answers are unclear, the surface should not yet be restructured.

---

# 16. Monorepo Implications

## Monorepo principle

A future monorepo may centralize implementation, but it must not collapse public-surface distinctions.

## Public-surface rule in a monorepo world

Even if one codebase eventually supports multiple properties, the following must remain separate conceptually:

- ORM root surface
- CEH Standard root surface
- CEH Infrastructure Index root surface
- DGE&I root or restricted execution surface

## Monorepo caution

Monorepo adoption must follow public-surface clarity.
It must not be used to rationalize unresolved route or domain ambiguity.

---

# 17. Enforcement / Remediation Authority

## Authority

Final enforcement authority resides with:

- Daniel Cobb
- ORM as top-level governance layer

## Remediation authority

Governance may require:
- route inventory
- root-surface clarification
- canonical correction
- protected-route mapping review
- login flow correction
- cross-domain link correction
- transition classification
- deployment freeze on affected public surfaces until ambiguity is reduced

## Final rule

No public surface may become authoritative by accident.

If a domain root, route tree, or protected surface conflicts with ORM governance hierarchy, the governance hierarchy wins and the surface must eventually be corrected under controlled sequencing.

---

# Public Surface Summary

## Intended root ownership
- `oakridgemanagement.net` = ORM parent surface
- `cehstandard.com` = CEH Standard surface
- `cehinfrastructureindex.com` = CEH Infrastructure Index surface
- DGE&I surface = execution/reference surface, pending formal designation

## Current operational reality
- workable but transitional
- not yet clean enough for root reassignment or route consolidation
- clear enough to map and govern before future restructuring

## Governing principle
Every public surface must answer one question clearly:

**What entity does this surface represent first?**

If that answer is not obvious from the domain root, route tree, and protected-route behavior, the surface is not yet sufficiently governed.