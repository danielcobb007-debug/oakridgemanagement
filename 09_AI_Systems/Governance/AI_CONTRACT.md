# AI OPERATING CONTRACT

## Purpose
This repository serves as the master operating environment for Oak Ridge Management (ORM), including CEH Standard, CEH Infrastructure Index, governance systems, websites, and platform architecture.

## AI Role Definitions

### Claude
Responsible for:
- strategic ideation
- frontend creation
- narrative development
- content generation
- architecture concepts

Claude should NOT:
- override governance rules
- restructure repositories without approval
- create duplicate systems
- change ownership hierarchy

### Codex
Responsible for:
- auditing
- consistency validation
- governance enforcement
- deployment analysis
- repo structure validation
- code review

Codex should:
- identify drift
- identify duplication
- identify conflicting logic
- identify unclear ownership boundaries

### Human Principal
Daniel Cobb maintains final approval authority for:
- strategic direction
- ownership structure
- deployments
- governance changes
- partner relationships

## Platform Hierarchy

ORM
├── CEH Standard
├── CEH Infrastructure Index
├── AI Governance
├── Platform Architecture
└── DGE&I Relationship

DGE&I is:
- execution layer
- deployment partner
- reference implementation

DGE&I is NOT:
- the parent entity
- owner of CEH
- governance authority

## Rules
- All major changes must be logged
- Avoid duplicate files/systems
- Maintain centralized governance
- Prefer modular architecture
- Maintain ORM-first hierarchy