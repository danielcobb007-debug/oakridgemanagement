# Robots.txt Implementation Plan

## Purpose

This plan defines a safe, minimal-change approach for introducing `robots.txt` across:

- `oakridgemanagement.net`
- `cehstandard.com`
- `cehinfrastructureindex.com`

The goal is to add baseline crawl governance without:

- blocking public surfaces prematurely
- changing routing
- changing deployment topology
- collapsing entity boundaries
- introducing environment-specific logic

This plan is aligned with:

- `PLATFORM_BOUNDARY_MAP.md`
- `CANONICAL_DOMAIN_REGISTRY.md`
- `SEO_INFRASTRUCTURE_PLAN.md`

---

# 1. Recommended robots.txt structure

## Baseline structure

Each domain should start with a simple, permissive `robots.txt`:

1. `User-agent: *`
2. `Allow: /`
3. optional narrow `Disallow:` lines only for clearly non-public/system paths
4. one domain-local `Sitemap:` entry

## Guiding principle

The first version should be intentionally conservative:
- allow search engines to crawl intended public content
- avoid trying to solve governance issues with crawler restrictions
- use canonical tags and sitemaps, not aggressive blocking, as the main control layer

---

# 2. Shared vs domain-specific rules

## Shared rules for all three domains

These should be common unless a verified need emerges later:

- allow all public pages to crawl
- include a domain-local sitemap reference
- do not block CSS, JS, images, or static assets by default
- do not block top-level public routes
- do not add bot-specific exceptions yet

## Domain-specific rules

### `oakridgemanagement.net`
Keep crawlable:
- parent public pages
- public resources
- public contact/about pages

Potential future restriction candidates, but not required yet:
- clearly gated investor/private routes after separate review

### `cehstandard.com`
Keep crawlable:
- root standard page
- methodology / framework pages
- public contact or briefing pages
- public standards content

Do not use `robots.txt` to hide CEH Index ambiguity.
That must be handled by canonical and route governance.

### `cehinfrastructureindex.com`
Keep crawlable:
- root product surface
- public product pages
- public methodology/intelligence pages
- request-access page

Do not block public Index pages just because protected or subscriber paths may exist later.

---

# 3. Sitemap reference strategy

## Rule

Each domain should reference only its own sitemap.

## Intended mapping

- `oakridgemanagement.net` → `https://oakridgemanagement.net/sitemap.xml`
- `cehstandard.com` → `https://cehstandard.com/sitemap.xml`
- `cehinfrastructureindex.com` → `https://cehinfrastructureindex.com/sitemap.xml`

## Important constraint

Do not share one sitemap across multiple domains.
Each sitemap should reflect only that domain’s public authority surface.

---

# 4. Areas that should remain crawlable

## `oakridgemanagement.net`
Keep crawlable:
- `/`
- `/about/`
- `/resources/`
- `/contact/`
- other clearly public ORM pages

## `cehstandard.com`
Keep crawlable:
- `/`
- methodology/framework/publication pages
- standards contact/briefing pages
- other clearly public standards routes

## `cehinfrastructureindex.com`
Keep crawlable:
- `/`
- `/about`
- `/methodology`
- `/intelligence`
- `/capital-series`
- `/request-access`
- other clearly public product pages

## General rule

If a page is intended as a public-facing surface, it should remain crawlable unless there is a specific, verified reason not to.

---

# 5. Areas that should not yet be restricted

Do not restrict these yet unless a separate governance review confirms they are private and non-indexable:

- CEH Standard public methodology pages
- CEH Infrastructure Index public access-request pages
- ORM public parent pages
- public assets required to render pages correctly
- routes that are still governance-transitional but publicly intended

## Important caution

Do not use `robots.txt` to paper over:
- canonical conflicts
- public-surface ambiguity
- route ownership confusion

Those are governance and metadata issues, not crawler-control issues.

---

# 6. Netlify / static-site placement guidance

## Placement

For each site, `robots.txt` should be a static root-level deploy artifact so it resolves at:

- `/robots.txt`

## Static-site guidance

- place one `robots.txt` per deployed site root
- ensure it is served directly as plain text
- keep it independent from app/runtime logic
- do not depend on redirects to reach it

## Netlify guidance

- avoid redirecting `robots.txt`
- avoid provider-side hacks unless absolutely necessary
- keep implementation file-based and explicit

---

# 7. Validation / testing approach

## Pre-deploy checks
- confirm the template matches the correct domain
- confirm sitemap URL points to the same domain
- confirm no accidental `Disallow: /`
- confirm no unnecessary path restrictions were added

## Post-deploy checks
For each domain:
- request `https://<domain>/robots.txt`
- verify HTTP success
- verify plain-text content
- verify correct sitemap URL
- verify no malformed directives

## Cross-checks
- confirm crawlable public pages are not blocked
- confirm CSS/JS remain accessible
- confirm sitemap location is reachable once added

---

# 8. Rollback considerations

## Rollback principle

Because the first version is minimal and permissive, rollback should also be simple.

## Rollback path

If a robots file causes unexpected issues:
- restore the previous file state
- if no previous file existed, remove the newly introduced file only if necessary
- do not combine rollback with unrelated SEO changes

## Low-risk rule

Keep first implementation small so rollback is trivial.

---

# 9. Changes explicitly out of scope

This plan does not include:

- aggressive crawler blocking
- environment-specific `robots.txt`
- route restructuring
- canonical fixes
- sitemap content design
- login/protected-route redesign
- cross-domain redirect changes
- monorepo changes
- broad SEO strategy changes

---

# Starter Templates

## `oakridgemanagement.net`
```txt
User-agent: *
Allow: /

Sitemap: https://oakridgemanagement.net/sitemap.xml
```

## `cehstandard.com`
```txt
User-agent: *
Allow: /

Sitemap: https://cehstandard.com/sitemap.xml
```

## `cehinfrastructureindex.com`
```txt
User-agent: *
Allow: /

Sitemap: https://cehinfrastructureindex.com/sitemap.xml
```

---

# Optional future-safe variant

If you want a lightly commented version for internal clarity:

## `oakridgemanagement.net`
```txt
# Oak Ridge Management public parent surface
User-agent: *
Allow: /

Sitemap: https://oakridgemanagement.net/sitemap.xml
```

## `cehstandard.com`
```txt
# CEH Standard public methodology surface
User-agent: *
Allow: /

Sitemap: https://cehstandard.com/sitemap.xml
```

## `cehinfrastructureindex.com`
```txt
# CEH Infrastructure Index public product surface
User-agent: *
Allow: /

Sitemap: https://cehinfrastructureindex.com/sitemap.xml
```

---

# Recommended implementation sequence

1. Add minimal permissive `robots.txt` to each domain.
2. Verify live accessibility.
3. Add domain-local `sitemap.xml` afterward if not already present.
4. Re-check page-level canonical and metadata separately.
5. Only later consider narrow restrictions for truly private paths.

## Final principle

The first `robots.txt` layer should be boring, explicit, and reversible. Public authority should be clarified through canonical structure and surface governance, not premature crawler blocking.