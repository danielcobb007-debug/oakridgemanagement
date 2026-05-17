# SOURCE OF TRUTH HIERARCHY

## Purpose

This document establishes the authoritative hierarchy for operational truth, governance interpretation, implementation sequencing, and institutional continuity across the Oak Ridge Management ecosystem.

Its purpose is to prevent:

- AI drift
- implementation contradiction
- undocumented architectural divergence
- parallel memory systems
- deployment inconsistency

All AI systems, contributors, and implementation workflows must defer to this hierarchy when conflicts arise.

---

## Core Principle

The repository governance layer is the institutional memory system of Oak Ridge Management.

No conversational AI system constitutes authoritative truth independently.

Institutional continuity exists only through governed markdown artifacts committed into the operational repository structure.

---

## Authority Hierarchy

### Tier 1 — Constitutional Governance Documents

Highest authority.

Includes:

- MASTER_CONTEXT.md
- AI_CONTRACT.md
- SYSTEM_MAP.md
- DECISIONS.md
- BRAND_RULES.md
- DEPLOYMENT_RULES.md
- MONOREPO_ARCHITECTURE.md

Purpose:

Defines permanent institutional architecture, governance boundaries, operating philosophy, brand discipline, deployment rules, and structural constraints.

Tier 1 documents override all lower-tier materials.

---

### Tier 2 — Operational Governance Documents

Includes:

- WEBSITE_CONTROL_LAYER.md
- WEBSITE_INVENTORY.md
- WEBSITE_BUILD_QUEUE.md
- WEBSITE_UPDATE_CHECKLIST.md
- SEO_DEPLOYMENT_TRACKER.md
- CONTENT_SOURCE_OF_TRUTH.md
- CEH_ROUTE_CLASSIFICATION.md
- CEH_ROUTE_IMPLEMENTATION_MAP.md
- CEH_MIXED_SURFACE_REMEDIATION_PLAN.md

Purpose:

Defines operational implementation state, website control, source-file ownership, route classification, sequencing, and deployment governance.

Tier 2 documents may not override Tier 1 governance.

---

### Tier 3 — Active Workstream Documents

Includes:

- SESSION_LOG.md
- OPEN_LOOPS.md
- ACTIVE_WORKSTREAMS.md
- NEXT_SESSION_CONTEXT.md
- distilled context summaries that have been explicitly approved for working use
- remediation plans
- migration plans
- session debriefs

Purpose:

Tracks current implementation activity, open loops, temporary coordination, and near-term execution context.

Tier 3 documents may not override Tier 1 or Tier 2 governance.

---

### Tier 4 — AI Session Output

Includes:

- ChatGPT / Bea conversations
- Claude conversations
- Codex outputs
- `09_AI_Systems/Incoming/` raw imports
- `09_AI_Systems/Session_Extraction/` working extraction artifacts
- `09_AI_Systems/Distilled_Context/Pending/` unstabilized distilled summaries
- generated prompts
- temporary drafts
- implementation suggestions
- strategic discussion threads

Purpose:

Used for ideation, synthesis, drafting, implementation assistance, and verification support.

AI session output is not authoritative unless converted into a markdown governance artifact and committed into the repository.

---

## Conflict Resolution Rules

When contradictions occur:

1. Higher-tier documents override lower-tier documents.
2. Repo markdown artifacts override conversational memory.
3. Implementation mapping overrides inferred assumptions.
4. Governance documentation overrides convenience.
5. Approved architecture overrides AI-generated optimization proposals.
6. Deployment state must match documented implementation state.
7. Strategic decisions must become markdown truth before they become operational assumptions.

---

## AI Operating Expectations

AI systems operating within the ORM ecosystem are expected to:

- respect documented governance boundaries
- avoid undocumented restructuring
- avoid assumption-based migrations
- avoid canonical changes without explicit approval
- convert strategic decisions into markdown truth
- maintain clean implementation traceability
- identify conflicts before executing changes
- defer to the documented authority hierarchy when uncertainty exists
- preserve provenance when importing AI-session material
- promote extracted memory into the correct markdown destination intentionally

---

## Non-Negotiable Principle

The repo is the source of truth.

AI tools may assist, draft, audit, reason, or implement.

They do not independently define institutional reality.
