# WEBSITE_INVENTORY

## Purpose

This inventory is the quick-reference list of all ORM-controlled website surfaces.

Use it to answer:

- what exists
- what each site is for
- who it serves
- where it deploys from
- what needs attention first

---

| Website | Domain | Purpose | Audience | Status | Deployment | Priority | Notes |
|---|---|---|---|---|---|---|---|
| Oak Ridge Management | `oakridgemanagement.net` | Parent ORM site, ecosystem orientation, contact, resources, investor entry | Partners, investors, operators, strategic readers | ACTIVE | Netlify via `oakridgemanagement` | HIGH | Current production site. Verified live. Production currently deploys from `main`. Canonical host is non-`www`. |
| CEH Standard | `cehstandard.com` | Standards and methodology surface | Infrastructure, energy, policy, investors, strategic readers | ACTIVE / TRANSITIONAL | Netlify via `ceh-pricing-engine` | HIGH | Verified current source repo is `ceh-pricing-engine`. Exact production branch and publish-root assumptions should be re-verified before edits. Must remain distinct from CEH Index. |
| CEH Infrastructure Index | `cehinfrastructureindex.com` | Product and intelligence surface, access request, market framing | Investors, subscribers, partners, strategic readers | ACTIVE / TRANSITIONAL | Netlify via `ceh-pricing-engine` | HIGH | Verified current source repo is `ceh-pricing-engine`. Public-surface and canonical behavior remain governance-sensitive. Treat as distinct from CEH Standard even where operational overlap exists. |
| Future ORM Landing Pages | `UNKNOWN` | Future campaign, product, event, or partner-specific pages | UNKNOWN | PLANNED | UNKNOWN | MEDIUM | Do not launch until domain, repo, deployment owner, and content source are defined. |

---

# Notes

- Use `ACTIVE / TRANSITIONAL` when a site is live but not yet in ideal final-state structure.
- Use `UNKNOWN` instead of filling assumptions that have not been verified.
- Add rows here before launching any new ORM-controlled public surface.
- Current verified repo-to-domain mapping:
  - `oakridgemanagement.net` -> `oakridgemanagement`
  - `cehstandard.com` -> `ceh-pricing-engine`
  - `cehinfrastructureindex.com` -> `ceh-pricing-engine`
