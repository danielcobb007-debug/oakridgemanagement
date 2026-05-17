# Repo Hygiene And Commit Readiness Audit — 2026-05-17

## Executive Summary
This audit reviews the repository state after the first controlled AI memory extraction and normalization checkpoint. The AI memory system itself is structurally coherent enough to commit in logical groups, but the broader working tree also contains governance, standards, website, architecture, and folder-structure changes that should be separated carefully. Raw archives, lock files, temporary artifacts, and large binaries should not be included in a default commit without an explicit storage policy.

No repository changes were made during this audit other than creating this report.

## Files And Folders By Category

### AI memory extraction / normalization system
- `09_AI_Systems/Memory_Extraction/`
- `09_AI_Systems/Distilled_Context/`
- `09_AI_Systems/Incoming/`
- `09_AI_Systems/Session_Extraction/`
- `09_AI_Systems/INSTITUTIONAL_MEMORY_INTAKE.md`
- `09_AI_Systems/MEMORY_INDEX.md`

### Existing governance / platform control files
- Modified:
  - `10_Operations/Platform_Control/Active_Workstreams/ACTIVE_WORKSTREAMS.md`
  - `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
  - `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`
  - `10_Operations/Platform_Control/README.md`
  - `10_Operations/Platform_Control/Registry/ACTIVE_CANDIDATES.md`
- Untracked governance and architecture:
  - `10_Operations/Platform_Control/Governance/GOVERNANCE_STATE_DEFINITIONS.md`
  - `10_Operations/Platform_Control/Governance/ORM_COORDINATION_GOVERNANCE_PRINCIPLES.md`
  - `10_Operations/Platform_Control/Governance/PROMOTION_WORKFLOW.md`
  - `10_Operations/Platform_Control/Architecture/ORM_NORMALIZATION_MAP.md`
  - `10_Operations/Platform_Control/Architecture/ORM_ECOSYSTEM_ARCHITECTURE.md`
  - `10_Operations/Platform_Control/Architecture/ORM_OUTWARD_POSITIONING_FRAMEWORK.md`
  - `10_Operations/Platform_Control/Architecture/ORM_PARTNER_TOPOLOGY.md`
  - `10_Operations/Platform_Control/Architecture/ORM_PUBLIC_CLAIMS_BOUNDARY.md`
  - `10_Operations/Platform_Control/Architecture/ORM_PUBLIC_IDENTITY_CLARIFICATION.md`
  - `10_Operations/Platform_Control/Architecture/DGEI_GOVERNANCE_AND_PROVENANCE.md`
  - `10_Operations/Platform_Control/Architecture/DGEI_NORMALIZATION_MAP.md`
  - `10_Operations/Platform_Control/Architecture/DGEI_OPEN_LOOPS.md`
  - `10_Operations/Platform_Control/Architecture/DGEI_ORM_RELATIONSHIP_BOUNDARY.md`
  - `10_Operations/Platform_Control/Architecture/DGEI_PLATFORM_CHARTER.md`
  - `10_Operations/Platform_Control/Memory/NEXT_SESSION_CONTEXT_2026-05-12.md`
  - `10_Operations/Platform_Control/Memory/PAUSE_AND_RELOAD_ALIGNMENT_2026-05-12.md`

### Website control files
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

### CEH standard files
- `02_CEH_Standard/`
- `10_Operations/Platform_Control/Standards/CEH_CHARTER.md`
- `10_Operations/Platform_Control/Standards/CEH_CLASSIFICATION_CLARIFICATION.md`
- `10_Operations/Platform_Control/Standards/CEH_DGEI_RELATIONSHIP_BOUNDARY.md`
- `10_Operations/Platform_Control/Standards/CEH_GOVERNANCE_AND_PROVENANCE.md`
- `10_Operations/Platform_Control/Standards/CEH_NORMALIZATION_MAP.md`
- `10_Operations/Platform_Control/Standards/CEH_OPEN_LOOPS.md`
- `10_Operations/Platform_Control/Standards/CEH_OWNERSHIP_AND_IP.md`
- `10_Operations/Platform_Control/Active_Workstreams/CEH_STRATEGIC_LANE.md`
- Related binaries and generated artifacts:
  - `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.xlsx`
  - `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html`
  - `10_Operations/Platform_Control/Architecture/build_ceh_excel.py`

### DGE&I relationship files
- `04_DGEI_Relationship/`
- DGE&I architecture and normalization files under `10_Operations/Platform_Control/Architecture/`
- DGE&I visual/cartography files under `10_Operations/Website_Control/`

### Partner files
- `07_Partners/`

### Raw export / archive files
- `09_AI_Systems/ChatGPT_Export/`
- `09_AI_Systems/ChatGPT_Export/Raw/6983b8f97d5512829399371574d104cdfd9ecd2ee5a5ebf50cdbdf3da8b6aac5-2026-05-16-12-56-21-249ce10772524f68bfa173bea492c753.zip`

### Temporary / lock files
- `10_Operations/Platform_Control/Architecture/.~lock.CEH_Flywheel_Pricing_Model_v1.0.xlsx#`

### Duplicate command folder candidates
- `10_Operations/Platform_Control/Command Center/`
- `10_Operations/Platform_Control/Command Huddle/`
- `10_Operations/Platform_Control/Command_Huddle/`

### Unrelated pre-existing modifications
These appear outside the memory-extraction sequence and should not be bundled into a memory-system commit by default:
- `10_Operations/Platform_Control/Active_Workstreams/ACTIVE_WORKSTREAMS.md`
- `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
- `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`
- `10_Operations/Platform_Control/README.md`
- `10_Operations/Platform_Control/Registry/ACTIVE_CANDIDATES.md`
- `10_Operations/Website_Control/WEBSITE_BUILD_QUEUE.md`
- `10_Operations/Website_Control/orm-surface-test.html`

## Proposed Commit Groups

### Commit A — AI memory extraction pipeline and reports
Recommended contents:
- `09_AI_Systems/Memory_Extraction/Scripts/`
- `09_AI_Systems/Memory_Extraction/Reports/`
- `09_AI_Systems/Memory_Extraction/README.md`
- review queues under:
  - `09_AI_Systems/Memory_Extraction/Legal_Sensitive/`
  - `09_AI_Systems/Memory_Extraction/Partner_Consent_Required/`
  - `09_AI_Systems/Memory_Extraction/Promotion_Queue/`
- raw project extractions under:
  - `09_AI_Systems/Memory_Extraction/Raw_Project_Extractions/`

Notes:
- Strong candidate if the intent is to version the derived pipeline and reproducible reports.
- Raw source archives should be excluded by default from this commit group.

### Commit B — normalized AI / ORM / CEH / DGE&I checkpoint files
Recommended contents:
- `09_AI_Systems/Memory_Extraction/Normalized_Index/AI_SYSTEMS_COMMAND_LAYER_NORMALIZATION.md`
- `09_AI_Systems/Memory_Extraction/Normalized_Index/ORM_NORMALIZATION_FROM_AI_MEMORY.md`
- `09_AI_Systems/Memory_Extraction/Normalized_Index/CEH_NORMALIZATION_FROM_AI_MEMORY.md`
- `09_AI_Systems/Memory_Extraction/Normalized_Index/DGEI_NORMALIZATION_FROM_AI_MEMORY.md`
- `09_AI_Systems/Memory_Extraction/Normalized_Index/NORMALIZATION_CHECKPOINT_2026-05-17.md`

Notes:
- Keep separate from Commit A if you want a clean split between extraction machinery and normalized internal drafting.

### Commit C — governance and standards artifacts
Recommended contents only if intentionally ready:
- `10_Operations/Platform_Control/Governance/*.md`
- `10_Operations/Platform_Control/Architecture/ORM_*.md`
- `10_Operations/Platform_Control/Architecture/DGEI_*.md`
- `10_Operations/Platform_Control/Standards/CEH_*.md`
- `10_Operations/Platform_Control/Memory/*.md`
- `10_Operations/Platform_Control/Active_Workstreams/CEH_STRATEGIC_LANE.md`

Notes:
- This should likely be reviewed as its own doctrine/governance commit because it is broader than memory extraction.

### Commit D — website and design-control work
Recommended contents only if intentionally ready:
- `10_Operations/Website_Control/*.md`
- `10_Operations/Website_Control/orm-surface-test.html`

Notes:
- This is separate from doctrine and separate from extraction work.

### Exclude by default
- raw ZIP exports
- Office lock files
- generated spreadsheet/html pairs unless intentionally tracked
- large binaries without explicit policy
- temporary or cache-like artifacts

## Proposed Exclusions
- `09_AI_Systems/ChatGPT_Export/Raw/*.zip`
- extracted media or binary attachments if they are later copied into the repo
- `*.wav`
- `*.mp4`
- `*.png`
- `*.jpg`
- `*.jpeg`
- `*.heic`
- `*.webp`
- `*.pdf`
- `*.docx`
- `*.xlsx`
- `*.pptx`
- `*.msg`
- `.~lock.*`
- generated HTML or workbook derivatives if they can be rebuilt reliably and are not intended as source artifacts

## Proposed .gitignore Additions
Candidate patterns:

```gitignore
# Office / temp locks
.~lock.*
~$*

# AI raw exports and large archives
09_AI_Systems/ChatGPT_Export/Raw/*.zip
09_AI_Systems/ChatGPT_Export/Raw/**/*.zip

# Imported raw media or attachment payloads
*.wav
*.mp4
*.heic

# Optional: generated workbook/html artifacts if reproducible
10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html
```

Notes:
- Do not add broad image/document ignore rules globally unless the repo does not intentionally track such assets elsewhere.
- A narrower path-based ignore policy is safer than a repo-wide ban if media and documents are used legitimately in other areas.
- Generated reports under `09_AI_Systems/Memory_Extraction/Reports/` should be tracked if you want the normalization checkpoint to be auditable without rerunning scripts.

## Raw Archive Policy Recommendation
Recommended default:
- keep the raw ChatGPT export ZIP outside normal git history
- store it in a controlled OneDrive or SharePoint archive or a separate immutable archive location
- reference it inside the repo by path, file hash, and export timestamp

Rationale:
- the ZIP is large and sensitive
- it contains mixed business, legal, personal, and partner-related material
- it is a source artifact, not a normal collaboration file
- it is better treated as immutable intake evidence than as ordinary repo content

Policy options assessed:
- `remain outside git but inside OneDrive/SharePoint`: recommended
- `tracked with Git LFS`: possible, but still increases exposure and collaboration friction for a highly sensitive archive
- `excluded from repo entirely and referenced by path/hash`: also acceptable and close to the recommended model
- `copied to an immutable archive folder outside repo`: recommended as part of the storage policy if a dedicated archive location exists

Preferred model:
- immutable archive outside git
- repo-held manifest and provenance references only

## Duplicate Folder Recommendation
Current candidates:
- `Command Center`
- `Command Huddle`
- `Command_Huddle`

Recommended canonical naming convention:
- use `Command_Huddle/`

Rationale:
- underscore form is most consistent with machine-friendly repo navigation
- avoids space-handling friction in scripts and shell commands
- matches the repo’s broader pattern of explicit operational namespaces

Recommended migration plan:
1. Audit contents of all three folders.
2. Choose `Command_Huddle/` as canonical target.
3. Map each file to keep, merge, supersede, or archive.
4. Update references in governance and workflow files.
5. Move or archive non-canonical folders only after review.

Do not move anything until this migration is explicitly approved.

## Risks
- sensitive raw export material is present inside the repo working tree
- the raw ZIP currently has no finalized storage or ignore policy
- lock files and generated binaries can pollute commit history if not filtered
- governance, standards, website, and memory work are currently interleaved in the same working tree
- duplicate command folders create naming ambiguity and source-of-truth drift
- a large unreviewed sensitive archive still sits behind current metadata and normalization layers
- the unknown bucket remains large, limiting downstream confidence
- Python is unavailable locally, so current automation depends on PowerShell

## Next Safe Command Sequence
Recommended sequence only; not executed here:

1. Review and approve a raw-archive storage policy.
2. Review and approve `.gitignore` additions for lock files and raw archive handling.
3. Inspect `09_AI_Systems/Memory_Extraction/` and decide whether to commit reports plus normalized drafts together or separately.
4. Separate memory-system commits from governance and website commits.
5. Audit duplicate command folders before any rename or merge.
6. Commit only approved logical groups after final review.

Example safe commit ordering:
1. extraction pipeline and reports
2. normalized internal drafts and checkpoint
3. governance and standards doctrine
4. website-control/design artifacts

## Explicit Note
This was an audit-only pass. No files were modified other than creation of this report. No files were deleted, moved, staged, or committed.
