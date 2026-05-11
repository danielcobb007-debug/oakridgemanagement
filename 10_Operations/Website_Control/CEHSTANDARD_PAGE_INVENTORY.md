# CEHSTANDARD_PAGE_INVENTORY

## Purpose

This document is the first operational page inventory and route audit starter for `cehstandard.com`.

Its purpose is to turn CEH Standard from a general website idea into a manageable execution surface.

Use this document to:

- identify what pages and routes currently exist or are referenced
- distinguish homepage sections from real page routes
- flag routes that need verification before editing
- separate CEH Standard-owned pages from CEH Index-adjacent assumptions
- give Claude a concrete route matrix for future implementation work

This is a working operational inventory.

It is not yet a final sitemap, route map, or restructuring plan.

---

# Current Homepage Signals

Verified from the live homepage:

- Canonical URL: `https://cehstandard.com/`
- `og:url`: `https://cehstandard.com`
- Page title: `CEH Standard — Compute Energy Hour`
- Site-level role: standards and methodology surface

Governance note:

- Homepage-level metadata is aligned with CEH Standard as a distinct canonical surface.
- Linked routes and login behavior still require route-by-route verification.

---

# Current Known Route Inventory

| Route / Link | Type | Intended Role | Current Status | Ownership Assessment | Notes |
|---|---|---|---|---|---|
| `/` | Page | CEH Standard homepage | VERIFIED LIVE | CEH Standard | Canonical and metadata align with CEH Standard. Source file: `index.html` in `ceh-pricing-engine` `main`. |
| `#what-is-ceh` | Section anchor | Framework section on homepage | VERIFIED LIVE | CEH Standard | In-page anchor only. |
| `#why-matters` | Section anchor | Stakeholder section on homepage | VERIFIED LIVE | CEH Standard | In-page anchor only. |
| `#about` | Section anchor | About / framework status section | VERIFIED LIVE | CEH Standard | In-page anchor only. |
| `#contact` | Section anchor | Contact / inquiry section | VERIFIED LIVE | CEH Standard | In-page anchor only. |
| `#whitepaper` | Section anchor | Whitepaper request section | VERIFIED LIVE | CEH Standard | In-page anchor only. |
| `/pages/methodology` | Page | Methodology page | VERIFIED LIVE | CEH Standard | Title and canonical align with CEH Standard. Source file: `pages/methodology.html` on `main`. |
| `/pages/benchmark-index` | Page | Full benchmark index and methodology | VERIFIED LIVE | Governance-sensitive | Live page title is CEH Index-focused and behaves more like a CEH Index surface hosted under CEH Standard. Source file: `pages/benchmark-index.html` on `main`. |
| `/ceh-index` | Page | Bridge or entry point to CEH Index | VERIFIED LIVE | Governance-sensitive | Live page is CEH Index v1.0 content on `cehstandard.com`, not a redirect. Source file: `ceh-index.html` on `main`. |
| `/capital-stack` | Page | Capital framing page | VERIFIED LIVE | Governance-sensitive | Live page is DGE&I capital-stack content under `cehstandard.com`. Source file: `capital-stack.html` on `main`. |
| `/pages/horsepower-standard` | Page | Analogy / explainer page | VERIFIED LIVE | CEH Standard | Live page frames CEH as a standards-defining measurement concept. Source file: `pages/horsepower-standard.html` on `main`. |
| `/pages/partners` | Page | Partner page | VERIFIED LIVE | CEH Standard with governance sensitivity | Canonical aligns with `cehstandard.com`, but page includes DGE&I adopter content and explicit role-separation language. Source file: `pages/partners.html` on `main`. |
| `https://www.cehinfrastructureindex.com` | External domain link | CEH Index cross-link | VERIFIED LINK | CEH Infrastructure Index | Correct as a cross-domain link, not as a route ownership claim. |
| `https://www.cehinfrastructureindex.com/ceh-infrastructure-index/partners/` | Runtime redirect target | Post-login partner destination | VERIFIED IN CODE | CEH Index / protected route | High-risk governance-sensitive flow. Not a CEH Standard page. |

---

# Route Classes

## Class 1: Verified CEH Standard homepage content

These are currently safe to treat as CEH Standard homepage sections:

- `/`
- `#what-is-ceh`
- `#why-matters`
- `#about`
- `#contact`
- `#whitepaper`

## Class 2: Verified CEH Standard routes

These are verified live and operationally safe to treat as CEH Standard-owned pages:

- `/pages/methodology`
- `/pages/horsepower-standard`

## Class 3: Governance-sensitive routes

These may blur CEH Standard and CEH Infrastructure Index if edited casually:

- `/ceh-index`
- `/pages/benchmark-index`
- `/capital-stack`
- `/pages/partners`

Verified live governance-sensitive pages:

- `/ceh-index`
- `/pages/benchmark-index`
- `/capital-stack`

## Class 4: Protected-route / runtime-sensitive behavior

These should not be changed casually during page-copy or SEO work:

- Netlify Identity login redirect to `https://www.cehinfrastructureindex.com/ceh-infrastructure-index/partners/`
- invite / recovery token redirect to the same destination

---

# Immediate Audit Priorities

1. Confirm whether `/ceh-index` should remain a hosted CEH Index page on `cehstandard.com` or be treated as a transitional bridge surface only.
2. Confirm whether `/capital-stack` is intentionally public on CEH Standard or should be reclassified as DGE&I-sensitive content.
3. Confirm whether `/pages/partners` should remain under CEH Standard or be treated as a governance-sensitive ecosystem page.
4. Confirm whether partner/login flows intentionally land on CEH Index protected surfaces.

---

# Verified Route Notes

## `/pages/methodology`

Verified live behavior:

- HTTP 200
- title: `Methodology — CEH™ Standard`
- canonical: `https://cehstandard.com/pages/methodology`

Assessment:

- clearly CEH Standard-owned
- safe to treat as a standards page
- source file verified: `pages/methodology.html`

## `/ceh-index`

Verified live behavior:

- HTTP 200
- live CEH Index content hosted on `cehstandard.com`
- no redirect to `cehinfrastructureindex.com`

Assessment:

- not just a bridge link
- currently a live hosted CEH Index-like surface under the CEH Standard domain
- high governance sensitivity
- source file verified: `ceh-index.html`

## `/pages/benchmark-index`

Verified live behavior:

- HTTP 200
- title: `CEH™ Index v1.0 — Compute Energy Hour Benchmark`
- CEH Index-focused styling and content
- provenance language includes Oak Ridge Management / DGE&I framing

Assessment:

- behaves like CEH Index content
- hosted under CEH Standard domain
- high governance sensitivity
- source file verified: `pages/benchmark-index.html`

## `/capital-stack`

Verified live behavior:

- HTTP 200
- title: `DGE&I Capital Stack · CEH™ Energy Rate Arbitrage Model`
- DGE&I / Oak Ridge Management internal-strategy framing appears in page content

Assessment:

- not a clean CEH Standard page
- strongest current narrative-boundary bleed identified in this route pass
- high governance sensitivity
- source file verified: `capital-stack.html`

## `/pages/horsepower-standard`

Verified live behavior:

- HTTP 200
- title: `CEH™ · The Horsepower Standard`
- live content frames CEH as the measurement parallel to horsepower

Assessment:

- behaves like a CEH Standard explainer / thought-framework page
- operationally safe to classify as CEH Standard-owned
- source file verified: `pages/horsepower-standard.html`

## `/pages/partners`

Verified live behavior:

- HTTP 200
- title: `Partners — CEH™ Standard`
- canonical: `https://cehstandard.com/pages/partners`
- page includes explicit role separation between Oak Ridge Management as standard originator and DGE&I as adopter

Assessment:

- structurally a CEH Standard page
- still governance-sensitive because it introduces DGE&I inside the standards surface
- lower risk than `/capital-stack`, but should still be edited carefully
- source file verified: `pages/partners.html`

---

# Source Ownership Notes

Verified repository:

- `danielcobb007-debug/ceh-pricing-engine`

Verified branch:

- `main`

Verified implementation pattern:

- live clean routes are backed by static HTML files
- internal source links still often reference `.html` paths such as:
  - `/ceh-index.html`
  - `/capital-stack.html`
- the live site resolves cleaner public URLs on `cehstandard.com`

Operational implication:

- Claude should inspect both the clean public route and the underlying `.html` file path before editing navigation or cross-links
- route cleanup and source-link normalization should not be done casually during content-only edits

---

# Claude Use Instructions

Before Claude edits CEH Standard, Claude should:

1. check this route inventory first
2. identify the exact route being changed
3. determine whether the route is CEH Standard-owned, CEH Index-sensitive, or protected-flow-sensitive
4. inspect source files for the route before proposing edits

Claude should not edit governance-sensitive routes as if they were ordinary standards pages.

---

# Next Recommended Build Tasks

- Freeze governance-sensitive CEH routes from casual implementation edits until explicit approval is given
- Use the implementation map to scope Claude work to safe CEH Standard pages only
- Create a second-pass cleanup plan for mixed-surface CEH Standard routes
