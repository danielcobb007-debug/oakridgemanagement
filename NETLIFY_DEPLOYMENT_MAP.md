# NETLIFY DEPLOYMENT MAP

# Production Philosophy

## main
- production-safe
- approved deployments only
- stable public-facing environments

## staging
- testing
- validation
- AI-assisted experimentation
- pre-production review

---

# Current Domains

| Domain | Purpose | Repo Branch | Deployment Status |
|---|---|---|---|
| oakridgemanagement.net | ORM platform | main | active |
| cehstandard.com | CEH Standard | main | active |
| cehinfrastructureindex.com | CEH Infrastructure Index | staging/current external repo | active |

---

# Netlify Governance Rules

## Production Deployments
- Only from main
- No direct experimental pushes
- Validate in staging first

## Staging Deployments
- Safe testing environment
- Used for Claude/Codex iterations
- Validate before production merge

---

# Deployment Risks

- External repos still exist
- Shared assets not centralized
- Environment variables not yet audited
- Build settings not standardized
- Rollback procedures not documented

---

# Future Objectives

1. Standardize Netlify build settings
2. Establish branch deploy rules
3. Centralize shared assets
4. Audit environment variables
5. Create rollback procedures
6. Map DNS ownership
7. Engineer future monorepo deployment strategy

---

# Operational Principle

Deployment governance is as important as source control governance.