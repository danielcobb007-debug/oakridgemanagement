# SITEMAP_STRATEGY_PLAN

## Purpose

This document defines the sitemap governance, ownership, structure, and implementation strategy for the ORM ecosystem across:

- `oakridgemanagement.net`
- `cehstandard.com`
- `cehinfrastructureindex.com`

This is a sitemap architecture and governance document.

It is not:

- a sitemap generation task
- a route restructuring plan
- a monorepo migration plan
- a redesign brief
- a deployment cutover plan

Its purpose is to ensure that sitemap behavior reinforces:

- canonical domain authority
- entity separation
- crawl clarity
- public-surface governance
- future operational consistency

This document must remain aligned with:

- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `PUBLIC_SURFACE_MAP.md`
- `SYSTEM_OF_RECORD.md`

---

# 1. Purpose of Sitemap Governance

Sitemaps are public authority signals.

They influence how search engines interpret:

- which URLs belong to which domain
- which pages are intended for indexing
- which surface owns a route set
- whether multiple public surfaces are distinct or blurred

Without sitemap governance, the ecosystem risks:

- cross-domain ownership ambiguity
- duplicate index signals
- product and standards overlap
- transitional routes becoming de facto canonical inventory
- deployment convenience overriding institutional hierarchy

Sitemap governance exists to make domain ownership legible to crawlers without changing site architecture prematurely.

---

# 2. Current Sitemap State

Current known state:

- `oakridgemanagement.net/robots.txt` is live and references a sitemap location
- that sitemap reference currently uses the `www` host form
- no verified live `sitemap.xml` has been established as current production truth for:
  - `oakridgemanagement.net`
  - `cehstandard.com`
  - `cehinfrastructureindex.com`

Current assessment:

- sitemap governance is not yet normalized
- sitemap ownership should be treated as an open implementation layer
- no shared multi-domain sitemap should be assumed

This means the ecosystem is ready for sitemap planning, but not yet at a state where sitemap behavior should be improvised.

---

# 3. Canonical-Domain Alignment Requirements

Each sitemap must reinforce the canonical domain of the property it serves.

## Core rule

A sitemap for a domain must include only URLs that belong to that domain’s canonical public surface.

## Required alignment

- `oakridgemanagement.net` sitemap must reinforce ORM authority
- `cehstandard.com` sitemap must reinforce CEH Standard authority
- `cehinfrastructureindex.com` sitemap must reinforce CEH Infrastructure Index authority

## Prohibited behavior

A sitemap must not:

- mix CEH Standard and CEH Index URLs as if they are one surface
- include ORM parent URLs inside CEH Standard or CEH Index sitemaps
- include DGE&I execution/private surfaces by convenience
- use sitemap structure to imply a different hierarchy than governance defines

---

# 4. Per-Domain Sitemap Ownership

## `oakridgemanagement.net`
Owns:
- its own domain-local sitemap
- its own public parent-layer URL inventory

## `cehstandard.com`
Owns:
- its own domain-local sitemap
- its own standards and methodology URL inventory

## `cehinfrastructureindex.com`
Owns:
- its own domain-local sitemap
- its own product and intelligence URL inventory

## Ownership rule

Each canonical domain should have its own sitemap authority, even if multiple domains currently share operational infrastructure.

Shared deployment is not shared sitemap ownership.

---

# 5. CEH Standard Sitemap Scope

The CEH Standard sitemap should include only CEH Standard public URLs.

## In scope

- root standards homepage
- methodology pages
- standards publication pages
- framework/explainer pages
- public adoption or inquiry pages
- other clearly public standard-layer routes

## Out of scope

- CEH Infrastructure Index product pages
- ORM parent-layer pages
- DGE&I execution pages
- gated or private routes unless intentionally indexable and governance-approved

## Special rule

If a CEH Standard route currently acts as a bridge to CEH Index, that route should not automatically justify including CEH Index-owned destinations in the CEH Standard sitemap.

---

# 6. CEH Infrastructure Index Sitemap Scope

The CEH Infrastructure Index sitemap should include only CEH Index public product URLs.

## In scope

- root product homepage
- public product overview pages
- public methodology-as-applied pages
- intelligence and market pages
- request-access pages
- other approved public Index routes

## Out of scope

- CEH Standard domain routes
- ORM parent routes
- DGE&I execution routes
- gated subscriber/product routes unless explicitly intended to be indexed

## Special rule

The CEH Index sitemap must reinforce CEH Index as a distinct product surface, not a CEH Standard subpath authority.

---

# 7. ORM Sitemap Scope

The ORM sitemap should include only ORM public parent-layer URLs.

## In scope

- root ORM homepage
- about
- contact
- resources
- public parent-layer ecosystem orientation pages
- other clearly public ORM-owned routes

## Out of scope

- CEH Standard domain pages
- CEH Infrastructure Index domain pages
- investor/private routes unless intentionally public
- DGE&I execution/private routes by default

## Special rule

ORM may link to other ecosystem properties, but its sitemap should not attempt to inventory them.

---

# 8. Root vs Subpath Implications

## Root principle

A domain root is the strongest ownership signal.
A sitemap should reflect root ownership, not compensate for root ambiguity.

## Subpath rule

If a subpath belongs to the same entity as the root, it may be included in that domain’s sitemap.

If a subpath behaves like a different entity surface, inclusion becomes governance-sensitive and should be treated as transitional until resolved.

## Implication for current ecosystem

Because CEH Standard and CEH Infrastructure Index have known route-history overlap, sitemap inclusion should be conservative and domain-local rather than expansive.

Sitemap strategy should not try to solve unresolved route-boundary issues by over-including pages.

---

# 9. Multi-Domain Deployment Considerations

Current operational reality may include multiple domains sharing:

- one repo
- one deployment workflow
- one static-site codebase
- one Netlify-oriented operational model

That does not change sitemap governance.

## Rule

Even if two domains are deployed from the same repo, each domain should still have:

- its own sitemap URL
- its own URL inventory
- its own ownership boundary

## Multi-domain caution

A single shared sitemap or shared sitemap index should not be used to flatten CEH Standard and CEH Infrastructure Index into one crawl surface.

---

# 10. Static vs Generated Sitemap Considerations

## Static sitemap option

A static `sitemap.xml` is appropriate when:

- route count is small
- route changes are infrequent
- public inventory is stable
- manual control is preferable

## Generated sitemap option

A generated sitemap may become appropriate when:

- route count grows materially
- multiple sections require consistent update logic
- validation and freshness need automation
- route ownership is already well-governed

## Current recommendation

The ecosystem should remain open to either model.

No governance decision should require immediate movement to dynamic generation.

## Governance rule

Generation method is secondary.
Canonical ownership and URL scope are primary.

---

# 11. Netlify / Static-Site Implementation Considerations

## Principle

Sitemap implementation should fit the current static-site and Netlify-oriented deployment topology with minimal disruption.

## Implementation guidance

- each deployed public domain should expose its own `/sitemap.xml`
- sitemap files should live at the effective publish root for the site that serves that domain
- provider behavior should not be relied on to infer sitemap ownership
- redirects should not be used as the primary sitemap architecture

## Important note

If multiple domains currently share one repo, implementation must still preserve separate sitemap outputs where separate canonical surfaces exist.

---

# 12. Future Scaling Considerations

This strategy should support future growth without forcing premature consolidation.

## Future-ready considerations

- more public pages per domain
- deeper CEH Standard publication inventory
- deeper CEH Index intelligence inventory
- gated/private route expansion
- future DGE&I public-surface designation
- optional sitemap index files later if scale justifies them
- optional automation later if route ownership is already stable

## Scaling rule

Scale should increase sitemap discipline, not reduce domain separation.

---

# 13. Governance Alignment Requirements

All sitemap implementation must align with:

- ORM as top-level governance authority
- CEH Standard as distinct methodology surface
- CEH Infrastructure Index as distinct product surface
- DGE&I as execution/reference layer, not default public ownership layer

## Required governance outcomes

- one sitemap authority per canonical public domain
- no mixed ownership URL inventories
- no sitemap-driven ambiguity between CEH Standard and CEH Index
- no deployment convenience overriding entity boundaries

---

# 14. Validation Requirements

Before any sitemap is treated as production-ready, validate:

- sitemap URL is reachable at the intended domain
- all listed URLs belong to that domain
- all listed URLs are intended public/indexable pages
- no cross-domain canonical contradictions exist
- no protected/private URLs are included unintentionally
- root and subpath ownership logic are consistent with governance
- `robots.txt` references the correct sitemap host and location

## Cross-check requirement

Sitemap validation should be performed alongside:

- canonical tag verification
- `robots.txt` verification
- host normalization review
- public-surface ownership review

---

# 15. Explicitly Deferred Decisions

The following decisions are intentionally deferred:

- whether sitemap generation should be manual or automated
- whether sitemap index files will eventually be needed
- whether CEH Standard and CEH Index will later use different publish roots
- whether future internal tools should generate sitemap artifacts
- whether DGE&I will eventually need its own sitemap
- whether route cleanup should precede sitemap automation in all cases

Deferred means not required yet for governance clarity.

---

# 16. Changes That Should NOT Yet Be Made

The following should not be done yet:

- do not generate one shared multi-domain sitemap for CEH Standard and CEH Index
- do not use sitemap structure to compensate for unresolved route ambiguity
- do not restructure routes purely for sitemap convenience
- do not recommend monorepo migration as a prerequisite
- do not bundle sitemap work with broad canonical, redirect, or redesign changes
- do not inventory private, gated, or transitional routes as if they are settled public surfaces
- do not let sitemap implementation redefine platform hierarchy

---

# Operational Summary

## Core sitemap model

- `oakridgemanagement.net` owns an ORM-only sitemap
- `cehstandard.com` owns a CEH Standard-only sitemap
- `cehinfrastructureindex.com` owns a CEH Index-only sitemap

## Governing rule

Sitemaps must express domain truth, not deployment convenience.

## Current posture

The ecosystem should move toward sitemap completeness carefully, with domain-local ownership and conservative URL scope.

## Final principle

A sitemap is not just a crawl file.

It is a declaration of which public surface owns which URLs.

That declaration must remain institutionally correct before it becomes operationally convenient.