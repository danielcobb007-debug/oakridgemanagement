# WEBSITE_BUILD_QUEUE

## Operational Authority

This document operates under the ORM Platform Control Layer.

Current operational state reference:

- `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
- `10_Operations/Platform_Control/Architecture/OPERATIONAL_EXECUTION_MODEL.md`

Website implementation work must follow the governed execution pipeline:

`Strategy Decision`
→ `Markdown Documentation`
→ `Claude Implementation`
→ `Codex Verification`
→ `Git Commit`
→ `Deployment`

Website Control does not independently define institutional governance or standards authority.

## Purpose

This queue tracks what should be built, updated, reviewed, or deployed next across ORM-controlled websites.

Use it to keep AI work and human review aligned.

Status values:

- `NOT STARTED`
- `IN PROGRESS`
- `NEEDS REVIEW`
- `READY TO DEPLOY`
- `DEPLOYED`
- `PARKED`

---

| Priority | Website | Page / Feature | Description | Status | Assigned AI | Next Action |
|---|---|---|---|---|---|---|
| HIGH | Oak Ridge Management | Website control system | Stand up the markdown operating system for website maintenance | DEPLOYED | Codex | Keep updated as workflow evolves |
| HIGH | Oak Ridge Management | Sitemap architecture follow-through | Define eventual sitemap ownership and implementation path | DEPLOYED | Codex | `SITEMAP_STRATEGY_PLAN.md` defines domain-local model. Strategy approved. |
| HIGH | Oak Ridge Management | Sitemap file implementation | Add actual production sitemap when approved | DEPLOYED | Claude | `sitemap.xml` created 2026-05-11. 12 public ORM URLs. Excludes noindex routes. |
| HIGH | Oak Ridge Management | Mobile navigation | Homepage mobile menu button was present but non-functional | DEPLOYED | Claude | JS toggle added to `index.html`. CSS open state added to `shared.css`. All 12 public pages now have `.nav-mobile-btn` in nav HTML. |
| HIGH | Oak Ridge Management | Missing whitepaper PDF | `resources/index.html` links to `CEHWhitepaperv1.0OakRidge.pdf` — file does not exist | NOT STARTED | Daniel | PDF must be created and placed at `/CEHWhitepaperv1.0OakRidge.pdf`. Download button will 404 until resolved. |
| HIGH | CEH Standard | Public surface audit cleanup | Review page ownership, canonicals, metadata, and route assumptions | IN PROGRESS | Codex | Source-file ownership is now confirmed in `CEH_ROUTE_IMPLEMENTATION_MAP.md`. Next step: decide handling for `/ceh-index`, `/pages/benchmark-index`, `/capital-stack`, and `/pages/partners`. |
| HIGH | CEH Infrastructure Index | Public surface normalization | Clarify what root pages and core pages should represent before build changes | NOT STARTED | Codex | Use `PUBLIC_SURFACE_MAP.md` before implementation |
| MEDIUM | Oak Ridge Management | Mobile nav consistency | All pages except homepage lack mobile nav button — nav links hidden on mobile with no way to open | DEPLOYED | Claude | Mobile button added to all 11 remaining public pages. Shared `js/nav.js` handles toggle on all pages except homepage (homepage uses inline JS). |
| MEDIUM | Oak Ridge Management | Homepage copy refresh | Review whether parent-layer messaging still matches live priorities | PARKED | Claude | Revisit after active SEO tasks |
| MEDIUM | CEH Standard | Standards page inventory | List all current pages and missing pages | IN PROGRESS | Codex | First-pass route and source-file inventory is complete. Next step: split safe CEH Standard pages from mixed-surface remediation work. |
| MEDIUM | CEH Infrastructure Index | Page inventory | List all current pages and desired public routes | NOT STARTED | Claude | Inspect source and draft page matrix |
| MEDIUM | Future Landing Pages | Landing page template | Create repeatable structure for future ORM-controlled landing pages | PARKED | Claude | Wait until first real landing page need |

---

# Queue Rules

- Add work here before handing it to Claude if it affects a live or planned public surface.
- Move items to `NEEDS REVIEW` before any production push.
- Mark items `PARKED` instead of deleting them when timing changes.
- Keep the `Next Action` field specific enough that someone can pick the task up later.

# Website Execution Philosophy

Each website should first achieve:

- clean homepage
- clear narrative
- functional navigation
- mobile responsiveness
- proper metadata
- sitemap
- robots.txt
- deployment stability
- coherent branding
- contact/action flow

Do NOT overbuild early-stage websites.

Functional and deployable beats complex and incomplete.
