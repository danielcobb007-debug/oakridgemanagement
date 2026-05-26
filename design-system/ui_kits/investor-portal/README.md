# Investor Portal UI Kit — DGE&I

Restricted partner access surface for **DGE&I**, the active platform workstream under Oak Ridge Management. Institutional data-room aesthetic — warm stone, navy/bronze, document-card layout. Sits behind the ORM access layer.

## Visual posture

- **ORM is the access/control layer** (fixed navy ribbon at top + footer attribution)
- **DGE&I is the platform opportunity** (portal masthead, modules, sites, power, capital, data room)
- **CEH™** appears only where directly relevant as a measurement framework

Avoid: dashboard/SaaS feel, public-offering language, retail-investor copy. Aim for: private equity partner, infrastructure fund, family office, lender, corp-dev team would take seriously.

## Components

- `OrmRibbon.jsx` — navy access-layer ribbon ("Oak Ridge Management · Investor Access Layer")
- `InvestorNav.jsx` — DG monogram + portal masthead + 6-item nav (Overview / Platform / Sites / Power / Capital / Data Room) + Request Access CTA
- `PortalHero.jsx` — "Restricted Partner Access" eyebrow, "DGE&I Investor Portal" h1, supporting copy, action row, disclosure box, memo-stamp sidebar
- `PortalModules.jsx` — 7 document-card modules: Platform Overview / Site Portfolio / Power Block Specs / Capital Architecture / Commercial Demand / Legal & Governance / Data Room
- `SitePortfolio.jsx` — institutional table covering St. Paul / Savannah / Bowman / Montgomery / future pipeline
- `PowerBlocks.jsx` — Power Block Comparison (AC / CDC / EDC) with capital implication + speed-to-compute fields and a glossary
- `CapitalArchitecture.jsx` — HoldCo / Capital / ProjectCo levels with nodes
- `DataRoom.jsx` — document index table with access state (Granted / NDA Pending / Restricted)
- `PortalFooter.jsx` — navy footer with full confidentiality disclosure

## Language rules

**Use**: Qualified access · Capital partner inquiry · Restricted materials · Confidential review · Diligence access · Approved counterparties · Strategic partner portal

**Avoid**: Invest now · Join the round · Fund documents (public-facing) · Returns available · Guaranteed access · Open investment opportunity · anything that reads as general solicitation
