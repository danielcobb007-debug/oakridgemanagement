---
name: oak-ridge-management-design
description: Use this skill to generate well-branded interfaces and assets for Oak Ridge Management, a private operating and strategy platform. Two surfaces — the ORM institutional warm-stone public surface and the DGE&I investor-portal data-room. Contains design tokens, type, fonts, logos, copy guidance, and UI kit components for both production and prototype work.
user-invocable: true
---

Read the `README.md` file within this skill, and explore the other available files.

If creating visual artifacts (slides, mocks, throwaway prototypes, etc), copy assets out and create static HTML files for the user to view. If working on production code, you can copy assets and read the rules here to become an expert in designing with this brand.

If the user invokes this skill without any other guidance, ask them what they want to build or design, ask some questions, and act as an expert designer who outputs HTML artifacts _or_ production code, depending on the need.

## Quick orientation

- ORM is the **parent operating platform**, not a CEH product company, not a fund, not a benefits business
- Four operating domains: Platform Strategy · Market Standards & IP · Strategic Capital · Operating Intelligence
- Active workstreams: DGE&I · CEH™ Standard · CEH™ Index · QumulusAI exposure · SPV strategy · Operating Intelligence
- **Two visual surfaces, with hierarchy**:
  - **ORM public** (primary): warm-stone, navy authority, bronze accents (used sparingly), forest support, charcoal/slate body
  - **CEH™ technical** (subordinate, only on CEH pages): deep-slate surface, muted cyan/green/gold/copper/red
- Engagement language: "Request a Strategic Conversation" / "Partner Access" / "Submit Inquiry" — never "Invest now" or "Open investment opportunity"

## Files to read first

- `README.md` — full design system: positioning, content fundamentals, visual hierarchy, iconography, asks
- `colors_and_type.css` — shared CSS tokens (warm-stone institutional default + legacy preserved)
- `ui_kits/public-site/` — ORM institutional public surface (use `orm-public.css`)
- `ui_kits/investor-portal/` — DGE&I data-room portal (use `partner-portal.css`)
- `assets/dg-logo.svg` — DGE&I monogram (workstream surfaces only; not on the ORM public site)

ORM wordmark is **live HTML text**, not an SVG. Render as `<span class="nav-logo-mark">Oak Ridge Management</span>` with Inter 700, uppercase, 0.6px tracked.
