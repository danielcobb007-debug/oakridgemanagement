# TECH STACK INVENTORY

## Purpose
This file tracks all GitHub repos, Netlify sites, domains, deployments, and tooling connected to the ORM ecosystem.

> Note: This inventory distinguishes between verified current source/deployment facts and intended future-state governance. A repo may be operationally active for a surface without being the intended long-term canonical home of that surface.

---

## GitHub Repositories

| Repo Name | URL | Current Purpose | Owner | Keep / Merge / Archive | Notes |
|---|---|---|---|---|---|
| oakridgemanagement | https://github.com/danielcobb007-debug/oakridgemanagement | ORM parent public site and governance workspace anchor | ORM | KEEP | Confirmed source for oakridgemanagement.net. Mixed-scope / transitional repo. |
| ceh-pricing-engine | https://github.com/danielcobb007-debug/ceh-pricing-engine | Current source for CEH Standard and CEH Infrastructure Index public surfaces | ORM | KEEP | Verified current source for cehstandard.com root and cehinfrastructureindex.com. Public-surface separation remains transitional and requires governance cleanup before any restructuring. |

---

## Netlify Deployments

| Site Name | Netlify URL | Custom Domain | GitHub Repo Connected | Status | Notes |
|---|---|---|---|---|---|
| UNKNOWN | UNKNOWN | oakridgemanagement.net | oakridgemanagement | ACTIVE | Domain-to-repo mapping verified. Specific Netlify site identity should be re-confirmed in Netlify UI if needed. |
| superlative-puffpuff-3cc501 | UNKNOWN | cehstandard.com | ceh-pricing-engine | ACTIVE | Source currently confirmed as root index.html in ceh-pricing-engine, not oakridgemanagement. Public surface remains governance-sensitive / transitional. |
| cehinfratstructureindex | UNKNOWN | cehinfrastructureindex.com | ceh-pricing-engine | ACTIVE | Source currently confirmed as ceh-pricing-engine. CEH Index canonical/root behavior should be tracked as transitional where applicable. |

---

## Domains

| Domain | Registrar | Current Use | Target Use | Notes |
|---|---|---|---|---|
| oakridgemanagement.net | UNVERIFIED | ORM parent platform | ORM parent platform | Verified current source repo: oakridgemanagement. |
| cehstandard.com | UNVERIFIED | CEH Standard public surface | CEH Standard public surface | Verified current source repo: ceh-pricing-engine. Current source location conflicts with prior assumptions and should be treated as transitional. |
| cehinfrastructureindex.com | UNVERIFIED | CEH Infrastructure Index public surface | CEH Index public surface | Verified current source repo: ceh-pricing-engine. Canonical/root behavior may still require separate governance remediation tracking. |

---

## Tools

| Tool | Use | Status | Notes |
|---|---|---|---|
| VS Code | Workspace / editing | ACTIVE |  |
| Claude | Builder / strategist | ACTIVE |  |
| Codex | Auditor / governance | ACTIVE |  |
| GitHub | Version control | ACTIVE |  |
| Netlify | Deployment / hosting | ACTIVE |  |
| SharePoint | Source vault / business records | ACTIVE |  |

---

## Open Questions

- Which GitHub repo controls each live site?
  - oakridgemanagement.net = https://github.com/danielcobb007-debug/oakridgemanagement
  - cehstandard.com = https://github.com/danielcobb007-debug/ceh-pricing-engine
  - cehinfrastructureindex.com = https://github.com/danielcobb007-debug/ceh-pricing-engine

- Which Netlify deployment maps to each custom domain?
  - oakridgemanagement.net = UNVERIFIED
  - cehstandard.com = superlative-puffpuff-3cc501
  - cehinfrastructureindex.com = cehinfratstructureindex

- Which live public surfaces are transitional or conflicting?
  - cehstandard.com and cehinfrastructureindex.com currently share source-repo lineage inside ceh-pricing-engine
  - public-surface boundaries between CEH Standard and CEH Infrastructure Index should be treated as transitional until explicitly normalized

- Which assets are duplicated?
  - PARTIALLY KNOWN — cross-repo audit completed at governance level, but no canonical shared-asset extraction has been performed

- Which repo should become the ORM master monorepo?
  - UNDECIDED
  - Governance position: do not consolidate yet
