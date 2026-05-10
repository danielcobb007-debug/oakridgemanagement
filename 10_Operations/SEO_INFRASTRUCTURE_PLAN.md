# SEO_INFRASTRUCTURE_PLAN

## Purpose

This document defines a safe, minimal-change SEO infrastructure plan for the ORM ecosystem across:

- `oakridgemanagement.net`
- `cehstandard.com`
- `cehinfrastructureindex.com`

Its purpose is to ensure that each public property has the minimum required SEO infrastructure to support:

- clear canonical ownership
- crawl consistency
- social metadata consistency
- stable indexing behavior
- governance-aligned domain authority

This is an SEO infrastructure and verification plan.

It is not:

- a redesign brief
- a route restructuring plan
- a monorepo migration plan
- a content strategy document
- a broad replatforming recommendation

This plan must remain consistent with:

- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `SYSTEM_OF_RECORD.md`
- `PUBLIC_SURFACE_MAP.md`

---

# 1. Current SEO Infrastructure State

## Oak Ridge Management

Observed current state:
- page-level canonical tags are present on local ORM site pages
- `oakridgemanagement.net` root self-canonicalizes correctly
- Open Graph `og:url` is present on the homepage
- no verified `robots.txt`
- no verified `sitemap.xml` in the current audit set

Assessment:
- comparatively strongest SEO baseline of the three for canonical consistency
- still incomplete at infrastructure level until `robots.txt` and sitemap status are explicitly verified and normalized

## CEH Standard

Observed current state:
- `cehstandard.com` root self-canonicalizes correctly
- `og:url` is present on the homepage
- no verified `robots.txt`
- no verified `sitemap.xml`
- route patterns and cross-surface assumptions still create boundary ambiguity in some areas

Assessment:
- top-level canonical is correct
- infrastructure completeness remains unverified
- some route and linking behavior still requires governance-aware verification

## CEH Infrastructure Index

Observed current state:
- CEH Index canonical conflict has been a known issue
- current context indicates canonical handling has been corrected toward `/ceh-infrastructure-index/`
- root/domain behavior still requires careful verification
- no verified `robots.txt`
- no verified `sitemap.xml`
- some pages appear to be missing explicit canonical or social URL metadata

Assessment:
- most governance-sensitive SEO surface
- requires the most careful verification for canonical consistency and infrastructure completeness

---

# 2. `robots.txt` Requirements

## Purpose

Each public domain should expose a valid `robots.txt` file to establish baseline crawl behavior and avoid accidental ambiguity.

## Required baseline behavior

Each production public domain should provide:
- a reachable `robots.txt`
- explicit crawl allow/disallow behavior
- optional sitemap reference if sitemap is available
- no directives that contradict public canonical strategy

## Domain-specific expectations

### `oakridgemanagement.net`
`robots.txt` should allow crawling of public parent-layer pages and should not expose private or gated assumptions as crawlable public surfaces.

### `cehstandard.com`
`robots.txt` should allow crawling of public methodology and standards pages and should not accidentally signal CEH Index subpath ownership if that is not intended.

### `cehinfrastructureindex.com`
`robots.txt` should allow crawling of intended public product pages while respecting any gated or restricted product areas that should not be indexed.

## Minimal requirement

At minimum, each domain should have:
- a valid `robots.txt`
- a `Sitemap:` entry once sitemap location is finalized

---

# 3. `sitemap.xml` Requirements

## Purpose

Each distinct canonical public surface should have its own sitemap authority.

## Required rule

Each canonical domain should have its own sitemap that includes only URLs that belong to that domain’s public authority surface.

## Domain-specific rules

### `oakridgemanagement.net`
Sitemap should include:
- ORM parent-layer public pages only
- not CEH Standard domain URLs
- not CEH Index domain URLs
- not gated investor/private URLs

### `cehstandard.com`
Sitemap should include:
- CEH Standard public routes only
- not CEH Index product URLs
- not DGE&I execution URLs
- not private/protected routes

### `cehinfrastructureindex.com`
Sitemap should include:
- CEH Index public product routes only
- not CEH Standard routes
- not gated product pages unless intentionally indexable
- not execution-only or private routes

## Sitemap rule

A sitemap must reinforce domain/entity authority, not blur it.

---

# 4. Page-Level Canonical Verification

## Purpose

Canonical tags are the strongest page-level ownership signal and must be verified systematically.

## Verification requirements

Each indexable page should have:
- one canonical tag
- canonical URL on the same intended canonical domain
- no conflict between canonical and actual public ownership
- no fallback to another entity’s surface by convenience

## Domain-specific expectations

### ORM
All ORM public pages should self-canonicalize to `oakridgemanagement.net`.

### CEH Standard
All CEH Standard public pages should self-canonicalize to `cehstandard.com`.

### CEH Infrastructure Index
All CEH Index public pages should self-canonicalize to `cehinfrastructureindex.com` or the approved CEH Index canonical path structure on that domain.

## Special rule

CEH Standard and CEH Infrastructure Index must not cross-canonicalize into each other by default.

---

# 5. OpenGraph / Twitter Metadata Verification

## Purpose

Social metadata should reinforce the same domain and entity signals as canonical tags.

## Verification requirements

Each indexable public page should verify:
- `og:title`
- `og:description`
- `og:type`
- `og:url`
- `og:image` where applicable
- `twitter:card`
- `twitter:title`
- `twitter:description`

## Minimum rule

If canonical is present but `og:url` is missing or contradictory, the page remains partially inconsistent.

## Domain-specific rule

`og:url` should match the intended canonical URL for that page’s public surface.

Where Twitter URL-specific fields are not used, that is acceptable as long as the other metadata is consistent.

---

# 6. Domain-Specific Rules

## `oakridgemanagement.net`
Must represent:
- ORM parent public surface

SEO rules:
- self-canonicalize to ORM domain
- sitemap must contain only ORM public pages
- metadata should frame ORM as parent governance/ownership layer
- no CEH Standard or CEH Index page should canonically belong here unless intentionally transitional and documented

## `cehstandard.com`
Must represent:
- CEH Standard public surface

SEO rules:
- self-canonicalize to CEH Standard domain
- sitemap must contain only CEH Standard public routes
- metadata should frame CEH Standard as methodology/standards layer
- no CEH Index page should canonically belong here by default

## `cehinfrastructureindex.com`
Must represent:
- CEH Infrastructure Index public/product surface

SEO rules:
- self-canonicalize to CEH Index domain
- sitemap must contain only CEH Index public product routes
- metadata should frame the site as the product/intelligence layer
- no CEH Standard page should canonically displace Index authority

---

# 7. Netlify / Static-Site Implementation Considerations

## Principle

These properties are currently static-site oriented and likely Netlify-backed in practice, so SEO infrastructure should be implemented with minimal operational disruption.

## Key considerations

- `robots.txt` should exist as a static deployable asset at the domain root
- `sitemap.xml` should exist as a static deployable asset at the domain root
- page-level canonical and metadata should be emitted directly in HTML
- branch or deploy-preview environments must not accidentally become canonical
- redirects must reinforce, not override, canonical governance

## Implementation rule

Do not rely on provider behavior alone to fix page-level SEO ambiguity if the HTML source itself remains inconsistent.

---

# 8. Validation Checklist

## Domain-level validation
For each domain:
- `robots.txt` exists and is reachable
- `sitemap.xml` exists and is reachable
- domain root returns correct canonical
- domain root metadata reflects correct entity

## Page-level validation
For representative public pages on each domain:
- canonical tag present
- canonical URL correct
- `og:url` present and aligned
- `og:title` and description align with entity role
- no cross-domain canonical leakage
- no protected/private routes exposed in sitemap

## Cross-domain validation
- CEH Standard pages do not canonically claim CEH Index authority
- CEH Index pages do not canonically fall back to CEH Standard
- ORM parent pages do not claim product-layer authority by accident

## Provider-level validation
- preview or branch deploys are not accidentally treated as canonical
- redirects do not conflict with page-level canonicals
- root files are accessible after deploy

---

# 9. Rollback Considerations

## Principle

SEO infrastructure changes should be small, reversible, and isolated.

## Safe rollback model
If a change creates unexpected behavior:
- restore prior `robots.txt`
- restore prior `sitemap.xml`
- restore prior page metadata only for the affected surface
- do not mix SEO rollback with unrelated content or route changes

## Rollback rule

Canonical or sitemap corrections should be deployed in narrow, reviewable increments so that any rollback affects only metadata/infrastructure, not site structure.

---

# 10. Changes Explicitly Out of Scope

The following are out of scope for this plan:

- redesign
- route restructuring
- homepage reassignment
- cross-domain IA rework
- monorepo migration
- repo consolidation
- wholesale rewrite of public copy
- protected-route architecture changes
- DGE&I public-surface redesign
- broad redirect strategy changes not strictly required for SEO infrastructure correctness

---

# Operational Recommendations

## Immediate priority
Verify and add, where missing:
- `robots.txt`
- `sitemap.xml`
- page-level canonical coverage
- `og:url` consistency

## Order of operations
1. verify current live state
2. add missing root-level SEO infrastructure
3. correct page-level metadata inconsistencies
4. validate domain/entity separation
5. only then consider deeper SEO cleanup if still needed

## Final principle

SEO infrastructure should make governance legible.

It should not change what the platform is.
It should make the existing intended public topology clearer, more consistent, and easier for search engines to interpret correctly.