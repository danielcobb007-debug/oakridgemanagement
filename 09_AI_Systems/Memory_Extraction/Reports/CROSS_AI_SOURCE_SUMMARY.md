# Cross AI Source Summary

This report is metadata-only and not canonical. It combines ChatGPT and Claude derived indexes without deduplicating records, normalizing meaning, merging facts, or resolving conflicts.

## Totals By Source System

| source_system | count |
| --- | --- |
| ChatGPT | 776 |
| Claude | 18 |

## Totals By Domain

| domain | count |
| --- | --- |
| Unknown | 252 |
| SBR_HUB_Benefits | 122 |
| Personal_Operations | 108 |
| ORM | 93 |
| QumulusAI_VFG_Compute | 62 |
| DGEI | 44 |
| AI_Systems_Command_Layer | 34 |
| Capital_Strategy | 34 |
| Legal_Papering | 27 |
| CEH | 8 |
| Georgia_Benefits_Group | 7 |
| Code_Repo_Work | 3 |

## Totals By Sensitivity Flag

| sensitivity_flag | count |
| --- | --- |
| code_repo_sensitive | 18 |
| investor_capital_sensitive | 163 |
| legal_sensitive | 74 |
| partner_consent_required | 294 |
| personal_private | 212 |
| promotion_candidate | 97 |
| sbr_hub_sensitive | 162 |

## Key Counts

- promotion candidate records: 97
- review-required records: 542
- unknown-domain records: 252

## High-Priority Review Buckets

| bucket | count |
| --- | --- |
| Legal_Papering or legal_sensitive | 74 |
| SBR_HUB_Benefits or sbr_hub_sensitive | 162 |
| Personal_Operations or personal_private | 212 |
| Capital_Strategy or investor_capital_sensitive | 163 |
| QumulusAI_VFG_Compute or partner_consent_required | 294 |
| Code_Repo_Work or code_repo_sensitive | 18 |

## Recommended Next Pass

1. Review high-priority metadata buckets without reading full message bodies.
2. Validate domain and sensitivity heuristics source by source before any deduplication attempt.
3. Keep ChatGPT and Claude records separate until review standards and promotion rules are explicitly applied.
4. Defer any normalized memory creation until review-required items have been triaged.