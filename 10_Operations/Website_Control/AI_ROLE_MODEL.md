# AI_ROLE_MODEL

## Authority Note

This document governs website-specific AI operational behavior for ORM website work.

Canonical AI governance authority remains:

- `10_Operations/Platform_Control/AI_Operations/AI_ROLE_MODEL.md`

If this document conflicts with platform-level AI governance, the platform-level document controls.

---

## Purpose

This document defines the working role separation between the AI systems used in the ORM website operating system.

Its purpose is to:

- reduce duplicated effort
- prevent conflicting guidance
- clarify which AI should be used for which kind of work
- keep strategy, implementation, and audit work aligned
- prevent AI outputs from becoming untracked operational truth

This is an execution support document.

It is not:

- a theoretical AI policy paper
- a replacement for governance documents
- a substitute for human approval

---

# Core Principle

The ORM markdown operating system is the shared source of working truth.

AI systems may help:

- think
- draft
- build
- audit
- compare
- validate

But no AI system should become a parallel source of truth outside the repository documentation.

If an AI-driven decision affects:

- website structure
- page ownership
- domain behavior
- deployment behavior
- content source of truth
- SEO infrastructure
- cross-entity separation

that decision should be captured in the appropriate markdown file before it is treated as operationally settled.

---

# AI Roles

## 1. Beatrice / Bea / ChatGPT

Primary role:

- high-level strategy partner

Best used for:

- framing decisions
- evaluating priorities
- sequencing work
- pressure-testing ideas
- shaping positioning
- clarifying business logic
- helping Daniel think through tradeoffs

Operating rule:

Bea may help generate direction, but strategic conclusions should be written into the ORM markdown system before they guide implementation.

Bea should not be treated as the sole source of:

- route ownership
- deployment truth
- repo truth
- canonical domain truth
- production readiness

---

## 2. Claude

Primary role:

- implementation drafter and website builder

Best used for:

- page creation
- page revision
- section rewrites
- layout implementation
- HTML/CSS/JS changes
- content formatting
- controlled design iteration

Operating rule:

Claude should work from:

- the website control docs
- the build queue
- the source-of-truth docs
- route implementation maps
- explicit task instructions

Claude should not independently redefine:

- canonical ownership
- repo authority
- domain authority
- governance boundaries
- mixed-surface classification

Claude is the builder, not the system-of-record authority.

---

## 3. Codex

Primary role:

- implementation auditor, repo mapper, and operational control partner

Best used for:

- route-to-file mapping
- repo inspection
- branch and deployment verification
- SEO and canonical audits
- website operating system maintenance
- documentation updates
- implementation-risk detection
- pre-deploy sanity checking

Operating rule:

Codex should be used when the question is:

- what file owns this route?
- what branch is really live?
- what repo controls this domain?
- what changed?
- what is safe to edit?
- what is governance-sensitive?

Codex should help keep strategy grounded in implementation reality.

---

# Recommended Working Pattern

Use the AI systems in this order when possible:

1. Bea helps define the strategic objective
2. ORM markdown docs capture the decision or task
3. Claude implements the approved change
4. Codex audits, maps, or verifies the implementation
5. Daniel approves production-impacting changes

This keeps the workflow collaborative without allowing drift.

---

# Decision Flow

Use this as the default operating sequence for website work:

`Strategy Decision`

↓

`Markdown Documentation`

↓

`Claude Implementation`

↓

`Codex Verification`

↓

`Git Commit`

↓

`Deployment`

Flow rule:

Do not skip the markdown documentation step for any change that affects public truth, route ownership, deployment behavior, SEO structure, or content source of truth.

Verification rule:

Codex verification should happen before the final commit and before deployment whenever the change affects:

- public pages
- route behavior
- metadata
- canonical behavior
- domain references
- protected-surface logic

Deployment rule:

Deployment should only happen after the implementation matches the documented intent and Daniel is comfortable that the change is ready for production.

---

# Website-Specific Usage Guidance

## For strategy questions

Use Bea first when the task is:

- what should this site do?
- what should this page say?
- what is the right sequencing?
- what should we prioritize?

## For build tasks

Use Claude first when the task is:

- create the page
- revise the page
- update the layout
- implement the approved copy
- make the page match the brief

## For audits and operational truth

Use Codex first when the task is:

- confirm source ownership
- inspect implementation
- verify repo-to-domain mapping
- check branch/deploy behavior
- review canonical or metadata behavior
- determine whether a change is safe

---

# Non-Redundancy Rule

Using Bea, Claude, and Codex is not redundant if each has a defined lane.

It becomes redundant only when:

- the same task is being solved independently by all three
- no markdown record captures the decision
- implementation starts before operational truth is verified
- strategy and repo reality diverge silently

The goal is not to reduce AI usage to one tool.

The goal is to prevent uncoordinated AI usage.

---

# Source-of-Truth Rule

The final working source of truth for ORM website operations is:

- repository documentation
- verified repository state
- verified deployment state
- approved human decisions

Not:

- one chat thread
- one AI memory
- one draft answer
- one unrecorded planning session

If Bea, Claude, or Codex produces an important conclusion, that conclusion should be reflected in:

- `WEBSITE_CONTROL_LAYER.md`
- `WEBSITE_BUILD_QUEUE.md`
- `CONTENT_SOURCE_OF_TRUTH.md`
- route inventories
- SEO trackers
- deployment trackers

as appropriate.

---

# Approval Rule

Daniel remains the human decision-maker.

AI systems may:

- recommend
- draft
- implement
- audit
- compare

But they do not independently approve:

- public-surface changes
- domain/canonical changes
- deployment cutovers
- governance boundary changes
- mixed-surface reclassification

---

# Practical Summary

Use:

- Bea to think
- Claude to build
- Codex to check

Use the markdown operating system to remember.

Use Daniel's approval to finalize anything that affects public truth.
