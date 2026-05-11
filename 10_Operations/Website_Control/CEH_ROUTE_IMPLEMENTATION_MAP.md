# CEH_ROUTE_IMPLEMENTATION_MAP

## Purpose

This document maps the current CEH Standard public routes on `cehstandard.com` to their confirmed source files in:

- repository: `danielcobb007-debug/ceh-pricing-engine`
- branch: `main`

Its purpose is to prevent unsafe edits before any cleanup, normalization, or migration work begins.

Use this map to answer:

- which file actually owns a live route
- whether the route is functioning as a standards page, an index page, or a mixed surface
- whether Claude can edit the route safely
- which routes require governance review before implementation work

This is a documentation and implementation-control file.

It is not:

- a migration plan
- a route rename plan
- a canonical rewrite plan
- a nav rewrite plan

---

# Confirmed Source Context

- Source repo: `danielcobb007-debug/ceh-pricing-engine`
- Source branch: `main`
- Current implementation pattern:
  - public clean routes resolve on `cehstandard.com`
  - source files often still use `.html` path references internally
  - live route behavior and source-file naming are not always identical

Operational rule:

- Claude should inspect the owning file listed here before editing any CEH route.
- If a route is marked `GOVERNANCE_SENSITIVE` or `DO_NOT_EDIT_WITHOUT_APPROVAL`, Claude should not make content, nav, canonical, or structural changes without explicit direction.

---

| Public Route | Source File | Current Role | Canonical Domain Intent | Governance Risk | Edit Status | Recommended Action |
|---|---|---|---|---|---|---|
| `/` | `index.html` | CEH Standard homepage | `cehstandard.com` | LOW | `SAFE_TO_EDIT` | Safe for normal content, metadata, layout, and UX updates that preserve CEH Standard role. |
| `/pages/methodology` | `pages/methodology.html` | Standards methodology page | `cehstandard.com` | LOW | `SAFE_TO_EDIT` | Safe for methodology-page improvements that preserve standard definitions and CEH Standard framing. |
| `/pages/horsepower-standard` | `pages/horsepower-standard.html` | CEH explainer / measurement-parallel page | `cehstandard.com` | LOW | `SAFE_TO_EDIT` | Safe for content polish and design updates that keep CEH as the central standards concept. |
| `/pages/partners` | `pages/partners.html` | CEH partner and adopter page | `cehstandard.com` | MEDIUM | `EDIT_WITH_CAUTION` | Edit carefully. Preserve explicit role separation between ORM as originator and DGE&I as adopter. |
| `/ceh-index` | `ceh-index.html` | Live CEH Index-like surface under CEH Standard domain | `cehinfrastructureindex.com` | HIGH | `GOVERNANCE_SENSITIVE` | Do not treat as a normal standards page. Any edits should be limited and reviewed against CEH Index boundary rules first. |
| `/pages/benchmark-index` | `pages/benchmark-index.html` | CEH Index benchmark content hosted under CEH Standard domain | `cehinfrastructureindex.com` | HIGH | `GOVERNANCE_SENSITIVE` | Treat as CEH Index-adjacent content. Only edit with awareness of duplicate product/standards surface risk. |
| `/capital-stack` | `capital-stack.html` | DGE&I capital-stack narrative surface | ORM or future DGE&I surface | VERY HIGH | `DO_NOT_EDIT_WITHOUT_APPROVAL` | Do not edit without explicit approval. This is the strongest current narrative-boundary bleed. |

---

# Route Notes

## Safe CEH Standard Routes

These routes are currently acceptable for normal Claude implementation work:

- `/`
- `/pages/methodology`
- `/pages/horsepower-standard`

These are structurally aligned with CEH Standard and have confirmed source ownership.

## Caution Route

`/pages/partners`

Reason:

- it is canonically a CEH Standard page
- but it introduces DGE&I and adopter-role language
- edits should preserve attribution and role separation

## Governance-Sensitive Routes

These routes should not be treated as ordinary CEH Standard pages:

- `/ceh-index`
- `/pages/benchmark-index`

Reason:

- both behave like CEH Index content under the CEH Standard domain
- both increase boundary ambiguity between CEH Standard and CEH Infrastructure Index

## Approval-Required Route

`/capital-stack`

Reason:

- the live route is a DGE&I capital-stack surface under the CEH Standard deployment tree
- this creates the strongest current cross-entity narrative bleed in the CEH Standard implementation set

---

# Operational Guidance for Claude

Before editing any CEH route, Claude should:

1. confirm the public route in this map
2. open the owning source file listed here
3. confirm whether the route is safe, cautionary, governance-sensitive, or approval-gated
4. avoid nav, canonical, or route-ownership changes unless explicitly instructed

Claude should not infer that a route is safe just because it is live.

---

# Current No-Change Constraints

Do not do any of the following from this map alone:

- rename route files
- migrate routes
- alter navigation
- change canonical tags
- change domain ownership
- move CEH Index content into CEH Standard or vice versa

This map exists so future implementation work starts from verified reality instead of assumptions.
