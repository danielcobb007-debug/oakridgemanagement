# REGISTRY OPERATING WORKFLOW

## Purpose

This document defines how the ORM registry layer is operated and maintained.

Its purpose is to govern:

- registry entry creation
- registry review
- promotion-related registry maintenance
- supersession recording
- cross-linking between registry artifacts
- provenance handling for registry updates

This file governs operation of the registry layer.

It does not create new doctrine by itself.

It does not change constitutional authority.

---

## Related Registry Artifacts

- `DOCTRINE_REGISTRY.md` - authoritative index of canonical doctrine and operational-state artifacts
- `ACTIVE_CANDIDATES.md` - governed tracking space for unresolved, exploratory, or pre-promotion concepts
- `SUPERSESSION_REGISTRY.md` - lineage control for replaced, deprecated, reframed, abandoned, or subordinated concepts
- `REGISTRY_OPERATING_WORKFLOW.md` - this file

---

# Scope

This workflow applies to:

- `DOCTRINE_REGISTRY.md` updates
- `ACTIVE_CANDIDATES.md` updates
- `SUPERSESSION_REGISTRY.md` updates
- cross-domain conflict notation where governance interpretation is affected
- registry maintenance associated with promotion workflow events

This workflow does not apply to:

- application code
- website implementation
- deployment files
- investor materials
- CEH methodology development
- DGE&I execution materials except where they affect governance state, authority interpretation, or doctrine lineage

---

# Registry Update Triggers

Registry review should occur when any of the following happens:

- a new doctrine artifact is created in the repo
- a doctrine candidate is extracted or normalized
- a candidate is promoted
- a candidate is rejected or abandoned
- an artifact or concept is superseded, reframed, deprecated, abandoned, or subordinated
- a cross-domain conflict is identified
- an artifact changes governance state
- stale doctrine risk is identified during review, normalization, or audit

If none of these triggers occurs, registry updates are not required by default.

---

# Entry Creation Rules

## Doctrine Registry

Add or update an entry in `DOCTRINE_REGISTRY.md` when:

- a confirmed repo-local doctrine artifact exists
- a constitutional artifact needs registry indexing
- a workflow or operational-state artifact needs controlled indexing because it governs institutional operation

Canonical artifacts go in the Doctrine Registry.

Operationally binding workflow and operational-state artifacts may also be indexed there when they are already confirmed in the repo and materially affect governance control.

Do not add entries based only on conversational summaries or inferred importance.

## Active Candidates

Add or update an entry in `ACTIVE_CANDIDATES.md` when:

- a concept has been extracted from evidence
- a normalized doctrine candidate exists
- clarification is still required
- an unresolved concept needs tracked liminal status
- a candidate is ready for review but not yet promoted

Unresolved or exploratory concepts go in Active Candidates.

Do not move a candidate into doctrine status through repetition alone.

## Supersession Registry

Add or update an entry in `SUPERSESSION_REGISTRY.md` when:

- a prior concept has been replaced by a new controlling artifact
- an artifact has been partially superseded
- a concept has been reframed into a subordinate or narrower role
- a doctrine candidate has been rejected or abandoned and lineage should remain visible
- AI memory, legacy interpretation, or prior summaries have been explicitly subordinated by repo-local doctrine

Replaced, reframed, deprecated, abandoned, or subordinated concepts go in the Supersession Registry.

Do not claim supersession unless the basis is supported by repo-local authority.

---

# Promotion Handling

When a candidate is promoted, apply the following update pattern:

1. Update `ACTIVE_CANDIDATES.md` to reflect the new state.
2. Add or update the destination entry in `DOCTRINE_REGISTRY.md` if the promoted artifact is now a tracked doctrine, workflow, or operational-state control artifact.
3. Add or update `SUPERSESSION_REGISTRY.md` if the promoted concept replaces, narrows, reframes, or subordinates a prior concept or artifact.
4. Record the authority basis for the promotion using the governing repo-local artifact.
5. Preserve lineage from source evidence, extraction, candidate state, and promoted destination.

Promotion handling must follow `PROMOTION_WORKFLOW.md`.

The registry layer records the promotion outcome.

It does not authorize the promotion independently.

---

# Supersession Handling

When doctrine or concepts are superseded:

- do not delete the historical record
- identify the new controlling artifact or concept
- classify the supersession type
- record the authority basis
- record any residual validity that remains
- preserve enough lineage to explain why the prior concept no longer controls

No-resurrection rule:

Stale doctrine, stale summaries, and stale AI framing do not regain authority through age, repetition, convenience, or implementation reuse.

Only a new governed authority action may restore controlling status.

---

# Cross-Domain Conflict Handling

Cross-domain conflicts involving ORM, CEH, and DGE&I must be handled conservatively.

Operating rule:

- ORM governs
- CEH standardizes
- DGE&I executes

If a conflict is clearly resolved by repo-local doctrine, record the controlling basis in the relevant registry entry or notes.

If a conflict is not clearly resolved by repo-local doctrine:

- keep it unresolved
- record it as a conflict risk, clarification need, or candidate-state issue
- do not force harmonization
- do not collapse domain boundaries

Registry updates should preserve boundary visibility rather than hide tension.

---

# Review Cadence

Registry review should occur:

- during promotion events
- during normalization passes
- before major repo governance commits
- when drift, contradiction, or stale doctrine risk is identified

There is no automatic promotion based only on age, repetition, drafting quality, or AI confidence.

If nothing material has changed, the registry should remain stable.

---

# AI Intake Relationship

AI outputs may trigger candidate entries, extraction work, or registry review.

AI outputs do not create doctrine by themselves.

Imported AI memory remains subordinate to repo-local doctrine.

All AI-derived registry entries must retain provenance sufficient to identify:

- source session or artifact
- intermediate extraction or normalization layer where applicable
- current governance state

If provenance is weak, do not over-promote the entry.

---

# Guardrails

Registry operations must preserve the following guardrails:

- no accidental canonization
- no silent deletion
- no cross-domain collapse
- no promotion without authority basis
- no registry entry without source reference
- unresolved means unresolved

If a registry update would imply new doctrine rather than record governed status, stop and route through the normal promotion path first.

---

# Minimal Operating Checklist

Before committing registry updates, confirm:

- the triggering event is real and repo-relevant
- the source artifact or session is identified
- the correct registry file is being updated
- the governance state is recorded accurately
- the authority basis is named explicitly
- lineage is preserved
- any supersession is classified conservatively
- any cross-domain issue preserves ORM / CEH / DGE&I boundaries
- no unresolved item has been silently promoted

---

# Open Questions

The following governance questions remain unresolved at the registry workflow level:

- whether registry identifiers should later be standardized through a dedicated naming convention artifact
- whether review cadence should later become a mandatory workflow schedule instead of event-driven guidance
- whether clarification-required items should eventually receive a dedicated registry or namespace separate from active candidates
- whether rejected and abandoned concepts should eventually be recorded only in `SUPERSESSION_REGISTRY.md` or also remain fully represented in `ACTIVE_CANDIDATES.md`

---

# Path Note

The closest repo-local equivalent for the CEH normalization artifact is:

- `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md`

not an `Architecture/` path.
