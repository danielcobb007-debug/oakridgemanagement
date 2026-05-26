# Oak Ridge Management — Design System

> Design system & UI kit for **Oak Ridge Management LLC**, a private operating and strategy platform coordinating platform architecture, capital formation, market standards, strategic investments, and operating intelligence across infrastructure, compute, energy, and complex private markets.

---

## ORM as a private operating company

Oak Ridge Management is **the parent command layer**. It is not a fund, not a registered investment adviser, not a single-product company, and not an open-engagement consultancy. It coordinates a portfolio of workstreams that operate as their own vehicles with their own counterparty universes.

### Four operating domains

| # | Domain | What it does | Workstreams |
|---|---|---|---|
| 01 | **Platform Strategy** | Platform formation across energy infrastructure, BTM generation, data centers, and AI compute | DGE&I |
| 02 | **Market Standards & IP** | Measurement frameworks, underwriting standards, index development | CEH™ Standard, CEH™ Index |
| 03 | **Strategic Capital** | Private investments, SPVs, capital partnerships, infrastructure-adjacent compute exposure | QumulusAI exposure, SPV strategy |
| 04 | **Operating Intelligence** | Capital architecture, commercial strategy, partner alignment, transaction framing, decision systems | Advisory mandates |

### Active workstreams (today)

- **DGE&I** — Dahlhauser Galbraith Energy & Infrastructure. The principal Platform Strategy workstream: behind-the-meter compute infrastructure, four named sites (St. Paul, Savannah, Bowman, Montgomery + pipeline), Power Block deployment models, hyperscale offtake.
- **CEH™ Standard** — Compute Energy Hour. Measurement framework for compute energy efficiency. v1.0 first published April 21, 2026. Open methodology.
- **CEH™ Index** — Independent hardware ranking under CEH™ methodology.
- **QumulusAI exposure** — Strategic compute position via the QumulusAI vehicle.
- **SPV strategy** — Special-purpose vehicles for principal-led private investments.
- **Operating Intelligence** — Engagement-based advisory mandates.

---

## Two visual surfaces, one brand

The design system contains **two distinct visual surfaces**, with a clear hierarchy between them:

### 1. ORM public surface (primary) — institutional warm-stone

The public site at **oakridgemanagement.net**. The dominant ORM visual identity.

- **Background:** warm stone `#faf9f6` / alt `#f4f2eb` — never black
- **Typography:** Source Serif 4 (h1/h2 editorial) + Inter (UI, h3, body) + IBM Plex Mono (eyebrows, metadata, tabular)
- **Color hierarchy:**
  - **Primary** Navy `#142B4A` — wordmark, headlines, nav, primary CTAs
  - **Secondary** Warm stone — canvas
  - **Accent (sparingly)** Bronze `#8A6A2A` — small caps labels, thin rules, premium callouts; *avoid large bronze blocks*
  - **Support** Forest `#1F4D36` — "active" / "operating" / affirmative
  - **Structure** Charcoal `#1F2937` · Slate `#4B5563` · Light `#9CA3AF` — body, rules, metadata
- **Aesthetic** Private operating company. Capital strategy office. Investment memo. Board briefing.

### 2. CEH™ technical surface (subordinate) — dark institutional

Reserved for CEH-specific pages (the standard's methodology page, the Index benchmark page, internal command surfaces). **Sits under** the ORM visual system and inherits its restraint.

- **Background:** deep slate `#141A26` (not pure black)
- **Typography:** Inter / IBM Plex Mono — institutional, not arcade
- **Accents (muted, used sparingly):** Cyan `#2B9BC2` (measurement) · Deep Green `#357A55` (efficiency) · Muted Gold `#B08A3A` (standard) · Copper `#9C5530` (capital constraint) · Muted Red `#A64545` (alert)
- **Use only on** dedicated CEH pages. Never leaks into the ORM public site.

> ⚠️ The Bloomberg-editorial / neon-cyan version of this system that was previously generated has been **deprecated** as the ORM public identity. It survives as the underlying source code in `assets/css/shared.css` for reference only, and is the technical foundation for any future CEH-specific page. The current `colors_and_type.css` and `ui_kits/public-site/orm-public.css` carry the warm-stone institutional system that *is* the ORM brand.

### A note on DGE&I

The DGE&I monogram is the only "real" logo asset and is reserved for **DGE&I-specific surfaces** (investor portal, decks). It does not appear on the public ORM website outside of contextual workstream references. ORM's own mark is a live-text wordmark in Inter — no SVG.

---

## Source materials

- **Codebase** — `Oak Ridge Management - Documents/` (Netlify-deployed source for the previous CEH-leading site; locally mounted at authoring time)
- **GitHub** — [`danielcobb007-debug/oakridgemanagement`](https://github.com/danielcobb007-debug/oakridgemanagement) — versioned source. Opening this repo alongside is recommended for any future production work.
- **Deployment domains** — `oakridgemanagement.net` · `cehstandard.com` · `cehinfrastructureindex.com`

The current public ORM design system is **a substantial repositioning away** from what's deployed today. The existing site treats CEH as if it were the whole company; the design system here treats ORM as the parent command layer and CEH as one workstream of four.

---

## CONTENT FUNDAMENTALS

### Voice & tone

ORM writes like a **principal-led private operating company**. Short, declarative, load-bearing sentences. Restrained. Compliance-conscious. The closest analogy is an institutional LP memo or a board briefing, not a marketing site, not an academic preprint, not a SaaS product page.

- **POV** — Third-person institutional ("Oak Ridge Management is…", "ORM engages selectively…"). No "we." No "you" except in CTAs.
- **Casing** — Sentence-case h1/h2. Title Case for short eyebrow labels. UPPERCASE only on small-caps mono labels (10–11px) and section eyebrows.
- **Trademark hygiene** — **CEH™** always with the trademark symbol. Spell out "Compute Energy Hour" on first use within a CEH context. Always credit Oak Ridge Management as originator.
- **Numbers & dates** — Spelled-out months ("April 21, 2026"). Version + publication date together where the standard is referenced.
- **Emoji** — Never. Glyph icons only: `§ → ↗ · — / ™`.

### Compliance-aware language

**Use:** Qualified access · Capital partner inquiry · Restricted materials · Confidential review · Diligence access · Approved counterparties · Strategic conversation · Partner access · By invitation or qualified introduction.

**Avoid:** Invest now · Join the round · Open investment opportunity · Returns available · Guaranteed access · "Fund documents" as a public-facing label · anything that reads as general solicitation or advisory services to the public.

### Examples (lift directly)

- **Hero (ORM public):** *"Platform strategy, capital architecture, and operating intelligence for complex markets."*
- **Hero supporting:** *"Oak Ridge Management is a private operating and strategy platform coordinating platform architecture, capital formation, market standards, strategic investments, and operating intelligence across infrastructure, compute, energy, and complex private markets."*
- **Operating perimeter (Is):** *"A private operating and strategy platform — the parent coordination layer for platform architecture, capital formation, market standards, and strategic workstreams."*
- **Operating perimeter (Is Not):** *"Not a fund or registered investment adviser. ORM does not present itself as a public investment vehicle or provide investment advice through this website."*
- **Investor portal hero:** *"DGE&I Investor Portal — Private diligence environment for qualified capital, infrastructure, and strategic partners evaluating the DGE&I platform."*
- **Investor portal disclosure:** *"Access is by invitation or approval only. Materials are confidential and may require NDA, non-circumvention, and advisor clearance before release."*

### Operating principles (the brand voice in five lines)

1. Structure before scale.
2. Measurement before management.
3. Capital follows clarity.
4. Platforms beat projects.
5. Trust is built through execution.

---

## VISUAL FOUNDATIONS

### Colors — applied hierarchy

| Layer | Token | Role | Use sparingly? |
|---|---|---|---|
| Primary | **Navy** `#142B4A` | wordmark, headlines, section heads, primary CTAs | Use everywhere as authority |
| Secondary | **Warm stone** `#FAF9F6` / `#F4F2EB` | canvas, alt sections | Default surface |
| Accent | **Bronze** `#8A6A2A` | small caps labels, thin rules, premium callouts | **Yes — never as large blocks** |
| Support | **Forest** `#1F4D36` | active / operating / approved states, infra themes | Yes — secondary only |
| Structure | **Charcoal** `#1F2937` · **Slate** `#4B5563` · **Light** `#9CA3AF` | body copy, rules, metadata, form fields, tables | As needed |
| Technical (CEH only) | Cyan `#2B9BC2` · Deep Green `#357A55` · Muted Gold `#B08A3A` · Copper `#9C5530` · Muted Red `#A64545` | only inside CEH-specific surfaces | Yes — restrained |

**Bronze rule:** Bronze gives institutional warmth at small sizes. Used in large blocks it tilts toward "country club brochure." Limit it to ~15-20px-tall stripes, eyebrow text, thin left/top borders on cards, and the occasional accent CTA.

### Typography

- **Source Serif 4** for editorial H1/H2 and short body copy where serif tone is desired (hero leads, descriptors, in-card descriptions). Weight 500–600.
- **Inter** for everything UI: H3 cards, eyebrows, nav, buttons, labels, table cells. Weight 400 (body), 500 (UI labels), 600–700 (heading-adjacent).
- **IBM Plex Mono** for small-caps eyebrows, metadata, tabular figures, section numbers (§ 01), and document/access tags.

### Spacing

8pt scale exposed as `--sp-1 (4px)` through `--sp-11 (96px)`. Section vertical rhythm: **72–88px** section padding, **36–48px** between sub-sections, **14–18px** card padding, **24–28px** for hero/feature cards. Generous editorial spacing throughout.

### Layout grid

1100–1240px wrap. Constrained editorial column width on text-heavy sections. Card grids: 2×2 institutional (operating domains), 3-up (power blocks, conversation categories), 4-up (stat tiles), full-width institutional tables (workstreams, sites, data room).

### Backgrounds, borders, shadows, motion

- **No background imagery.** No gradients. No textures. No patterns. The only "texture" is the contrast between warm-stone canvas and white cards.
- **Hairline borders, 1px.** Cards have `border: 1px solid var(--rule-soft)` with optional 2px top or left accent stub in navy or bronze.
- **No drop shadows** at rest. Investor-portal cards may use a 1px shadow-line on hover, never blur.
- **Motion is minimal.** 120–200ms color/border transitions. No scroll-jacking, no parallax, no animated illustrations.
- **No backdrop-blur / glassmorphism** other than a faint blur on the sticky nav.

### Hover & press states

- Buttons: background swap navy → navy-mid; bronze outline → bronze fill.
- Cards: border `--rule-soft` → `--rule`. No transform, no scale.
- Text CTAs: arrow color stays bronze; gap widens 6px → 10px.
- Links inside body: hover transitions to bronze.

### Cards & containers

A "card" is `background: #fff; border: 1px solid var(--rule-soft); padding: 22–28px;` with one of:
- Short 28px top stripe in navy (default) or bronze (premium emphasis)
- Full 2px top stripe (flagship variant)
- Left 2px rule (section heads, perimeter columns, callouts)

### Tables

The institutional table is a signature component. Used for Active Workstreams, Site Portfolio, Data Room.

- Outer border + hairline row dividers; warm-stone header row with `font-weight: 600`, `font-size: 10.5px`, slate text
- Mixed-typeface cells: Inter for IDs/headings, Source Serif for prose, IBM Plex Mono for tabular figures and small metadata
- Status pills inside cells use the stage-badge system (forest = operating, bronze = active mandates, navy = published, slate = position, charcoal = ongoing)

### Status badges

| State | Color | Used for |
|---|---|---|
| Operating | Forest | DGE&I, deployed systems |
| Active Mandates | Bronze | SPV work, advisory |
| Published / Live | Navy | CEH™ Standard v1.0 |
| Position | Slate | QumulusAI exposure |
| Ongoing | Charcoal | Continuous workstreams |
| Restricted / NDA / Confidential | Muted red / bronze / slate | Document access state |

---

## ICONOGRAPHY

ORM uses an **almost-iconless** visual system. The brand reads as institutional / publication, not consumer / app.

What is used, in order of frequency:

1. **Typographic glyphs**, set in IBM Plex Mono at body size: `§` (section anchor), `→` (CTA), `↗` (external link), `·` (separator), `—` (em-dash, used as the "is not" marker), `/` (domain divider), `™`.
2. **Letter-form mark** — the ORM wordmark is live HTML text, not a logo file: `<span class="nav-logo-mark">Oak Ridge Management</span>` in Inter 700, uppercase, 0.6px tracked.
3. **DG monogram** — `assets/dg-logo.svg`. Reserved for DGE&I surfaces (investor portal, decks). Not used on the ORM public site.

**Never used:** emoji, icon fonts (Font Awesome, Material), hand-drawn SVG illustrations, photographic imagery (no stock photos, no brand photography).

**If a real icon is required** — substitute thinnest-stroke **Lucide** icons at body size, monochrome, and flag the substitution to the user.

### Asset inventory

| File | Use |
|---|---|
| `assets/dg-logo.svg` | DGE&I monogram. Investor portal masthead + DGE&I-specific surfaces only. |
| `assets/orm-favicon.svg` | ORM favicon. |
| `assets/dg-favicon.svg` | DGE&I favicon (investor portal). |
| `assets/css/shared.css` | Legacy deployed site CSS (CEH-leading Bloomberg dark). **Reference only.** |
| `assets/css/investor-theme.css` | Legacy investor stylesheet. **Reference only.** |
| `assets/js/nav.js` | Legacy mobile nav toggle. |

---

## File index

```
.
├── README.md                              ← this file
├── SKILL.md                               ← agent-skill metadata (Claude Code / CLI)
├── colors_and_type.css                    ← shared design tokens (warm-stone institutional + legacy)
├── assets/                                ← logos, favicons, reference stylesheets
├── preview/                               ← design-system review cards (registered as assets)
└── ui_kits/
    ├── public-site/                       ← ORM public homepage UI kit
    │   ├── index.html                     ← Composed homepage
    │   ├── orm-public.css                 ← Institutional stylesheet (primary)
    │   ├── Nav.jsx · Hero.jsx
    │   ├── OperatingDomains.jsx · CurrentThesis.jsx · ActiveWorkstreams.jsx
    │   ├── OperatingPrinciples.jsx · OperatingPerimeter.jsx · FounderCard.jsx
    │   ├── StrategicConversations.jsx · Footer.jsx
    │   └── (legacy CEH-flavored components retained for a future CEH page)
    └── investor-portal/                   ← DGE&I investor portal UI kit
        ├── index.html
        ├── partner-portal.css             ← Data-room stylesheet
        ├── OrmRibbon.jsx · InvestorNav.jsx · PortalHero.jsx
        ├── PortalModules.jsx · SitePortfolio.jsx · PowerBlocks.jsx
        ├── CapitalArchitecture.jsx · DataRoom.jsx · PortalFooter.jsx
```

---

## CAVEATS / ASKS

### Things to flag

- **Substituted fonts (open-source web stand-ins).** Current pairings are deliberate stand-ins chosen to convey the intended brand register; documented below so replacements drop in cleanly.

  | Surface | Role | Current font | Intent |
  |---|---|---|---|
  | ORM public | H1 / H2 / lead serif emphasis | **Source Serif 4** (Google Fonts) | Elegant institutional editorial serif — newspaper masthead / annual-report register. Could swap for **Mercury**, **Lyon**, **Tiempos**, or **GT Sectra**. |
  | ORM public | H3 / UI / nav / body sans | **Inter** (Google Fonts) | Clean readable institutional sans. Could swap for **Söhne**, **Founders Grotesk**, **GT America**, or **Maison Neue**. |
  | ORM public + CEH technical | Metadata / labels / tabular | **IBM Plex Mono** (Google Fonts) | Restrained technical mono — not "hacker terminal." Could swap for **GT America Mono**, **Söhne Mono**, or **JetBrains Mono Light**. |
  | CEH technical | Same as above | Inter + IBM Plex Mono | Institutional, not arcade. The CEH surface deliberately inherits the ORM type stack so the technical pages don't drift into a gaming aesthetic. |

  Drop the licensed font names into `--serif` / `--sans` / `--mono` in `colors_and_type.css` and `ui_kits/public-site/orm-public.css` and the entire system inherits. The investor portal's `partner-portal.css` exposes the same variables and will follow.

- **No real photography or imagery.** Deliberate. The system is image-free until ORM commissions specific assets (boardroom-quality photography, site renders for DGE&I, capital-structure diagrams). No stock-photo placeholders.
- **The DGE&I monogram is hand-coded SVG**, not exported from a design tool. Editing it requires touching arc math in the path. A vector export from a proper design tool would be cleaner.
- **The legacy Bloomberg-dark CSS** (`assets/css/shared.css`) is preserved as-is from the existing deployed site. It is *not* used by the public ORM UI kit but remains the foundation for a future dedicated CEH technical page. Please confirm whether to keep, archive, or remove.

### Direct asks for iteration

1. **Confirm the four operating domains and their copy.** Are the descriptors right? Should "Strategic Capital" mention more specifically what is in scope (compute, infra-adjacent, pre-IPO)?
2. **Confirm the active workstreams list and stage labels.** Are the stages right? Should QumulusAI be more prominent or quieter?
3. **Confirm the founder card copy.** It's intentionally restrained per direction; should it stay this minimal, or include a brief background pointer?
4. **Confirm the investor-portal site list.** St. Paul / Savannah / Bowman / Montgomery + future pipeline — is the order, status, and MW per site accurate enough for design previews?
5. **Confirm the disclosure language.** The footer + perimeter disclosures aim to stay clear of public-solicitation territory; legal counsel should review before production.
6. **Decide whether to keep, retire, or move** the legacy CEH Bloomberg-dark components into their own subfolder (e.g. `ui_kits/ceh-technical/`).
