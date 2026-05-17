# Raw Source Archive Register

## 1. Purpose
This register records raw source archives used for AI memory extraction without requiring large or sensitive raw archives to be committed to git. It is intended to preserve provenance, chain-of-custody details, and storage-policy decisions for raw AI memory sources while allowing derived reports and indexes to be versioned separately.

## 2. Source Archive Policy
- raw exports are sources of record
- raw exports are not normalized memory
- raw exports should not be committed to git by default
- derived reports and indexes may be committed after review
- raw source movement requires registry update

## 3. ChatGPT Export Archive
- `source_system`: ChatGPT
- `source_type`: official ChatGPT export ZIP
- `current_path`: `09_AI_Systems/ChatGPT_Export/Raw/6983b8f97d5512829399371574d104cdfd9ecd2ee5a5ebf50cdbdf3da8b6aac5-2026-05-16-12-56-21-249ce10772524f68bfa173bea492c753.zip`
- `file_name`: `6983b8f97d5512829399371574d104cdfd9ecd2ee5a5ebf50cdbdf3da8b6aac5-2026-05-16-12-56-21-249ce10772524f68bfa173bea492c753.zip`
- `file_size_bytes`: `1235346189`
- `file_size_human`: `1.24 GB`
- `last_modified`: `2026-05-17 09:39:43 -04:00`
- `SHA256`: `3618EC9E5F27C38315628AC1E238E9669929073DEDE096A4CBC718E66F592A13`
- `extraction_status`: inspected, indexed, domain-indexed, review-queued, partially normalized
- `derived_outputs_location`: `09_AI_Systems/Memory_Extraction/`
- `git_tracking_recommendation`: do not commit raw ZIP
- `sensitivity`: high
- `notes`:
  - Raw archive remains the authoritative ChatGPT source artifact for the current extraction pass.
  - The archive should be referenced by path, timestamp, size, and hash even if later moved outside git-tracked repo scope.
  - Derived outputs now exist for inventory, metadata indexing, domain indexing, attachment manifesting, review queues, cross-source indexing, and first-pass normalization.

## 4. Claude Source Sessions
- `source_system`: Claude
- `source_type`: Claude JSONL event-stream sessions registered/imported into Codex
- `codex_import_registry_path`: `C:\Users\dpc\.codex\external_agent_session_imports.json`
- `claude_projects_path`: `C:\Users\dpc\.claude\projects\`
- `observed_top_level_session_count`: `18`
- `observed_subagent_file_count`: `8`
- `approximate_observed_size`: `49.4 MB`
- `extraction_status`: inspected, indexed, domain-indexed, review-queued, partially normalized through AI Systems/ORM/CEH/DGE&I boundary files
- `git_tracking_recommendation`: do not commit `.claude` or `.codex` app state by default
- `sensitivity`: medium/high
- `notes`:
  - Claude source sessions currently live outside the repo in local app-state and project-session storage.
  - Provenance should preserve session ids, file paths, timestamps, and import-registry linkage.
  - If Claude raw sessions are later archived into a governed immutable location, this register should gain a separate dated archive entry rather than collapsing the current source-path record.

## 5. Derived Output Register
Current derived output families include:
- inventory reports
- metadata indexes
- domain indexes
- attachment manifests
- sensitivity and review queues
- normalized index files
- checkpoint file
- repo hygiene and cleanup reports

## 6. Integrity / Chain of Custody Notes
- source path, size, timestamp, and hash should be preserved for raw archives where feasible
- future exports should get separate dated entries
- if a raw archive is moved, the register should preserve prior path and new path
- derived outputs should reference `source_system` and source record identifiers

## 7. Open Decisions
- final raw archive storage location
- whether to keep raw ChatGPT export under repo folder but ignored
- whether to move raw export outside repo entirely
- whether to copy Claude JSONL sessions into an immutable archive outside git
- whether Git LFS is needed for any future binary artifacts
