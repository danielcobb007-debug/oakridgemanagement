# Normalization Checkpoint — 2026-05-17

## 1. Purpose
This checkpoint records the system state after the first controlled AI memory extraction and normalization sequence. It preserves current progress, current boundaries, and current unresolved decisions before deeper normalization of more sensitive domains.

## 2. Completed Source-System Work
- ChatGPT export inspected
- ChatGPT extraction pipeline created and run
- Claude import inspected
- Claude extraction pipeline created and run
- AI memory source registry created
- cross-source index created
- source systems kept separate

## 3. Completed Normalization Passes
- AI Systems / Command Layer — `PASS`
- ORM — `PASS`
- CEH — `PASS`
- DGE&I — `PASS` after wording correction

## 4. Current Source Counts
- ChatGPT records indexed: `776`
- Claude sessions indexed: `18`
- cross-source total records: `794`
- ChatGPT attachments listed: `2,058`
- review-required records: `542`
- no-review records: `252`

## 5. Current Domain Map
- Unknown: `252`
- SBR_HUB_Benefits: `122`
- Personal_Operations: `108`
- ORM: `93`
- QumulusAI_VFG_Compute: `62`
- DGEI: `44`
- AI_Systems_Command_Layer: `34`
- Capital_Strategy: `34`
- Legal_Papering: `27`
- CEH: `8`
- Georgia_Benefits_Group: `7`
- Code_Repo_Work: `3`

## 6. Current Sensitivity Map
- partner_consent_required: `294`
- personal_private: `212`
- investor_capital_sensitive: `163`
- sbr_hub_sensitive: `162`
- legal_sensitive: `74`
- code_repo_sensitive: `18`
- promotion_candidate: `97`

## 7. Current Normalization Boundary
- Raw exports are not canonical.
- Metadata indexes are not canonical.
- Normalized files are internal drafts until Daniel Cobb review.
- External use is not permitted unless separately approved.
- Sensitive domains require additional review.
- ChatGPT and Claude remain separate witnesses even inside cross-source indexing.

## 8. Domains Not Yet Normalized
- QumulusAI / VFG / Compute
- Capital Strategy
- Legal / Papering
- SBR / HUB / Benefits
- Personal Operations
- Georgia Benefits Group
- Code / Repo Work
- Unknown bucket

## 9. Recommended Next Decision
- `A.` Pause and commit the extraction/normalization system
- `B.` Normalize QumulusAI / VFG / Compute next
- `C.` Normalize Capital Strategy next
- `D.` Normalize Legal / Papering next
- `E.` Clean folder naming and source-of-truth structure first
- `F.` Create Airtable/dashboard schema from metadata
- `G.` Create a hiring brief for Platform Operations Manager

## 10. Open Risks
- raw ChatGPT export ZIP storage policy
- Claude raw JSONL source archive policy
- duplicate command folder naming
- large unreviewed sensitive archive
- partner-consent exposure
- SBR/HUB boundary risk
- legal/papering queue unresolved
- unknown bucket still large
- Python unavailable locally, PowerShell currently used

## 11. Recommended Pause Point
The current system is at a logical pause point before deeper normalization of more sensitive domains. The current extraction, indexing, and first-pass normalization layers are in place, but higher-sensitivity domain work should wait for an explicit decision on sequencing, storage policy, and review discipline.

## 12. Status
- `checkpoint_status`: Created
- `normalization_sequence_status`: First controlled sequence complete
- `canonical_status`: Not canonical until Daniel Cobb review
- `external_use_status`: Internal only / not externally usable
- `next_action`: Daniel Cobb decision on commit, cleanup, dashboard, or next sensitive-domain normalization
