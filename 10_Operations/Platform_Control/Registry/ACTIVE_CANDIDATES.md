# ACTIVE CANDIDATES

## Purpose

This document creates a governed holding layer for concepts that are under active consideration but are not yet canonical doctrine or settled operational state.

Its purpose is to preserve unresolved work without:

- premature canonization
- AI memory bleed
- silent doctrine creation
- cross-domain contamination
- candidate loss through cleanup

This registry records liminal governance material.

It does not settle unresolved questions by itself.

---

## Related Registry Artifacts

- `DOCTRINE_REGISTRY.md` - authoritative index of canonical doctrine and operational-state artifacts
- `ACTIVE_CANDIDATES.md` - this file
- `SUPERSESSION_REGISTRY.md` - lineage control for replaced, deprecated, reframed, abandoned, or subordinated concepts
- `REGISTRY_OPERATING_WORKFLOW.md` - operating procedure for registry updates, promotion handling, supersession handling, and cross-domain conflict notation

---

# Candidate States

Use the following candidate states:

- `EXTRACTION`
- `NORMALIZED_DOCTRINE_CANDIDATE`
- `PENDING_CLARIFICATION`
- `READY_FOR_REVIEW`
- `ABANDONED`
- `REJECTED`
- `PROMOTED`

If a concept remains unresolved, keep it unresolved.

Do not collapse ambiguity for convenience.

---

# Promotion Eligibility

A candidate may be considered for promotion only when:

- lineage is recoverable
- the governing domain is clear
- the promotion target is clear
- cross-domain contamination risk is understood
- required clarification has been resolved enough for the target authority layer

Promotion authority remains governed by repo-local doctrine and workflow artifacts, not by this registry.

---

# Clarification Handling

Use clarification handling when:

- ownership is unresolved
- monetization structure is unresolved
- methodology is incomplete
- authority boundaries are unclear
- multiple interpretations remain plausible

Candidates requiring clarification should remain visible rather than being forced into doctrine.

---

# Rejection And Abandonment Handling

If a candidate is not promoted:

- mark it `REJECTED` when governance has decided against it
- mark it `ABANDONED` when it is no longer active but has not been formally invalidated
- mark it `PROMOTED` when it has been moved into a governed destination artifact

Rejected or abandoned items should remain recorded for lineage and non-resurrection control.

---

# Starter Candidate Table

This starter table contains only candidates explicitly supported by existing repo-local normalization artifacts.

| Candidate ID | Candidate Name | Source Domain | Source Artifact / Session | Current State | Required Clarification | Promotion Target | Conflict Risk | Notes |
|---|---|---|---|---|---|---|---|---|
| CEH-CAND-001 | CEH belongs to ORM, not DGE&I | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Low | `DOCTRINE` | Medium | Candidate for ownership and boundary doctrine; do not treat as settled beyond existing governed references |
| CEH-CAND-002 | CEH Standard is the parent framework | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Low | `DOCTRINE` | Medium | Candidate for CEH hierarchy doctrine |
| CEH-CAND-003 | CEH Index and CEH Infrastructure Index are derivative products | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Medium | `DOCTRINE` | High | Product hierarchy remains sensitive and should not bypass clarification |
| CEH-CAND-004 | CEH as capital-markets translation layer | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `PENDING_CLARIFICATION` | Yes | `NORMALIZED_DOCTRINE_CANDIDATE` | High | Directional concept; not yet suitable for canon |
| CEH-CAND-005 | CEH monetization pathways | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `PENDING_CLARIFICATION` | Yes | `NORMALIZED_DOCTRINE_CANDIDATE` | High | Commercialization remains unresolved |
| CEH-CAND-006 | Related-party scoring disclosure controls | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `PENDING_CLARIFICATION` | Yes | `NORMALIZED_DOCTRINE_CANDIDATE` | High | Must remain unresolved until formalized |
| CEH-CAND-007 | CEH Classification: Standard, Metric, Methodology, or Benchmark | `CEH` | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md`; `10_Operations/Platform_Control/Standards/CEH_CHARTER.md`; `10_Operations/Platform_Control/Standards/CEH_GOVERNANCE_AND_PROVENANCE.md`; `10_Operations/Platform_Control/Standards/CEH_DGEI_RELATIONSHIP_BOUNDARY.md` | `PENDING_CLARIFICATION` | Resolve whether CEH should be governed primarily as an institutional standard, a calculable metric, a methodology layer, a benchmark/index, or a hierarchy containing more than one of these | `DOCTRINE` | High | Preserve ambiguity. CEH should not be reduced prematurely to a single formula where repo-local materials support a broader standards framework. CEH should not be promoted as doctrine until its classification hierarchy is clarified. CEH remains subordinate to ORM governance. DGE&I may use or reference CEH but should not control CEH classification. Any benchmark or index framing must remain distinguished from the core CEH standard. |
| DGEI-CAND-001 | DGE&I as repeatable infrastructure platform | `DGEI` | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Low | `DOCTRINE` | Medium | Platform doctrine candidate; not constitutional authority |
| DGEI-CAND-002 | DGE&I as execution layer subordinate to ORM governance | `DGEI` | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Low | `DOCTRINE` | Medium | Boundary candidate reinforcing ORM authority |
| DGEI-CAND-003 | Hybrid grid plus BTM architecture as directional platform doctrine | `DGEI` | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `NORMALIZED_DOCTRINE_CANDIDATE` | Medium | `DOCTRINE` | Medium | Directional technical doctrine candidate pending validation maturity |
| DGEI-CAND-004 | AI factory positioning | `DGEI` | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `PENDING_CLARIFICATION` | Yes | `EXPLORATION` | High | Positioning concept should not be canonized through repetition |
| DGEI-CAND-005 | Capital-stack and compute monetization structure | `DGEI` | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `PENDING_CLARIFICATION` | Yes | `NORMALIZED_DOCTRINE_CANDIDATE` | High | Commercial structure unresolved |
| ORM-CAND-001 | Formal normalized-doctrine-candidate namespace | `ORM` | `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md` | `READY_FOR_REVIEW` | Medium | `WORKFLOW` | Low | Registry architecture begins to address this, but full namespace formalization is not yet settled |
| ORM-CAND-002 | Clarification namespace formalization | `ORM` | `10_Operations/Platform_Control/Memory/PAUSE_AND_RELOAD_ALIGNMENT_2026-05-12.md` | `PENDING_CLARIFICATION` | Yes | `WORKFLOW` | Medium | Keep separate from doctrine promotion until resolved |

---

# Placeholder Handling

No placeholder candidates are active in this starter version.

Add placeholders only when a known workstream needs a reserved slot before a candidate is fully named.
