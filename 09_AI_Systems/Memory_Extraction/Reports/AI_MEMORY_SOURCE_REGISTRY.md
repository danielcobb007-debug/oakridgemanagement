# AI Memory Source Registry

This registry records currently available AI memory source systems before any cross-source merge or normalization. Raw and derived materials listed here are not canonical ORM memory.

## ChatGPT Export

- source_system: ChatGPT
- source_location: `09_AI_Systems/ChatGPT_Export/Raw/`
- source_type: official downloaded ChatGPT export ZIP
- source_owner_custodian: Daniel Cobb / Oak Ridge Management
- status: inspected, extraction pipeline in progress
- provenance_status: strong, raw archive lives inside repo
- sensitivity_status: high
- normalization_status: not started
- raw_source_mutability: do not modify
- derived_output_location: `09_AI_Systems/Memory_Extraction/Reports/` and `09_AI_Systems/Memory_Extraction/Raw_Project_Extractions/`
- extraction_status: inventory, metadata index, domain indexes, attachment manifest, and review queues created
- manual_review_requirements: legal, partner-consent, personal, SBR/HUB, investor/capital, and attachment-heavy items require manual review
- boundary_notes:
  - keep separate from Claude material
  - do not promote raw or unreviewed outputs to canonical memory
  - do not extract or summarize sensitive content in depth during pre-normalization passes
- next_action: continue ChatGPT-only review and refinement of metadata/domain classification before any normalization

Known structure:

- ZIP about 1.24 GB
- `chat.html` present
- `conversations-000.json` through `conversations-007.json` present
- `conversations.json` absent at root
- attachments, audio, video, images, and documents present
- 776 conversations identified

## Claude Import

- source_system: Claude
- source_location: `C:\Users\dpc\.claude\projects\` and `C:\Users\dpc\.codex\external_agent_session_imports.json`
- source_type: Claude JSONL event logs imported into Codex app state
- source_owner_custodian: Daniel Cobb / Oak Ridge Management
- status: inspected and metadata-indexed
- provenance_status: strong if source paths and session ids are preserved
- sensitivity_status: medium/high
- normalization_status: not started
- raw_source_mutability: do not modify
- derived_output_location: `09_AI_Systems/Memory_Extraction/Reports/`, `09_AI_Systems/Memory_Extraction/Raw_Project_Extractions/Claude/`, `09_AI_Systems/Memory_Extraction/Legal_Sensitive/`, `09_AI_Systems/Memory_Extraction/Partner_Consent_Required/`, and `09_AI_Systems/Memory_Extraction/Promotion_Queue/`
- extraction_status: inventory, metadata index, Claude-specific domain indexes, and Claude review queues created
- manual_review_requirements: repo/code, partner/capital, possible legal/papering, and any personally sensitive sessions require manual review
- boundary_notes:
  - Claude source lives outside the repo unless intentionally copied later
  - keep top-level sessions separate from subagent logs
  - do not merge with ChatGPT outputs before source-by-source review
- next_action: improve Claude-only classification and review queues while preserving per-session provenance

Known structure:

- 18 top-level session files
- 8 subagent files
- about 49.4 MB observed JSONL
- JSONL event-stream schema

## Normalization Gate

No cross-source normalization should occur until both ChatGPT and Claude have:

- inventory report
- metadata index
- domain indexes
- sensitivity or review queues

Additional gate rules:

- ChatGPT and Claude must remain separate witnesses until reviewed.
- Every future normalized record must cite `source_system`, `source_file`, source id or session id, timestamp if available, extraction run date, and promotion status.
- Raw and unreviewed outputs are not canonical.
- No source should be treated as normalized institutional memory until promoted through the promotion workflow.
