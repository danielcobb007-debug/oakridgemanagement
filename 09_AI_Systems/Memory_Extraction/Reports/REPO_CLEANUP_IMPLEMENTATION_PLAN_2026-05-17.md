# Repo Cleanup Implementation Plan — 2026-05-17

## 1. Purpose
This plan prepares the repository for safe commits after the first AI memory normalization checkpoint. It is intended to separate the memory extraction layer from broader governance, website, archive, and folder-structure work so commits can be made in controlled slices rather than from one mixed working tree.

## 2. Recommended Immediate Decisions
- raw ChatGPT export ZIP should not be committed
- Office lock files should not be committed
- duplicate command folders should be consolidated only after review
- memory extraction outputs should be committed in logical slices only
- existing unrelated modified files should not be swept into the memory commit

## 3. Proposed Commit Sequence

### Commit 1
AI memory extraction scripts, reports, source registry, indexes, normalized files, and checkpoint, excluding raw ZIP and archive binaries.

Suggested scope:
- `09_AI_Systems/Memory_Extraction/`

### Commit 2
Platform governance artifacts that are already reviewed and ready.

Suggested scope:
- selected files under `10_Operations/Platform_Control/Governance/`
- selected operational-state or memory files only if intentionally ready

### Commit 3
CEH, DGE&I, and ORM architecture and standards artifacts, if ready.

Suggested scope:
- `10_Operations/Platform_Control/Architecture/ORM_*.md`
- `10_Operations/Platform_Control/Architecture/DGEI_*.md`
- `10_Operations/Platform_Control/Standards/CEH_*.md`
- related lane files such as `CEH_STRATEGIC_LANE.md`

### Commit 4
Website control artifacts, if ready.

Suggested scope:
- `10_Operations/Website_Control/*.md`
- any intentionally tracked HTML test artifact only if approved

### Commit 5
Command folder consolidation, after migration-plan approval.

Suggested scope:
- `10_Operations/Platform_Control/Command Center/`
- `10_Operations/Platform_Control/Command Huddle/`
- `10_Operations/Platform_Control/Command_Huddle/`

## 4. Exclusions Before Commit
- raw ChatGPT export ZIP files
- raw media and attachment payloads
- Office lock files
- temporary files
- generated workbook/html derivatives unless intentionally tracked
- local app-state copies
- unrelated modified website and governance files unless intentionally included in a separate commit
- large binary artifacts without an explicit storage and tracking decision

## 5. Raw Archive Policy
Recommended policy:
- move the raw ChatGPT ZIP outside git tracking or keep it untracked and ignored
- preserve file path, size, export date, and checksum in `AI_MEMORY_SOURCE_REGISTRY.md` or a separate `RAW_SOURCE_ARCHIVE_REGISTER.md`
- do not track raw binary attachments unless deliberately approved

Rationale:
- the raw ZIP is sensitive, large, and better treated as intake evidence than as normal repo content
- provenance can be preserved without putting the full archive into git history
- a registry-based approach reduces accidental disclosure and accidental commit risk

## 6. Duplicate Command Folder Plan
Current folders:
- `10_Operations/Platform_Control/Command Center/`
- `10_Operations/Platform_Control/Command Huddle/`
- `10_Operations/Platform_Control/Command_Huddle/`

Recommended canonical folder:
- `10_Operations/Platform_Control/Command_Layer/`

Rationale:
- `Command_Layer` is machine-friendly and institutionally legible
- it is broad enough to hold huddles, command-center materials, operating procedures, and future control surfaces without privileging one sub-mode
- it avoids spaces and inconsistent naming styles

Migration note:
- migration should happen in a later task only
- first inventory the contents of all three current folders
- then map which files should merge, remain separate, supersede, or archive
- then update references
- only after that should any folder moves occur

## 7. Proposed Safe Staging Commands
Recommendations only. Do not run these blindly.

If the real `.gitignore` is updated first and raw archives remain ignored, a conservative staging flow could look like:

```powershell
git -C "C:\Users\dpc\Oak Ridge Management(1)\Oak Ridge Management - Documents" add -- "09_AI_Systems/Memory_Extraction"
```

If path-level exclusions are still unresolved, exact staging commands are riskier because:
- raw ZIP files may still sit under tracked paths
- generated or sensitive binaries may still be visible to git
- broad `git add` can accidentally capture more than intended

Safer recommendation:
1. approve ignore policy first
2. confirm raw ZIP exclusion
3. then stage `09_AI_Systems/Memory_Extraction/` only
4. review staged diff before any commit

## 8. Risks
- accidental raw archive commit
- committing unrelated website or governance changes with the memory system
- losing provenance if raw archives are moved without registry updates
- duplicate folders causing future source-of-truth confusion
- sensitive derived reports requiring access control discipline

## 9. Next Action
1. Review this cleanup plan
2. Approve `.gitignore` update
3. Create `RAW_SOURCE_ARCHIVE_REGISTER.md`
4. Then stage and commit the memory extraction layer only
