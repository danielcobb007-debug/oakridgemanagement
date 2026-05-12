# CEH Mixed Surface Remediation Plan

## Governance Context

This remediation plan operates under the ORM Platform Control Layer and the governed operational execution model.

Authoritative references include:

- `10_Operations/Platform_Control/Architecture/OPERATIONAL_EXECUTION_MODEL.md`
- `10_Operations/Platform_Control/Standards/STANDARDS_GOVERNANCE.md`
- `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
- `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`

This document does not independently define:

- standards governance
- canonical CEH ownership
- commercialization boundaries
- institutional authority

Mixed-surface CEH remediation must preserve separation between:

- CEH Standard
- CEH Infrastructure Index
- commercialization surfaces
- public implementation surfaces

| Route | Current Role | Problem | Recommended Future Home | Migration Priority | SEO Risk | Notes |
|---|---|---|---|---|---|---|
| `/ceh-index` | Benchmark / index surface | Mixed with standards authority | `cehinfrastructureindex.com` | HIGH | MEDIUM | Should eventually separate from standards surface |
| `/pages/benchmark-index` | Benchmark methodology overlap | Duplicate thematic surface | `cehinfrastructureindex.com` | HIGH | MEDIUM | Likely consolidate with `/ceh-index` |
| `/capital-stack` | DGE&I commercialization narrative | Strongest governance bleed | Future DGE&I or ORM capital surface | VERY HIGH | HIGH | Do not move prematurely |
| `/pages/partners` | Adopter / partner surface | DGE&I references inside standards domain | Remain temporarily | LOW | LOW | Edit with caution only |
