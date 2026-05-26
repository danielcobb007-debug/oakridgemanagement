# Public Site UI Kit — Oak Ridge Management

The public-facing surface at **oakridgemanagement.net**. **Institutional warm-stone** aesthetic — private operating company, capital strategy office, durable parent-platform credibility. The Bloomberg-dark style is *reserved for CEH-specific technical pages only* (see `preview/components-table.html` and `preview/components-formula-bar.html` for that variant).

## Visual posture

- **ORM is the parent brand.** Headlines are sentence-case editorial serif. Wordmark is quiet uppercase Inter.
- **Single-accent system.** Bronze for eyebrows, stripes, and accents. Navy for primary buttons + headings. Forest, Slate, Charcoal only as secondary stage/status accents.
- **Generous whitespace.** Section padding 72px+. Cards have 28px padding. No neon. No gradients. No drop shadows.
- **Glyph icons only** (§, →, ↗, ·, —). No emoji, no icon fonts. See `preview/iconography.html`.

## Components

- `Nav.jsx` — quiet "Oak Ridge Management" wordmark + sub-tag, restrained nav (Domains / Thesis / Workstreams / Principles / Access / Contact), single navy CTA
- `Hero.jsx` — bronze eyebrow, serif editorial headline with italic accent, body, dual CTA (navy + outline bronze), right-side "Firm at a Glance" memo card
- `OperatingDomains.jsx` — 2×2 institutional card grid (Platform Strategy / Market Standards & IP / Strategic Capital / Operating Intelligence)
- `CurrentThesis.jsx` — single load-bearing serif statement with italic emphasis
- `ActiveWorkstreams.jsx` — institutional comparison table (workstream / domain / stage / focus / surface)
- `OperatingPrinciples.jsx` — five maxims, serif, editorial list
- `OperatingPerimeter.jsx` — "Defining the Operating Perimeter" — ORM Is / Is Not as a calm institutional two-column boundary statement
- `FounderCard.jsx` — restrained operator card (Daniel Cobb) + body
- `StrategicConversations.jsx` — four-category qualified intake grid + mailto CTA
- `Footer.jsx` — navy institutional footer with full disclosure paragraph

All components consume `orm-public.css` (sibling file). They use `<Source Serif 4 / Inter / IBM Plex Mono>` and the design tokens established in that stylesheet.

## Language rules

- ORM ≠ CEH. Don't lead with CEH; CEH is one workstream under Market Standards & IP.
- Sentence-case h1/h2. Eyebrows are short Title-Case-or-CAPS labels.
- No "invest now," "join the round," "open investment opportunity." Use *qualified introduction* / *strategic conversation* / *partner access*.
- "Investor" nav item → renamed **Access** or **Partner Access**.

## File layout

```
ui_kits/public-site/
├── README.md
├── index.html               ← Composed homepage
├── orm-public.css           ← Institutional stylesheet (primary)
├── Nav.jsx
├── Hero.jsx
├── OperatingDomains.jsx
├── CurrentThesis.jsx
├── ActiveWorkstreams.jsx
├── OperatingPrinciples.jsx
├── OperatingPerimeter.jsx
├── FounderCard.jsx
├── StrategicConversations.jsx
└── Footer.jsx
```

Legacy Bloomberg-dark components (`Ticker.jsx`, `TrackGrid.jsx`, `FormulaBar.jsx`, `IndexTable.jsx`, `GradeStrip.jsx`, `IsIsNot.jsx`, `Citation.jsx`) remain in this folder for reference and are intended for a future dedicated **CEH technical surface** — they should NOT be loaded from the ORM homepage.
