# Memory Extraction

This folder contains derived outputs from Daniel Cobb's ChatGPT export and separate-source inventories for other AI systems such as Claude.

Each source system must retain explicit provenance. ChatGPT and Claude should be treated as separate source archives unless and until an explicit normalization pass is approved.

The source archive remains the system of record for each workflow. Derived extracts in this folder are working materials only and are not canonical ORM memory.

Nothing in this folder becomes ORM memory until it is explicitly reviewed and promoted through the promotion workflow.

Sensitive material requires manual review before any broader use. Legal, SBR/HUB, partner-consent, personal, and investor-sensitive materials are not externally usable by default.

## Provenance Requirements

Every indexed record should carry:

- `source_system`
- `source_archive_path`
- `source_file`
- a conversation identifier or equivalent if available
- `title`
- `create_time`
- `update_time`
- `extraction_run_date`
- `promotion_status`

## Structure

- `Scripts/`: reusable extraction and reporting scripts for read-only-to-derived passes
- `Reports/`: inventory, manifest, metadata index, and queue summary outputs
- `Raw_Project_Extractions/`: metadata-only domain extracts that are still non-canonical
- `Normalized_Index/`: reserved for later approved normalization steps
- `Promotion_Queue/`: candidate material awaiting review for possible promotion
- `Legal_Sensitive/`: legal and papering review queue outputs
- `Partner_Consent_Required/`: partner or third-party review queue outputs
- `Superseded/`: reserved for replaced derived outputs

## Implementation Note

This pass uses PowerShell scripts rather than Python because no runnable Python interpreter was available in the local environment during execution. The pipeline remains path-configurable, reusable, and read-only with respect to the source ZIP.
