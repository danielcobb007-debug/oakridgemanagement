# AI Systems / Command Layer Normalization

## 1. Scope
This normalization pass covers only the AI systems, extraction pipeline, command layer, provenance controls, promotion workflow, and memory architecture now operating inside the Oak Ridge Management environment. It does not normalize substantive ORM, CEH, DGE&I, SBR/HUB, legal, capital, personal, partner-consent, or QumulusAI/VFG/compute content. This is an internal operating document based on derived metadata and reports only.

## 2. Source Systems
- `ChatGPT export`: official downloaded ChatGPT export ZIP held inside the repository as the broad raw memory archive.
- `Claude import`: Claude JSONL session logs and Codex import records held outside the repository, serving as the repo/build/session execution archive.
- `Codex-derived reports`: markdown and CSV outputs produced inside `09_AI_Systems/Memory_Extraction/` for inventory, indexing, domain routing, and review queues.
- `Cross-source index`: a metadata-only ledger combining ChatGPT and Claude source records without deduplication, normalization of meaning, or conflict resolution.

## 3. Current Extraction Status
- ChatGPT conversations indexed: `776`
- ChatGPT attachments listed: `2058`
- Claude sessions indexed: `18`
- Claude subagents separated: `8`
- Cross-source total records: `794`
- Review-required count: `542`
- No-review count: `252`

## 4. Current Architecture
- `ChatGPT export` functions as the broad raw memory archive.
- `Claude import` functions as the repo/build/session execution archive.
- `Codex` currently functions as the extraction and indexing clerk.
- `ChatGPT/Bea` is the intended synthesis, normalization, and judgment layer after review.
- `Markdown` is the durable derived memory layer for inventories, indexes, queues, and normalization artifacts.
- `Repo/OneDrive` remains the system of record for controlled operational artifacts.
- `Airtable/dashboard` is a later optional operating view, not the current canonical layer.

## 5. Provenance Rules
- ChatGPT and Claude remain separate witnesses until reviewed.
- Every normalized record must cite both `source_system` and a specific source record identifier.
- Raw and unreviewed outputs are not canonical.
- Sensitive records require review before promotion.
- Attachments remain manifest-only until manually reviewed.

## 6. Promotion Rules
- `Raw / Unreviewed`: indexed but not yet evaluated for reuse.
- `Review Required`: flagged for sensitivity, ambiguity, or boundary risk.
- `Promotion Candidate`: appears potentially reusable but is not yet normalized.
- `Normalized`: converted into a controlled derived memory artifact with provenance retained.
- `Canonical`: explicitly accepted into durable ORM memory after review.
- `Superseded`: retained for history but replaced by a newer approved artifact.
- `Legal-Sensitive`: requires constrained handling and separate review.
- `Partner-Consent Required`: should not be reused without checking shared-party boundaries.
- `Do Not Use Externally`: internal-only material regardless of indexing status.

## 7. Current Risk Findings
- Sensitivity concentration remains high across the cross-source corpus, with `542` records already requiring review.
- The unknown bucket is still large, with `252` records classified as `Unknown`, which limits confidence in downstream prioritization.
- Partner-consent exposure is material, with `294` records carrying partner-consent flags across sources.
- SBR/HUB boundary risk remains present, with `162` records carrying SBR/HUB-sensitive flags and a separate domain concentration in that operating area.
- Personal/private content remains present, with `212` records carrying personal/private sensitivity flags.
- Investor/capital-sensitive content remains present, with `163` records carrying investor/capital sensitivity.
- Legal-sensitive content remains present, with `74` records carrying legal-sensitive flags.
- Code/repo sensitivity remains present, with `18` records carrying code/repo sensitivity, especially relevant to Claude session material and AI systems operations.

## 8. Open Loops
- Whether Python should be installed locally or whether the current PowerShell-based extraction stack should remain the operating default.
- Whether raw Claude JSONL session files should later be copied into the repository as immutable source archives or remain external with provenance references only.
- Whether attachments should remain manifest-only for an extended period or move into a controlled manual-review path.
- Which domain should normalize next after AI Systems once this first narrow pass is reviewed.
- Whether Airtable should be introduced only after a stable markdown operating cadence is established.
- Whether a human Platform Operations Manager should be hired to maintain the system over time.

## 9. Recommended Next Normalization Order
1. `AI Systems / Command Layer`
2. `ORM`
3. `CEH`
4. `DGE&I`
5. `QumulusAI / VFG / Compute`
6. `Capital Strategy`
7. `Legal / Papering`
8. `SBR/HUB Benefits`
9. `Personal Operations`

Sensitive domains should wait because they carry higher review burdens, higher external-use risk, and a greater chance of mixing operational memory with partner, legal, financial, or private material before governance controls are stable.

## 10. Status
- `normalization_status`: Initial AI systems normalization complete
- `canonical_status`: Not canonical until reviewed by Daniel Cobb
- `next_action`: Review this file, then create ORM normalization pass
