# SHARED_SERVICES_INVENTORY

## Purpose

This document inventories the currently shared, duplicated, reusable, coupled, or partially centralized services, assets, systems, and infrastructure across the ORM ecosystem.

Its purpose is to create operational clarity before:

- monorepo planning
- shared asset extraction
- design-system normalization
- deployment consolidation
- repo migration
- service centralization

This is an operational inventory document.

It is not:

- a future-state platform architecture
- a code refactor plan
- a monorepo migration order
- a centralization mandate
- a design standard by itself

This document distinguishes between:

- currently shared
- intentionally duplicated
- accidentally duplicated
- future extraction candidates

All interpretations in this inventory remain subordinate to the entity boundaries established in `PLATFORM_BOUNDARY_MAP.md`.

---

# 1. Purpose of Shared-Services Governance

Shared services create efficiency only when they support clear institutional boundaries.

Without governance, “shared” quickly becomes:

- ambiguous ownership
- hidden duplication
- branding bleed
- repo coupling
- deployment interdependence
- accidental public narrative overlap

The purpose of shared-services governance is therefore to determine:

- what is already shared
- what only looks shared
- what is duplicated for valid reasons
- what is duplicated by accident
- what could become shared later without collapsing entity identity

Shared services must support boundary clarity.
They must not erase it.

---

# 2. Currently Shared Assets

## Governance Documents and Control Records

Currently shared at the ORM governance layer:

- governance files in `09_AI_Systems`
- migration/governance files in `10_Operations`
- repo-level governance records
- audit and session continuity records

These are shared across the ecosystem at the governance level, even if not operationally embedded into every repo as runtime code.

## Institutional Language Layer

Currently shared conceptually across repos:

- ORM parent-platform framing
- CEH Standard references
- CEH Infrastructure Index references
- DGE&I references
- institutional / authoritative tone model

This language layer is shared in principle, though not yet perfectly normalized in implementation.

## Hosting Pattern

Currently shared operationally:

- static-site deployment model
- multi-page route-based site structure
- likely Netlify-style deployment patterns
- lightweight static runtime assumptions

## Runtime Vendor Dependencies

Currently shared across active public surfaces:

- Google Fonts
- Netlify/Netlify-style static hosting assumptions
- Netlify Identity widget in at least some active public flows

---

# 3. Currently Duplicated Assets

## Typography Systems

Duplicated across repos in separate form:

### `oakridgemanagement`
- `css/shared.css`
- `css/investor-theme.css`
- typography stacks based on:
  - Share Tech Mono
  - Barlow Condensed
  - DM Serif Display
  - Inter / IBM Plex Mono for investor surfaces

### `ceh-pricing-engine`
- `css/styles.css`
- typography stacks based on:
  - Playfair Display
  - DM Sans
  - DM Mono

Classification:
- duplicated
- partially intentional
- not centralized

## Navigation and Footer Structures

Both repos maintain their own:

- nav markup
- footer markup
- link patterns
- mobile menu patterns
- page-shell scaffolding

Classification:
- duplicated
- partly intentional because entity surfaces differ
- partly extraction candidate at pattern level

## Inline Page-Level Styling

Both repos contain significant page-level inline CSS.

Classification:
- duplicated structure pattern
- accidental maintenance duplication risk
- strong future extraction candidate

## Page-Level Script Patterns

Both repos use small client-side page scripts for:

- nav behavior
- scroll behavior
- lightweight interactions
- route/page UX

Classification:
- duplicated pattern
- partially intentional
- candidate for standard utility extraction later

---

# 4. Shared Styling Systems

## Current State

There is no single live ecosystem-wide shared styling system in operational use across both repos.

Instead:

### `oakridgemanagement`
Uses:
- `css/shared.css`
- `css/investor-theme.css`
- extensive inline page-specific styling

### `ceh-pricing-engine`
Uses:
- `css/styles.css`
- extensive inline page-specific styling on subpages
- a more coherent design token system than `oakridgemanagement`

## Classification

### `oakridgemanagement/css/shared.css`
Classification:
- local shared styling system
- public-site scoped
- not ecosystem-wide shared

### `oakridgemanagement/css/investor-theme.css`
Classification:
- local shared styling system
- investor/DGE&I scoped
- intentionally separate visual system

### `ceh-pricing-engine/css/styles.css`
Classification:
- local shared styling system
- CEH Index scoped
- stronger extraction candidate than other current CSS assets

## Assessment

There are shared styling patterns across the ecosystem, but not one shared styling system.

---

# 5. Shared Navigation / Footer Systems

## Current State

Navigation and footer systems are functionally similar but implemented separately.

### Shared characteristics across repos
- top navigation shell
- primary CTA
- sub-brand or brand mark
- footer navigation clusters
- cross-domain references
- light mobile-nav behavior

### Differences
- ORM / CEH Standard public navigation in `oakridgemanagement`
- CEH Index product navigation in `ceh-pricing-engine`
- DGE&I investor/reference navigation on investor surfaces

## Classification

- currently duplicated
- partially intentional
- not yet safely centralizable as a literal shared component
- pattern-level extraction candidate only

Reason:
- shell mechanics are similar
- entity identity and hierarchy language differ materially

---

# 6. Shared Deployment / Runtime Systems

## Current Shared Deployment Characteristics

Across current active public repos, the following appear shared or similar:

- static hosting model
- multi-page route structure
- lightweight client-side JS
- asset-relative CSS/JS loading
- no heavy runtime app server dependency visible
- likely Netlify-based deployment assumptions

## `oakridgemanagement`
Observed runtime/deployment characteristics:
- `netlify.toml`
- static `publish = "."`
- redirects
- investor route gating
- Identity-based access flow

## `ceh-pricing-engine`
Observed runtime/deployment characteristics:
- live static route-based site
- shared JS/CSS asset loading
- Netlify-style form handling
- Netlify Identity widget on live homepage

## Classification

Shared deployment model:
- currently shared conceptually
- not yet centralized
- partly duplicated in implementation
- future governance-alignment candidate

---

# 7. Shared Authentication / Runtime Dependencies

## Netlify Identity

Observed across ecosystem public surfaces:

### `oakridgemanagement`
- login flows
- investor portal gating
- investor/platform protection
- role-based gating behavior

### `ceh-pricing-engine`
- Netlify Identity widget loaded on homepage
- exact deeper role/auth usage not fully confirmed from repo source, but dependency is present

## Classification

- currently shared dependency
- operationally coupled vendor choice
- partially shared auth/runtime pattern
- not yet centralized as a governed service layer

## Shared Runtime Libraries / Services

Currently shared:
- Google Fonts
- Netlify Identity widget CDN
- browser-native static runtime patterns

Classification:
- shared external dependency layer
- not internal shared service yet

---

# 8. Shared Governance Systems

## Canonical Governance Layer

Shared across the ecosystem:

- `MASTER_CONTEXT.md`
- `SYSTEM_MAP.md`
- `AI_CONTRACT.md`
- `AUDIT_CHECKLIST.md`
- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `REPO_OWNERSHIP_MAP.md`
- `SYSTEM_OF_RECORD.md`
- related governance records and logs

## Classification

- currently shared
- canonical
- intentionally centralized
- governance-owned
- should remain centralized

## Governance Role

This is the clearest and healthiest existing shared-services layer in the ecosystem.

It already functions as:

- shared authority
- shared audit standard
- shared drift detection logic
- shared institutional memory

---

# 9. Shared AI / Governance Tooling

## AI Role System

Shared ecosystem-wide:

- Claude as builder / drafter / prototype generator
- Codex as auditor / validator / drift detector
- governance documents as memory and constraint layer

## Shared AI Tooling Elements

Currently shared:

- AI operating contracts
- prompt-driven workflows
- system context documents
- decisions/session continuity pattern
- audit-driven repo review logic

## Classification

- currently shared
- intentionally centralized
- governance-critical
- not a deployable runtime service, but an operational shared service

---

# 10. Shared Operational Workflows

## Current Shared Workflows

Across the active ecosystem, the following workflows are shared or intended to be shared:

- governance-first change review
- staging-before-production philosophy
- repo audit before migration
- AI-assisted drafting followed by validation
- deployment review before production changes
- canonical hierarchy enforcement
- migration inventory maintenance
- environment variable audit awareness
- branch strategy / branch discipline at least in ORM governance intent

## Classification

- currently shared in policy
- inconsistently shared in repo implementation
- operational governance service
- partial normalization candidate

---

# 11. Shared Infrastructure Candidates

These are not yet recommended for extraction, but they are valid future shared-infrastructure candidates.

## Candidate: shared design tokens
Reason:
- multiple design systems have tokenized colors, typography, spacing, and UI conventions

Classification:
- future extraction candidate

## Candidate: shared nav/footer primitives
Reason:
- mechanical behavior overlaps, even when entity messaging differs

Classification:
- future extraction candidate
- must remain entity-aware

## Candidate: shared form utilities
Reason:
- both ecosystems use lightweight form flows and route-based public intake surfaces

Classification:
- future extraction candidate

## Candidate: shared auth wrapper patterns
Reason:
- Identity-based access patterns recur in the ecosystem

Classification:
- future extraction candidate

## Candidate: shared analytics and tracking conventions
Reason:
- future multi-property governance will likely require consistent instrumentation

Classification:
- future extraction candidate

## Candidate: shared deployment governance templates
Reason:
- branch/deploy rules should become standardized before or alongside platform consolidation

Classification:
- future extraction candidate

---

# 12. Duplication-Risk Areas

## Entity-Narrative Duplication

Highest risk area:
- ORM “about” logic
- CEH Standard ownership wording
- CEH Index positioning
- DGE&I relationship language

Risk type:
- governance duplication
- narrative drift

## Canonical URL / Domain Logic

Risk area:
- CEH Index canonical signals versus standalone domain
- product-domain versus standards-domain confusion

Risk type:
- SEO duplication
- public ownership ambiguity

## Styling / Layout Duplication

Risk area:
- repeated page-shell structures
- repeated inline CSS patterns
- repeated interaction patterns

Risk type:
- maintenance duplication
- visual inconsistency

## Auth / Gated Content Behavior

Risk area:
- investor or access-control behavior if reused across properties inconsistently

Risk type:
- runtime duplication
- inconsistent access governance

## Branch / Deployment Workflow Duplication

Risk area:
- different branch norms across repos
- repo-specific workflow divergence

Risk type:
- operational inconsistency
- release governance drift

---

# 13. Over-Centralization Risks

## Risk 1: Shared design system too early
If styling is centralized before entity boundaries are clean, visual consolidation may imply institutional consolidation.

## Risk 2: Shared navigation too early
If nav systems are unified before hierarchy is stabilized, each property may lose clear role definition.

## Risk 3: Shared copy systems too early
Shared language modules could flatten:
- ORM parent layer
- CEH Standard methodology layer
- CEH Index product layer
- DGE&I execution layer

## Risk 4: Shared repo utilities becoming de facto governance
If technical shared services begin defining identity, repo convenience will override boundary governance.

## Risk 5: Shared deploy tooling driving premature topology decisions
Deploy standardization must follow governance clarity, not precede it.

---

# 14. Recommended Inventory Classifications

## Classification Types

### Canonically Shared
Shared intentionally and already recognized as official shared authority.

### Locally Shared
Shared inside one repo or one entity surface, but not yet ecosystem-wide.

### Intentionally Duplicated
Repeated by design because separate entity identity requires it.

### Accidentally Duplicated
Repeated without sufficient governance reason.

### Transitional
Temporary overlap likely caused by migration state or incomplete normalization.

### Future Extraction Candidate
Not yet shared centrally, but a plausible future shared service after governance stabilization.

## Current Classification Summary

### Canonically Shared
- governance documents
- AI operating rules
- audit framework
- migration/governance control structure

### Locally Shared
- `oakridgemanagement/css/shared.css`
- `oakridgemanagement/css/investor-theme.css`
- `ceh-pricing-engine/css/styles.css`
- `ceh-pricing-engine/js/main.js`

### Intentionally Duplicated
- entity-specific nav language
- entity-specific footers
- public brand distinction
- investor-specific visual treatment
- CEH Standard versus CEH Index framing

### Accidentally Duplicated
- similar inline CSS blocks across pages
- repeated shell mechanics
- repeated small JS interaction logic
- potentially repeated ownership/context wording

### Transitional
- mixed governance and public-site responsibilities in `oakridgemanagement`
- CEH Index references embedded across multiple surfaces
- partial runtime similarities without shared control layer

### Future Extraction Candidates
- design tokens
- form utilities
- lightweight JS utilities
- shared navigation mechanics
- analytics conventions
- auth wrappers
- deployment templates

---

# 15. Future Extraction Readiness Indicators

A service or asset should only be considered extraction-ready when the following are true.

## Indicator 1: Ownership clarity
The extracted item does not create ambiguity about whether it belongs to ORM, CEH Standard, CEH Index, or DGE&I.

## Indicator 2: Stable repeated pattern
The service or asset is reused enough times to justify extraction and is not still changing conceptually.

## Indicator 3: Narrative neutrality
The extracted item is infrastructure-like, not identity-defining.

## Indicator 4: Deploy independence
Extraction will not force unrelated deploy targets into unnecessary coupling.

## Indicator 5: Governance approval
The extraction aligns with platform boundary governance, domain governance, and repo governance.

## Indicator 6: Canonical source identified
A clear source of truth exists for the item before extraction begins.

## Indicator 7: Rollback safety
The ecosystem can revert or isolate the extraction if it produces drift.

---

# Shared-Services Inventory Summary

## What is currently shared most successfully
- governance documents
- AI operating framework
- migration/governance process layer
- institutional hierarchy intent

## What is locally shared but not ecosystem-wide
- repo-specific CSS systems
- repo-specific JS systems
- route-shell mechanics
- auth/runtime implementations

## What is duplicated and risky
- entity framing language
- canonical product/standard relationship cues
- inline CSS patterns
- branch/deploy norms across repos

## What is not ready for centralization
- entity-specific navigation
- public identity systems
- CEH Standard and CEH Index narrative layers
- DGE&I execution-layer messaging

## Operational conclusion
The ORM ecosystem already has a legitimate shared governance layer, but not yet a legitimate shared presentation or runtime layer.

That is healthy.

The right next step is not centralization by default.
The right next step is disciplined inventory, classification, and boundary preservation until shared extraction can happen without blurring institutional roles.