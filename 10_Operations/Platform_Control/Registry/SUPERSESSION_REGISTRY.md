# SUPERSESSION REGISTRY

## Purpose

This document records doctrine, concepts, and authority patterns that have been replaced, partially superseded, reframed, deprecated, abandoned, or subordinated.

Its purpose is to preserve lineage and prevent silent resurrection through:

- AI context bleed
- legacy summary reuse
- duplicate abstractions
- stale doctrine references
- undocumented replacement behavior

This registry supports governance observability.

It does not itself authorize supersession.

Supersession must be supported by existing repo-local authority.

---

## Related Registry Artifacts

- `DOCTRINE_REGISTRY.md` - authoritative index of canonical doctrine and operational-state artifacts
- `ACTIVE_CANDIDATES.md` - governed tracking space for unresolved, exploratory, or pre-promotion concepts
- `SUPERSESSION_REGISTRY.md` - this file
- `REGISTRY_OPERATING_WORKFLOW.md` - operating procedure for registry updates, promotion handling, supersession handling, and cross-domain conflict notation

---

# Supersession Types

Use the following supersession types:

- `FULL_SUPERSESSION`
- `PARTIAL_SUPERSESSION`
- `SUBORDINATION`
- `REFRAMING`
- `DEPRECATION`
- `ABANDONMENT`

If the nature of replacement is not clear, do not overstate it.

---

# Lineage Rules

Each supersession record should identify:

- the prior concept or artifact
- the new controlling concept or artifact
- the type of supersession
- the authority basis
- any residual validity that still remains

Where a prior artifact remains partially useful for orientation, record that explicitly rather than deleting it from memory.

---

# No-Resurrection Rule

Once a concept or artifact has been superseded or subordinated in this registry, it must not be treated as controlling authority again unless:

- a higher-authority artifact explicitly restores it, or
- a new governed decision creates a new controlling status

Legacy repetition, AI recall, or implementation convenience do not restore authority.

---

# Starter Supersession Table

Only clearly supported supersession or subordination relationships are recorded here.

| Supersession ID | Prior Concept / Artifact | New Controlling Concept / Artifact | Supersession Type | Effective Date | Authority Basis | Residual Validity | Notes |
|---|---|---|---|---|---|---|---|
| SUP-001 | `09_AI_Systems/System_Context/SYSTEM_MAP.md` boundary language touching platform and ownership interpretation | `00_Governance/PLATFORM_BOUNDARY_MAP.md` | `PARTIAL_SUPERSESSION` | Pre-registry; exact date not yet recorded | `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md` | Orientation value may remain outside superseded areas | ORM normalization map states that parts are already superseded by constitutional boundary docs |
| SUP-002 | `09_AI_Systems/System_Context/SYSTEM_MAP.md` repo and ownership interpretation | `00_Governance/REPO_OWNERSHIP_MAP.md` | `PARTIAL_SUPERSESSION` | Pre-registry; exact date not yet recorded | `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md` | Orientation value may remain outside superseded areas | Repo authority interpretation should follow the constitutional ownership map |
| SUP-003 | Conversational AI outputs, imported memory artifacts, and remembered chat framing treated as controlling authority | Repo-local governed doctrine and workflow artifacts, including `00_Governance/SYSTEM_OF_RECORD.md`, `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`, and `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md` | `SUBORDINATION` | In force by current governed repo state; exact date not yet registry-managed | Repo-local governance doctrine and workflow | Retained only as evidence, extraction input, or candidate support unless promoted | This is an authority subordination rule, not deletion of memory artifacts |

---

# Current Registry Status

No additional supersession relationships are recorded yet.

Do not infer more until the governing basis is explicit in repo-local doctrine or normalization artifacts.
