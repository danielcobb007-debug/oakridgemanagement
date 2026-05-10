# BRANCH STRATEGY

## main
Purpose:
- Production-safe branch
- Represents stable approved state
- Netlify production deployments should point here

Rules:
- No direct experimental work
- No unfinished features
- No AI-generated changes pushed blindly
- Changes should flow from staging

---

## staging
Purpose:
- Testing environment
- AI-assisted development
- Feature validation
- Architecture experimentation

Rules:
- Claude/Codex work occurs here first
- Validate before merging to main
- Safe environment for iteration

---

## Future Feature Branches

Examples:
- feature/netlify-governance
- feature/shared-assets
- feature/ceh-index-refactor

Purpose:
- isolated development
- controlled experimentation
- rollback safety

---

## Deployment Philosophy

main:
- stable
- production
- protected

staging:
- experimental
- validation
- pre-production