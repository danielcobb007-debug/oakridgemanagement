# Post-Commit 2 Planning Audit — 2026-05-17

## Executive Summary
Commit `b997f68` successfully isolated and committed the AI memory extraction and normalization control layer. The remaining working tree is still mixed across platform governance, ORM/CEH/DGE&I doctrine artifacts, website-control surfaces, session/context scaffolding, command-folder duplication, and a small set of binary/generated artifacts. The next safe sequence is to avoid a broad catch-all commit and instead separate doctrine/governance work from website work, binary artifacts, and structural cleanup.

## Category Review

### 1. Platform governance / source-of-truth updates
Files:
- Modified:
  - `10_Operations/Platform_Control/Active_Workstreams/ACTIVE_WORKSTREAMS.md`
  - `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
  - `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`
  - `10_Operations/Platform_Control/README.md`
  - `10_Operations/Platform_Control/Registry/ACTIVE_CANDIDATES.md`
- Untracked:
  - `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md`
  - `10_Operations/Platform_Control/Governance/ORM_COORDINATION_GOVERNANCE_PRINCIPLES.md`
  - `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md`
  - `10_Operations/Platform_Control/Memory/NEXT_SESSION_CONTEXT_2026-05-12.md`
  - `10_Operations/Platform_Control/Memory/PAUSE_AND_RELOAD_ALIGNMENT_2026-05-12.md`

Recommendation:
- `audit first`

Reason:
- These are high-authority files and should not be bundled casually with architecture or website work.
- The modified tracked files may be pre-existing changes that deserve review before inclusion in a doctrine commit.

### 2. ORM architecture artifacts
Files:
- `10_Operations/Platform_Control/Architecture/ORM_ECOSYSTEM_ARCHITECTURE.md`
- `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md`
- `10_Operations/Platform_Control/Architecture/ORM_OUTWARD_POSITIONING_FRAMEWORK.md`
- `10_Operations/Platform_Control/Architecture/ORM_PARTNER_TOPOLOGY.md`
- `10_Operations/Platform_Control/Architecture/ORM_PUBLIC_CLAIMS_BOUNDARY.md`
- `10_Operations/Platform_Control/Architecture/ORM_PUBLIC_IDENTITY_CLARIFICATION.md`

Recommendation:
- `commit later`

Reason:
- These are coherent doctrine/architecture artifacts and look like a natural doctrine commit, but should follow governance review rather than precede it.

### 3. CEH standards artifacts
Files:
- `02_CEH_Standard/`
- `10_Operations/Platform_Control/Standards/CEH_CHARTER.md`
- `10_Operations/Platform_Control/Standards/CEH_CLASSIFICATION_CLARIFICATION.md`
- `10_Operations/Platform_Control/Standards/CEH_DGEI_RELATIONSHIP_BOUNDARY.md`
- `10_Operations/Platform_Control/Standards/CEH_GOVERNANCE_AND_PROVENANCE.md`
- `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md`
- `10_Operations/Platform_Control/Standards/CEH_OPEN_LOOPS.md`
- `10_Operations/Platform_Control/Standards/CEH_OWNERSHIP_AND_IP.md`
- `10_Operations/Platform_Control/Active_Workstreams/CEH_STRATEGIC_LANE.md`

Recommendation:
- `commit later`

Reason:
- These form a coherent standards/governance slice and should likely be committed together with related ORM/DGE&I doctrine only after explicit review.

### 4. DGE&I architecture artifacts
Files:
- `04_DGEI_Relationship/`
- `10_Operations/Platform_Control/Architecture/DGEI_GOVERNANCE_AND_PROVENANCE.md`
- `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md`
- `10_Operations/Platform_Control/Architecture/DGEI_OPEN_LOOPS.md`
- `10_Operations/Platform_Control/Architecture/DGEI_ORM_RELATIONSHIP_BOUNDARY.md`
- `10_Operations/Platform_Control/Architecture/DGEI_PLATFORM_CHARTER.md`

Recommendation:
- `commit later`

Reason:
- These are coherent and audit-backed, but still belong in a doctrine/architecture commit rather than the next immediate governance cleanup commit.

### 5. Website control artifacts
Files:
- Modified:
  - `10_Operations/Website_Control/WEBSITE_BUILD_QUEUE.md`
  - `10_Operations/Website_Control/orm-surface-test.html`
- Untracked:
  - `10_Operations/Website_Control/DGEI_SYSTEM_CARTOGRAPHY_DIRECTION.md`
  - `10_Operations/Website_Control/ORM_CEH_DGEI_VISUAL_RELATIONSHIP_FRAMEWORK.md`
  - `10_Operations/Website_Control/ORM_HOMEPAGE_HIERARCHY_MAP.md`
  - `10_Operations/Website_Control/ORM_HOMEPAGE_STRUCTURE_EVALUATION.md`
  - `10_Operations/Website_Control/ORM_HOMEPAGE_WIREFRAME_NOTES.md`
  - `10_Operations/Website_Control/ORM_PACING_DIAGRAM_NOTES.md`
  - `10_Operations/Website_Control/ORM_TYPOGRAPHY_AUTHORITY_FRAMEWORK.md`
  - `10_Operations/Website_Control/ORM_VISUAL_DIRECTION_BRIEF.md`
  - `10_Operations/Website_Control/ORM_VISUAL_REFERENCE_TEST.md`
  - `10_Operations/Website_Control/WEBSITE_DESIGN_SYSTEM_EVALUATION.md`

Recommendation:
- `audit first`

Reason:
- Website-control changes are logically separate from doctrine and from memory work.
- Modified tracked files should be reviewed deliberately before staging.

### 6. Command folder consolidation candidates
Folders:
- `10_Operations/Platform_Control/Command Center/`
- `10_Operations/Platform_Control/Command Huddle/`
- `10_Operations/Platform_Control/Command_Huddle/`

Recommendation:
- `consolidate before committing`

Reason:
- These represent structural ambiguity and should not be committed as-is if the goal is a cleaner source-of-truth layout.
- At minimum they need an inventory and migration plan first.

### 7. Session / distilled context artifacts
Files and folders:
- `09_AI_Systems/Distilled_Context/`
- `09_AI_Systems/Incoming/`
- `09_AI_Systems/Session_Extraction/`
- `09_AI_Systems/INSTITUTIONAL_MEMORY_INTAKE.md`
- `09_AI_Systems/MEMORY_INDEX.md`

Recommendation:
- `audit first`

Reason:
- These sit adjacent to the memory-extraction layer but were not included in Commit 1.
- They may belong in a future memory-governance commit, but should be reviewed for overlap with already-committed artifacts.

### 8. Binary / model artifacts
Files:
- `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.xlsx`
- `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html`
- `10_Operations/Platform_Control/Architecture/build_ceh_excel.py`

Recommendation:
- `exclude/ignore` for the binary and generated artifacts
- `audit first` for the Python generator

Reason:
- The workbook and generated HTML are not ideal for a doctrine commit.
- If intentionally tracked, they should be handled in a separate artifacts commit with policy clarity.

### 9. Files to exclude or defer
Recommendation:
- `exclude/ignore`

Files:
- raw ChatGPT archive ZIPs under `09_AI_Systems/ChatGPT_Export/Raw/`
- lock files already ignored
- local app-state if copied into repo

Recommendation:
- `defer`

Files:
- website modified files
- binary workbook/html artifacts
- command-folder candidates

## Recommended Commit 2 Scope
Best next scope:
- platform governance and source-of-truth updates only, after review

Preferred contents after audit:
- `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md`
- `10_Operations/Platform_Control/Governance/ORM_COORDINATION_GOVERNANCE_PRINCIPLES.md`
- `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md`
- optionally reviewed updates to:
  - `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`
  - `10_Operations/Platform_Control/README.md`
  - `10_Operations/Platform_Control/Registry/ACTIVE_CANDIDATES.md`

Keep out of Commit 2:
- website-control files
- CEH and DGE&I doctrine bundles
- command-folder cleanup
- binary workbook/html artifacts

## Recommended Commit 3 Scope
Best next scope:
- ORM, CEH, and DGE&I architecture and standards artifacts, if reviewed together as one doctrine package

Likely contents:
- ORM architecture files
- CEH standards files
- DGE&I architecture files
- possibly `CEH_STRATEGIC_LANE.md`

Keep out of Commit 3:
- website-control files
- command-folder cleanup
- workbook/html artifacts unless separately justified

## Files To Avoid Staging
- `10_Operations/Website_Control/WEBSITE_BUILD_QUEUE.md`
- `10_Operations/Website_Control/orm-surface-test.html`
- `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.xlsx`
- `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html`
- `10_Operations/Platform_Control/Architecture/build_ceh_excel.py`
- `10_Operations/Platform_Control/Command Center/`
- `10_Operations/Platform_Control/Command Huddle/`
- `10_Operations/Platform_Control/Command_Huddle/`
- raw ZIP/archive material

## Risks
- bundling tracked modified governance files with unreviewed doctrine files could blur commit intent
- website-control artifacts can contaminate doctrine commits
- duplicate command folders can create ongoing source-of-truth ambiguity
- workbook/html binary artifacts can create noisy history and unclear policy
- session/distilled-context files may overlap conceptually with already-committed memory-control artifacts and need review before staging

## Next Safe Commands
Recommendations only. Do not run blindly.

If proceeding toward a governance-only Commit 2 after review:

```powershell
git -C "C:\Users\dpc\Oak Ridge Management(1)\Oak Ridge Management - Documents" add -- `
  "10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md" `
  "10_Operations/Platform_Control/Governance/ORM_COORDINATION_GOVERNANCE_PRINCIPLES.md" `
  "10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md"
```

Then inspect:

```powershell
git -C "C:\Users\dpc\Oak Ridge Management(1)\Oak Ridge Management - Documents" diff --cached --name-only
git -C "C:\Users\dpc\Oak Ridge Management(1)\Oak Ridge Management - Documents" status --short
```

If the tracked modified governance files are also intended for Commit 2, add them explicitly one by one after review rather than using a broad directory add.
