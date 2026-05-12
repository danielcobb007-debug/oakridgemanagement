# CEH_ROUTE_CLASSIFICATION

## Governance Context

This route-classification system operates under the ORM Platform Control Layer and governed operational execution model.

Authoritative references include:

- `10_Operations/Platform_Control/Architecture/OPERATIONAL_EXECUTION_MODEL.md`
- `10_Operations/Platform_Control/Standards/STANDARDS_GOVERNANCE.md`
- `10_Operations/Platform_Control/Governance/SOURCE_OF_TRUTH_HIERARCHY.md`
- `10_Operations/Platform_Control/Active_Workstreams/CURRENT_OPERATIONAL_STATE.md`
- `10_Operations/Website_Control/CEH_ROUTE_IMPLEMENTATION_MAP.md`

This document classifies CEH routes for operational control.

It does not independently define:

- canonical standards authority
- commercialization authority
- institutional topology decisions
- governance policy

Route classification must preserve separation between:

- CEH Standard
- CEH Infrastructure Index
- commercialization surfaces
- public website implementation

---

## Purpose

This document defines the operational route classes used to manage CEH website execution safely.

Its purpose is to turn route sensitivity into a documented control system that can be used by:

- Daniel for approval decisions
- Claude for implementation boundaries
- Codex for verification and audit

This is an operational routing-intelligence artifact.

It is not:

- a route migration plan
- a canonical rewrite plan
- a nav rewrite plan
- a deployment cutover plan

---

# Core Principle

In the ORM ecosystem, routes are not just pages.

Routes may imply:

- standards boundaries
- commercialization boundaries
- canonical authority
- SEO authority
- public institutional topology

Because of that, route ownership and route classification are governance-sensitive operational layers.

---

# Route Classes

## Class A — Standards-Safe

Meaning:

- route is structurally aligned with CEH Standard
- route does not currently create material product or commercialization ambiguity
- route is safe for normal standards-page implementation work

Typical allowed work:

- copy refinement
- layout cleanup
- UX improvement
- metadata improvement
- SEO hygiene that preserves standards ownership

## Class B — Mixed-Surface / Governed

Meaning:

- route is live and usable, but contains more than one institutional layer or role signal
- route requires controlled edits and explicit awareness of mixed-surface risk

Typical risk:

- standards and ecosystem language overlap
- standards and adopter language overlap

## Class C — Commercialization-Sensitive

Meaning:

- route introduces commercialization, capital, operator, or DGE&I-sensitive framing
- route may harden commercialization bleed if handled casually

Typical risk:

- DGE&I narrative bleed
- capital-stack or execution-layer contamination inside standards surfaces

## Class D — Canonical-Topology-Sensitive

Meaning:

- route affects or implies the wrong canonical public topology if treated casually
- route may blur CEH Standard and CEH Infrastructure Index boundaries

Typical risk:

- product content hosted under standards domain
- duplicate public-surface interpretation
- incorrect route authority assumptions

## Class E — Restricted / Governance Escalation Required

Meaning:

- route should not be edited, repurposed, or reclassified without explicit approval
- route sits in the highest-risk remediation zone

Typical risk:

- architectural misclassification
- standards/commercialization collapse
- public authority drift

---

# CEH Route Classification Matrix

| Public Route | Current Role | Operational Class | Edit Status | Primary Risk Type | Required Handling |
|---|---|---|---|---|---|
| `/` | CEH Standard homepage | `Class A` | `SAFE_TO_EDIT` | Low standards-page risk | Normal CEH Standard implementation allowed if standards role is preserved. |
| `/pages/methodology` | CEH Standard methodology page | `Class A` | `SAFE_TO_EDIT` | Low standards-page risk | Normal methodology-page edits allowed if definitions and standards framing are preserved. |
| `/pages/horsepower-standard` | CEH explainer / measurement-parallel page | `Class A` | `SAFE_TO_EDIT` | Low standards-page risk | Normal explainer-page updates allowed if CEH remains the central standards concept. |
| `/pages/partners` | Partner and adopter page under CEH Standard | `Class B` | `EDIT_WITH_CAUTION` | Mixed-surface risk | Edit carefully. Preserve explicit separation between ORM as originator and DGE&I as adopter or execution reference. |
| `/ceh-index` | Live CEH Index-like surface under CEH Standard domain | `Class D` | `GOVERNANCE_SENSITIVE` | Canonical-topology risk | Do not treat as a normal standards page. Review against CEH Index boundary and canonical-surface rules before edits. |
| `/pages/benchmark-index` | CEH Index benchmark content under CEH Standard domain | `Class D` | `GOVERNANCE_SENSITIVE` | Canonical-topology risk | Treat as CEH Index-adjacent content. Avoid edits that normalize it as settled CEH Standard topology. |
| `/capital-stack` | DGE&I capital-stack narrative surface | `Class E` | `DO_NOT_EDIT_WITHOUT_APPROVAL` | Commercialization and topology risk | Do not edit without explicit approval. Escalate before any content, nav, canonical, or route-role change. |

---

# Class Usage Rules

## For Daniel

Use route classes to determine:

- whether a task can be delegated directly
- whether governance review is required first
- whether cleanup is operationally safe
- whether a route is still transitional

## For Claude

Use route classes together with edit status:

- `Class A` routes are normal implementation lanes
- `Class B` routes require caution and role preservation
- `Class D` routes require governance awareness before edits
- `Class E` routes require escalation before work begins

Claude should not treat a route as safe based only on whether it is live.

## For Codex

Use route classes to verify:

- whether implementation stayed inside the approved lane
- whether a change introduced topology drift
- whether a route was edited above its authority level

---

# Escalation Rules

Escalate before implementation if:

- a `Class B` route is being re-positioned structurally
- a `Class D` route is being treated as settled canonical topology
- a `Class E` route is being changed at all
- a route appears to move between CEH Standard and CEH Infrastructure Index roles
- a route introduces stronger commercialization framing into a standards surface

---

# Current Operational Meaning

The current CEH route environment can be summarized as:

- `Class A` routes = safe CEH Standard execution lanes
- `Class B` routes = live but governed mixed-surface lanes
- `Class D` routes = topology-sensitive CEH Index overlap zones
- `Class E` routes = explicit escalation zones

At the current operational stage, the main purpose of this system is not to speed up cleanup.

It is to ensure cleanup happens without collapsing standards, product, and commercialization into one blurred public surface.

---

# Non-Negotiable Principle

Route classification is now part of ORM operational control.

A live route does not become safe merely because it exists.

A route becomes safe only when its institutional role, canonical implications, and implementation lane are understood and respected.
