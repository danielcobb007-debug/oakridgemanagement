# SEO_DEPLOYMENT_TRACKER

## Purpose

This tracker keeps SEO infrastructure and deployment status visible across ORM-controlled public domains.

Use it to track operational readiness, not abstract policy.

---

| Domain | Sitemap | Robots.txt | Canonical URLs | Metadata | Google Indexing | Netlify Status | Last Checked |
|---|---|---|---|---|---|---|---|
| `oakridgemanagement.net` | LIVE — 12 URLs · 2026-05-11 | LIVE — non-www canonical | PRESENT · non-www · all 13 indexable pages verified | COMPLETE · all public pages have title + description + canonical | UNKNOWN | LIVE | 2026-05-11 |
| `cehstandard.com` | NOT VERIFIED | NOT VERIFIED | VERIFY PAGE-BY-PAGE | VERIFY PAGE-BY-PAGE | UNKNOWN | LIVE / TRANSITIONAL | 2026-05-11 |
| `cehinfrastructureindex.com` | NOT VERIFIED | NOT VERIFIED | VERIFY PAGE-BY-PAGE | VERIFY PAGE-BY-PAGE | UNKNOWN | LIVE / TRANSITIONAL | 2026-05-11 |
| Future ORM Landing Page | TBD | TBD | TBD | TBD | TBD | TBD | UNKNOWN |

---

# Status Notes

Suggested status values:

- `LIVE`
- `NOT LIVE`
- `PLANNED`
- `VERIFY`
- `PARTIAL`
- `UNKNOWN`
- `TRANSITIONAL`

---

# Current Operating Notes

- `oakridgemanagement.net/robots.txt` is live. Uses non-www canonical host. References `https://oakridgemanagement.net/sitemap.xml`.
- `oakridgemanagement.net/sitemap.xml` is now live — 12 URLs, all ORM-owned public pages. Created 2026-05-11. Excludes `/investor/`, `/investor/platform/`, `/login/` (all noindex).
- All 13 public pages on `oakridgemanagement.net` have verified canonical URLs using non-www host form. No host inconsistency.
- All 12 public ORM pages now have consistent mobile nav. Button markup added to all pages. `js/nav.js` handles toggle on 11 pages; homepage uses equivalent inline JS. CSS open state in `shared.css`.
- `CEHWhitepaperv1.0OakRidge.pdf` referenced in `/resources/` does not exist. Download button will 404. Needs PDF created and placed at root.
- CEH Standard and CEH Infrastructure Index must be tracked as distinct canonical surfaces even if they currently share operational infrastructure.

