# DOCTRINE REGISTRY

## Purpose

This document establishes the registry layer for doctrine and governance-critical operational artifacts across the ORM governance operating system.

Its purpose is to create an enforceable index for:

- constitutional authority
- doctrine authority
- workflow authority
- operational-state control artifacts
- dependency visibility
- review discipline
- supersession linkage

This registry exists to reduce interpretive drift as the repository moves from document-centric governance toward enforcement and observability maturity.

It does not promote artifacts by itself.

It records the status of artifacts that are already governed elsewhere.

---

## Related Registry Artifacts

- `DOCTRINE_REGISTRY.md` - this file
- `ACTIVE_CANDIDATES.md` - governed tracking space for unresolved, exploratory, or pre-promotion concepts
- `SUPERSESSION_REGISTRY.md` - lineage control for replaced, deprecated, reframed, abandoned, or subordinated concepts
- `REGISTRY_OPERATING_WORKFLOW.md` - operating procedure for registry updates, promotion handling, supersession handling, and cross-domain conflict notation

---

# Authority Rules

1. ORM remains the governing authority for the ecosystem.
2. CEH remains subordinate standards infrastructure under ORM governance.
3. DGE&I remains subordinate execution and infrastructure platform doctrine under ORM governance.
4. Repo-local doctrine overrides conversational memory, imported AI outputs, and ungoverned interpretation.
5. Registry records do not create canon independently; promotion authority remains governed by `SYSTEM_OF_RECORD.md`, `GOVERNANCE_STATE_DEFINITIONS.md`, and `PROMOTION_WORKFLOW.md`.
6. Where a registry entry conflicts with a higher-authority artifact, the higher-authority artifact governs.

---

# Registry Fields

Each entry should track:

- Doctrine ID
- Artifact Name
- Domain
- Authority Level
- Governance State
- Current Version / Date
- Supersession Status
- Depends On
- Review Cadence
- Notes

---

# Domain Classifications

Use the following domain classifications unless higher governance later expands them:

- `ORM`
- `CEH`
- `DGEI`
- `CROSS_DOMAIN`

Cross-domain entries must not collapse entity boundaries.

Use `CROSS_DOMAIN` only when the artifact explicitly governs interaction across domains.

---

# Governance States

Registry entries should use the repo-governed state model:

- `CONSTITUTION`
- `DOCTRINE`
- `OPERATIONAL_STATE`
- `WORKFLOW`
- `NORMALIZED_DOCTRINE_CANDIDATE`
- `MEMORY`
- `EVIDENCE`
- `EXPLORATION`
- `ARCHIVE`

The registry may record an artifact in any state, but only confirmed artifacts already present in the repo should be listed as active records.

---

# Review Logic

Registry review should follow authority level rather than convenience.

- `CONSTITUTION`: review on explicit governance change, authority conflict, or approved structural update
- `DOCTRINE`: review on promotion event, dependency change, or detected drift
- `WORKFLOW`: review when the workflow changes in practice or when repeated exceptions appear
- `OPERATIONAL_STATE`: review whenever the recorded operational reality changes materially

If an artifact has not yet been versioned or assigned a formal review schedule, record that explicitly rather than inferring it.

---

# Starter Registry Table

This starter table is intentionally conservative.

It includes only confirmed repo-local artifacts already present in the repository.

| Doctrine ID | Artifact Name | Domain | Authority Level | Governance State | Current Version / Date | Supersession Status | Depends On | Review Cadence | Notes |
|---|---|---|---|---|---|---|---|---|---|
| ORM-CONST-001 | `00_Governance/SYSTEM_OF_RECORD.md` | `ORM` | Highest | `CONSTITUTION` | Unversioned; date not yet registry-managed | Active | Final approved human governance decisions | On constitutional change | Top-level control index for authority conflicts |
| ORM-CONST-002 | `00_Governance/PLATFORM_BOUNDARY_MAP.md` | `CROSS_DOMAIN` | Highest | `CONSTITUTION` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On boundary change | Governs entity-boundary interpretation |
| ORM-CONST-003 | `00_Governance/CANONICAL_DOMAIN_REGISTRY.md` | `CROSS_DOMAIN` | Highest | `CONSTITUTION` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On domain change | Governs canonical domain interpretation |
| ORM-CONST-004 | `00_Governance/REPO_OWNERSHIP_MAP.md` | `ORM` | Highest | `CONSTITUTION` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On repo-authority change | Governs repo authority interpretation |
| ORM-DOC-001 | `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md` | `ORM` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On authority-stack change | Operational authority hierarchy for repo truth handling |
| ORM-DOC-002 | `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md` | `ORM` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On state-model change | Defines state classes used across the governance system |
| ORM-WF-001 | `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md` | `ORM` | High | `WORKFLOW` | Unversioned; date not yet registry-managed | Active | `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md` | On promotion-rule change | Governs evidence-to-doctrine progression |
| ORM-DOC-003 | `10_Operations/Platform_Control/Governance/CHANGE_CONTROL_POLICY.md` | `ORM` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On change-control revision | Change governance doctrine |
| ORM-DOC-004 | `10_Operations/Platform_Control/Governance/ESCALATION_RULES.md` | `ORM` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md` | On escalation-rule change | Clarification and conflict routing doctrine |
| ORM-DOC-005 | `10_Operations/Platform_Control/Architecture/PLATFORM_VS_WEBSITE_ARCHITECTURE.md` | `CROSS_DOMAIN` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/PLATFORM_BOUNDARY_MAP.md` | On architecture-boundary change | Prevents website implementation from being treated as institutional truth |
| ORM-DOC-006 | `10_Operations/Platform_Control/Architecture/OPERATIONAL_EXECUTION_MODEL.md` | `ORM` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md` | On execution-model change | Governs execution-role structure |
| ORM-WF-002 | `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md` | `ORM` | Medium | `WORKFLOW` | Unversioned; date not yet registry-managed | Active | `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md`, `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md` | On normalization-rule change | ORM-first normalization bridge |
| CEH-DOC-001 | `10_Operations/Platform_Control/Standards/STANDARDS_GOVERNANCE.md` | `CEH` | High | `DOCTRINE` | Unversioned; date not yet registry-managed | Active | `00_Governance/SYSTEM_OF_RECORD.md`, `00_Governance/PLATFORM_BOUNDARY_MAP.md` | On standards-governance change | Parent standards doctrine governing CEH normalization |
| CEH-WF-001 | `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md` | `CEH` | Medium | `WORKFLOW` | Unversioned; date not yet registry-managed | Active | `10_Operations/Platform_Control/Standards/STANDARDS_GOVERNANCE.md`, `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md` | On CEH normalization-rule change | Repo-local CEH normalization artifact; note path is under `Standards/`, not `Architecture/` |
| DGEI-WF-001 | `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md` | `DGEI` | Medium | `WORKFLOW` | Unversioned; date not yet registry-managed | Active | `00_Governance/PLATFORM_BOUNDARY_MAP.md`, `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md` | On DGEI normalization-rule change | Repo-local DGE&I normalization artifact |
| ORM-OPS-001 | `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md` | `ORM` | Medium | `OPERATIONAL_STATE` | Unversioned; date not yet registry-managed | Active | Platform Control doctrine set | When operating reality changes materially | Current command-center state artifact |
| ORM-OPS-002 | `10_Operations/Platform_Control/Active_Workstreams/ACTIVE_WORKSTREAMS.md` | `ORM` | Medium | `OPERATIONAL_STATE` | Unversioned; date not yet registry-managed | Active | Platform Control doctrine set | When workstream status changes materially | Current coordination state artifact |

---

# Operating Note

This registry is a control surface, not a substitute for the underlying artifacts.

Future expansion should prefer adding governed entries and review discipline over adding freeform commentary.
