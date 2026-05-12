# SESSION CONTINUITY RULES

## Purpose

This document defines how ORM preserves operational continuity across AI sessions, implementation sessions, governance updates, and repo changes.

Its purpose is to prevent:

- lost context
- repeated work
- contradictory next steps
- conversational drift
- undocumented decisions
- AI memory fragmentation
- session-to-session operational decay

---

# Core Principle

A session is not complete until its operational state can be resumed by another AI system or future session without relying on memory alone.

---

# Required Session Closeout

At the end of any meaningful work session, capture:

- what was accomplished
- what files changed
- what decisions were made
- what remains open
- what should happen next
- current git status
- current branch
- latest commit hash
- any unresolved ambiguity

---

# Continuity Artifacts

Session continuity may be captured in:

- SESSION_LOG.md
- NEXT_SESSION_CONTEXT.md
- ACTIVE_WORKSTREAMS.md
- OPEN_LOOPS.md
- relevant governance documents
- relevant implementation maps

Conversation alone is not sufficient.

---

# AI Session Handoff Rules

Any AI handoff should include:

- current repo state
- active branch
- recent commits
- relevant governance constraints
- active workstream
- files touched
- safe next step
- explicit warnings or boundaries

---

# Decision Capture Rule

If a session produces a decision that affects future execution, it must be written into an appropriate markdown artifact.

Examples:

- DECISIONS.md
- CHANGE_CONTROL_POLICY.md
- SOURCE_OF_TRUTH_HIERARCHY.md
- implementation map
- route classification file
- session log

---

# Memory Hierarchy

Operational memory should follow this hierarchy:

1. committed governance documents
2. committed implementation maps
3. committed session logs
4. committed next-session context
5. AI conversation history
6. human recollection

Higher levels override lower levels.

---

# Session Restart Rule

Before continuing a prior workstream:

- review latest git status
- review recent commits
- review relevant continuity file
- verify no branch drift exists
- confirm current workstream
- identify safest next action

---

# Non-Negotiable Principle

If future work cannot be resumed cleanly from documented artifacts, the prior session was not fully closed.