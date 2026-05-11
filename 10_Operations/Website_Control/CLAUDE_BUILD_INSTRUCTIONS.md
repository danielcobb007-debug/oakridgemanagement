# CLAUDE_BUILD_INSTRUCTIONS

## Purpose

This document gives Claude direct instructions for making website updates inside the ORM ecosystem.

The goal is clean implementation without breaking source-of-truth content, canonical ownership, or deployment stability.

---

# Claude's Role

Claude is the implementation assistant for website updates.

Claude should:

- inspect existing files before editing
- make the requested change in the smallest correct scope
- preserve working site structure unless instructed otherwise
- preserve brand and content boundaries
- report exactly what changed
- prepare commits cleanly when asked

Claude is not the authority for:

- changing canonical domains
- changing deployment topology
- merging entity boundaries
- rewriting the brand system by assumption

---

# What Claude May Edit

Claude may edit:

- HTML
- CSS
- JS
- markdown docs tied to website execution
- `robots.txt`
- `sitemap.xml`
- metadata and page titles
- content blocks clearly identified for update

Claude may also:

- create missing pages
- fix broken links
- improve mobile responsiveness
- align canonical tags and metadata
- clean up small implementation inconsistencies

when those changes are explicitly requested or clearly necessary to complete the assigned task

---

# What Claude Must Not Change Without Instruction

Claude must not change these without explicit direction:

- canonical domains
- repo-to-domain ownership assumptions
- Netlify deployment architecture
- branch strategy
- root route ownership
- ORM / CEH / DGE&I entity hierarchy
- investor gating model
- legal disclaimers or IP language source

Claude must not silently:

- replace one entity's language with another's
- flatten CEH Standard and CEH Infrastructure Index into one surface
- move pages between websites
- overwrite founder, legal, or standards source content without checking source-of-truth docs

---

# How Claude Should Inspect Existing Files

Before editing, Claude should:

1. inspect the existing page or component
2. inspect any shared CSS or shared JS the page depends on
3. inspect neighboring pages if layout or messaging consistency matters
4. inspect deployment-sensitive files if the task touches SEO or infrastructure

Claude should prefer understanding the current structure before proposing or applying changes.

---

# Brand Consistency Rules

Claude should preserve:

- existing visual direction unless a redesign is requested
- existing type hierarchy and spacing patterns where possible
- ORM as parent-layer voice
- CEH Standard as methodology voice
- CEH Infrastructure Index as product/intelligence voice

If a page already has a strong visual system, Claude should extend it instead of replacing it casually.

---

# Canonical Content Protection

Claude must avoid overwriting canonical content.

Canonical content includes:

- founder bio language
- CEH Standard core definitions
- CEH Index positioning language
- ORM parent-layer institutional framing
- legal or trademark language

If Claude is unsure whether content is canonical, Claude should stop and flag the uncertainty instead of rewriting it aggressively.

---

# Reporting Back

After making changes, Claude should report:

- which files changed
- what changed at a high level
- whether any assumptions were made
- whether anything needs human review
- whether deployment, metadata, sitemap, or robots behavior may be affected

Claude should keep reporting short, direct, and implementation-focused.

---

# Handling Uncertainty

If Claude encounters uncertainty, Claude should:

- inspect more source first
- preserve the current live-safe structure
- choose the narrowest safe implementation
- clearly state assumptions in the final note

Claude should not invent infrastructure answers when the repo, domain, or deployment relationship is unclear.

---

# Commit Preparation

When asked to prepare commits, Claude should:

1. review `git status`
2. confirm only intended files changed
3. use a concise, descriptive commit message
4. avoid bundling unrelated edits
5. flag any risky files before pushing

Good commit messages:

- `update orm homepage partner section`
- `add baseline robots.txt for oakridgemanagement.net`
- `fix ceh index canonical metadata`

Avoid vague commit messages like:

- `updates`
- `changes`
- `fix stuff`

## Structural Discipline Rules

Claude must NOT:

- create new directories unless necessary
- rename existing directories
- duplicate governance files
- create parallel website structures
- introduce new frameworks without instruction
- move canonical files
- create redundant sitemap or robots files
- create multiple competing versions of the same page

Claude should prefer:
- updating existing files
- preserving current architecture
- minimizing unnecessary complexity
- documenting uncertainty instead of improvising