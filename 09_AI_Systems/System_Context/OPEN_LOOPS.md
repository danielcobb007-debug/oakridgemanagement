# OPEN LOOPS

Unresolved items that require a decision, action, or verification before they can be closed.

Each entry: what it is, why it matters, and what resolves it.

---

## CRITICAL

### ORM-001 — oakridgemanagement.net deploy is frozen
**Status:** OPEN
**Discovered:** 2026-05-10

Netlify site `boisterous-fenglisu-4a91dc` is configured to deploy from the `master` branch of `danielcobb007-debug/oakridgemanagement`. The `master` branch no longer exists on the remote — only `main` and `staging` exist. The site is currently serving a stale frozen deploy. Pushes to `main` or `staging` do NOT trigger a redeploy of `oakridgemanagement.net`.

**Risk:** Live production site is decoupled from source control. Governance changes, HTML fixes, and content updates committed to `main` will not deploy until this is resolved.

**Resolution options:**
- Option A: Update Netlify site `boisterous-fenglisu-4a91dc` to deploy from `main` instead of `master` — requires verifying that `main` branch content matches the intended live state before enabling auto-deploy.
- Option B: Create a `master` branch on the remote pointing at `main` — simpler but perpetuates the naming inconsistency.

**Decision required by:** Daniel Cobb
**Cross-reference:** `10_Operations/Migration/TECH_STACK_INVENTORY.md`

---

## HIGH

### ORM-002 — Orphaned Claude branch on oakridgemanagement remote
**Status:** OPEN
**Discovered:** 2026-05-10

Branch `origin/claude/build-emmajay-landing-eBz2z` exists on the remote `danielcobb007-debug/oakridgemanagement` repo. It was not present at session start and was discovered during a `git fetch`. Origin and content are unknown.

**Risk:** Unknown work may exist on this branch. If it contains partial site changes, it could create confusion during future merges or be accidentally deployed.

**Resolution:** Review branch content and either merge, archive, or delete. Do not delete without reviewing first.

**Decision required by:** Daniel Cobb
**Cross-reference:** `10_Operations/Migration/TECH_STACK_INVENTORY.md`

---

### ORM-003 — cehinfrastructureindex.com domain root serves CEH Standard content
**Status:** OPEN
**Discovered:** 2026-05-10

The root `index.html` of `ceh-pricing-engine` contains CEH Standard content (title, hero, canonical pointing to `cehstandard.com/`). Since `cehinfrastructureindex.com` and `cehstandard.com` both deploy from the same repo, the root of `cehinfrastructureindex.com/` currently serves a CEH Standard page. The CEH Infrastructure Index product pages live at `/ceh-infrastructure-index/` as a subpath.

**Risk:** Domain root authority for `cehinfrastructureindex.com` is misaligned. A visitor to `cehinfrastructureindex.com/` sees CEH Standard content, not the Index product. Canonical tags have been corrected but the content architecture conflict remains.

**Resolution options:**
- Option A: Promote `ceh-infrastructure-index/` content to repo root; restructure paths.
- Option B: Add a Netlify redirect from `cehinfrastructureindex.com/` to `cehinfrastructureindex.com/ceh-infrastructure-index/`.
- Option C: Separate `cehstandard.com` and `cehinfrastructureindex.com` into independent repos.

**Decision required by:** Daniel Cobb
**Cross-reference:** `10_Operations/Migration/TECH_STACK_INVENTORY.md`, `00_Governance/CANONICAL_DOMAIN_REGISTRY.md`, `10_Operations/GOVERNANCE_ALIGNMENT_AUDIT.md`

---

## MEDIUM

### ORM-004 — Netlify site identities for cehstandard.com partially unverified
**Status:** PARTIAL
**Discovered:** 2026-05-10

`superlative-puffpuff-3cc501` is recorded as the Netlify site name for `cehstandard.com` based on prior session data. Production branch and Netlify URL have not been independently confirmed in the Netlify UI this session.

**Resolution:** Open Netlify dashboard, verify site name, production branch, and connected repo for `cehstandard.com`. Update `TECH_STACK_INVENTORY.md`.

---

### ORM-005 — Domain registrar and renewal dates unknown for all three domains
**Status:** OPEN
**Discovered:** 2026-05-10

Registrar and renewal dates are unverified for `oakridgemanagement.net`, `cehstandard.com`, and `cehinfrastructureindex.com`. Missing this information is a governance and continuity risk.

**Resolution:** Check registrar accounts for all three domains. Populate `DNS_OWNERSHIP.md` (file to be created in `10_Operations/`).

---

### ORM-006 — robots.txt and sitemap.xml absent on all three domains
**Status:** OPEN
**Discovered:** 2026-05-10

None of the three production domains return a valid `robots.txt`. No sitemap files were found in either repo. This limits search engine crawl control and indexing efficiency.

**Resolution:** Add `robots.txt` to both repos. Add `sitemap.xml` or Netlify plugin-based sitemap generation. Low urgency but should precede any SEO push.

---

### ORM-007 — cehstandard.com bridge routes partially unresolved
**Status:** PARTIAL
**Discovered:** 2026-05-10

Login redirects on `cehstandard.com` were updated from relative paths to absolute `cehinfrastructureindex.com` URLs (commit `f5f7337`). The nav link `<a href="/ceh-index.html">CEH Index</a>` was reviewed and confirmed as an internal CEH Standard benchmark reference — no change required. The broader question of whether `cehstandard.com/ceh-infrastructure-index/*` routes should redirect to `cehinfrastructureindex.com` remains undecided per audit guidance.

**Resolution:** After ORM-003 (domain root content) is resolved, decide whether to add cross-domain redirects for `cehstandard.com/ceh-infrastructure-index/*`.

**Cross-reference:** `10_Operations/GOVERNANCE_ALIGNMENT_AUDIT.md`
