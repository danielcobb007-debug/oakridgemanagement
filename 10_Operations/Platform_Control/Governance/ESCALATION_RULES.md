# ESCALATION RULES

## Purpose

This document defines how ambiguity, conflict, uncertainty, and implementation disputes are escalated within the Oak Ridge Management Platform Control Layer.

Its purpose is to prevent unresolved uncertainty from becoming operational drift.

---

# Core Principle

Uncertainty must be routed before it becomes implementation.

---

# Escalation Triggers

Escalation is required when:

- governance documents conflict
- website behavior conflicts with platform architecture
- AI systems produce contradictory recommendations
- source-file ownership is unclear
- route classification is uncertain
- standards language affects commercial positioning
- public-facing content may alter institutional meaning
- deployment state differs from documented state
- repo structure does not match documented architecture
- proposed changes impact multiple workstreams

---

# Escalation Routing

## Strategic Ambiguity

Route to:

- Bea / ChatGPT
- Platform Control governance review
- DECISIONS.md if a decision is made

Examples:

- institutional framing
- platform/product separation
- CEH vs CEH Index boundaries
- ORM vs DGE&I boundaries
- capital or commercialization implications

---

## Implementation Ambiguity

Route to:

- Claude
- implementation mapping
- source-file ownership review

Examples:

- page edits
- content implementation
- HTML/CSS changes
- file placement
- route behavior
- build sequencing

---

## Repo / Deployment Ambiguity

Route to:

- Codex
- git status review
- deployment verification
- audit checklist

Examples:

- merge conflicts
- untracked files
- deployment drift
- Netlify/live route mismatch
- branch divergence
- rollback uncertainty

---

## Governance Contradiction

Resolve through:

1. SOURCE_OF_TRUTH_HIERARCHY.md
2. CHANGE_CONTROL_POLICY.md
3. DECISIONS.md
4. relevant implementation maps
5. explicit new governance decision if unresolved

---

# Decision Capture Rule

If escalation produces a decision that affects future work, it must be documented in one of:

- DECISIONS.md
- SESSION_LOG.md
- relevant governance document
- relevant implementation map
- next-session context file

Conversation alone is not sufficient.

---

# AI Escalation Rule

AI tools may identify ambiguity, propose resolutions, and draft updates.

They may not silently resolve governance conflicts by implementation.

When uncertainty exists, AI tools must pause, identify the conflict, and route it through the appropriate governance layer.

---

# Non-Negotiable Principle

Ambiguity is acceptable when documented.

Undocumented ambiguity is operational risk.