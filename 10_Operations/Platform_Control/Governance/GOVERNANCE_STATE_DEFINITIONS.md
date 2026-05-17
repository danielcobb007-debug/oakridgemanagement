# GOVERNANCE STATE DEFINITIONS

## Purpose

This document defines the official governance states used across the ORM governance operating system.

Its purpose is to create semantic consistency for:

- authority levels
- promotion rules
- document handling
- observability expectations
- AI operating behavior
- supersession and rollback logic

This document exists so the ORM repository can distinguish between:

- what governs
- what guides
- what records
- what proposes
- what evidences
- what explores

This is a governance doctrine document.

It is not:

- a filing convention only
- a memory dump
- a workflow checklist
- a substitute for the source-of-truth hierarchy

---

# Core Principle

Not all written artifacts carry the same institutional authority.

The ORM operating system must explicitly distinguish between:

- authoritative truth
- governed guidance
- current state
- structured candidates
- historical memory
- raw evidence
- exploratory thinking
- archived history

---

# Governance States

## 1. Constitution

### Meaning

Highest-authority institutional documents.

These define:

- system-of-record authority
- platform boundaries
- canonical ownership
- repo authority
- domain authority

### Authority Level

Highest.

### Promotion Rules

- requires explicit approval
- must not be changed casually
- changes should usually follow governance review first

### Who May Modify

- Daniel Cobb as final approving authority
- AI systems may draft or propose changes, but may not settle them independently

### Observability Requirements

- change rationale must be clear
- lineage should be preserved
- affected lower-layer docs should be identified
- contradictions must be reconciled explicitly

---

## 2. Doctrine

### Meaning

Durable operating rules derived from constitutional authority.

These define:

- governance logic
- architecture rules
- standards rules
- deployment rules
- audit rules
- AI role rules

### Authority Level

High, but subordinate to Constitution.

### Promotion Rules

- may be promoted from normalized doctrine candidates
- must align with constitutional documents
- should not be promoted while ambiguity remains unresolved

### Who May Modify

- Daniel Cobb with governed review
- AI systems may draft, refine, and reconcile, but must defer to higher authority

### Observability Requirements

- source lineage should be recoverable
- affected workflows and state docs should be identifiable
- superseded doctrine should be marked or reconciled

---

## 3. Operational State

### Meaning

Current reality snapshots, active work, inventories, and live operating conditions.

These define:

- what is true right now operationally
- what work is active
- what deployments or mappings are current
- what inventories exist

### Authority Level

Subordinate to Constitution and Doctrine.

### Promotion Rules

- may be updated as operating reality changes
- must not override doctrine
- should trigger doctrine review if repeated state changes reveal structural drift

### Who May Modify

- governed operators
- AI systems working within documented workflows

### Observability Requirements

- freshness matters
- timestamps or session context should be recoverable where relevant
- drift between state and doctrine must be detectable

---

## 4. Workflow

### Meaning

Repeatable procedures, checklists, promotion chains, and control mechanisms.

These define:

- how work moves
- how review happens
- how change is verified
- how continuity is preserved

### Authority Level

Subordinate to Constitution and Doctrine, but operationally binding when active.

### Promotion Rules

- workflow updates should reflect doctrine
- workflow changes that alter governance meaning require doctrine review

### Who May Modify

- governed operators
- AI systems may draft and refine
- meaningful workflow changes should be reviewed before operational adoption

### Observability Requirements

- entry and exit conditions should be explicit
- responsible actor or authority should be clear
- failure points should be visible

---

## 5. Normalized Doctrine Candidate

### Meaning

Structured institutional interpretation awaiting governance resolution.

This state exists between extraction and settled doctrine.

It allows:

- interpretation
- normalization
- lineage preservation
- ambiguity handling
- executive clarification

without premature canonization.

### Authority Level

Intermediate and non-canonical.

Higher than raw evidence.
Lower than Doctrine.

### Promotion Rules

- may promote upward into Doctrine or Operational State
- may move into Clarification Required if unresolved
- may be superseded without ever becoming canonical

### Who May Modify

- AI systems may draft and normalize
- human review is required before promotion into Doctrine or Constitution

### Observability Requirements

- source lineage
- status
- confidence
- classification
- promotion target
- clarification need
- supersession metadata

---

## 6. Memory

### Meaning

Institutional continuity artifacts that preserve what happened, what was decided, and what remains open.

These include:

- decisions logs
- session logs
- next-session context
- milestones
- memory indexes

### Authority Level

Context-authoritative within scope, but not a substitute for Constitution or Doctrine.

### Promotion Rules

- memory may feed doctrine promotion
- memory should not become doctrine automatically

### Who May Modify

- governed operators
- AI systems following continuity rules

### Observability Requirements

- date or session context
- relationship to active work
- promotion links where relevant

---

## 7. Evidence

### Meaning

Raw imported artifacts and preserved source material.

These include:

- transcripts
- exports
- screenshots
- copied session outputs
- raw notes

### Authority Level

Low.

Evidence informs the system but does not define truth on its own.

### Promotion Rules

- evidence must move through extraction or normalization before doctrine promotion
- raw evidence must not be treated as canonical

### Who May Modify

- operators may import
- AI systems may classify and extract
- original content should generally be preserved rather than rewritten

### Observability Requirements

- source system
- session date when known
- importer
- related branch or commit when relevant

---

## 8. Exploration

### Meaning

Hypotheses, options, draft frameworks, strategic possibilities, and unresolved modeling.

### Authority Level

Non-authoritative.

### Promotion Rules

- may inform candidates
- may be abandoned without reconciliation into canon
- must not be mistaken for settled doctrine

### Who May Modify

- humans and AI systems freely, within governance boundaries

### Observability Requirements

- should be clearly marked as exploratory
- if it affects future decisions, relevant open loops should be created

---

## 9. Archive

### Meaning

Superseded, retired, historical, or reference-only artifacts.

### Authority Level

Historical only.

### Promotion Rules

- archived material may be cited for lineage
- archived material should not silently reactivate as current doctrine

### Who May Modify

- governed operators
- archival moves should preserve provenance

### Observability Requirements

- what superseded it
- when it was archived if known
- why it is no longer current

---

# Clarification Required State

## Meaning

Clarification Required is a valid governance state, not a failure state.

It exists when:

- multiple interpretations remain plausible
- executive confirmation is needed
- promotion would create premature authority
- legal, economic, or institutional boundaries remain unresolved

## Rule

Clarification Required items may not be promoted into Doctrine or Constitution until the ambiguity is resolved.

---

# State Hierarchy

From highest to lowest authority:

1. `CONSTITUTION`
2. `DOCTRINE`
3. `OPERATIONAL_STATE`
4. `WORKFLOW`
5. `NORMALIZED_DOCTRINE_CANDIDATE`
6. `MEMORY`
7. `EVIDENCE`
8. `EXPLORATION`
9. `ARCHIVE`

Interpretation rule:

This hierarchy reflects governance authority, not usefulness.

Evidence and exploration may be highly valuable while still remaining non-authoritative.

---

# AI Operating Rule

AI systems must identify which governance state they are operating in before treating any artifact as settled truth.

If the state is unclear:

- do not assume canon
- preserve ambiguity
- classify the artifact
- escalate if needed

---

# Non-Negotiable Principle

Institutional stability depends on distinguishing clearly between:

- what is true
- what is governed
- what is current
- what is proposed
- what is remembered
- what is merely observed
