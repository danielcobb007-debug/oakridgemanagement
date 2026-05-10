# ENVIRONMENT VARIABLES AUDIT

## Purpose

Track all environment variables, secrets, API keys, deployment tokens, and platform credentials connected to ORM-controlled repos and deployments.

---

# Rules

- Never commit secrets to GitHub
- Never store API keys in source code
- Use Netlify environment variables for deployment secrets
- Use local `.env` files only for local development
- `.env` files must remain ignored by Git

---

# Current Known Variables

| Variable Name | Purpose | Platform | Repo/Site | Status |
|---|---|---|---|---|
| TBD | TBD | Netlify / Local / API | TBD | Unknown |

---

# Audit Checklist

- [ ] Review Netlify environment variables
- [ ] Review local `.env` files
- [ ] Confirm `.env` is ignored by Git
- [ ] Identify hardcoded secrets
- [ ] Identify unused variables
- [ ] Document API providers
- [ ] Document owner of each credential
- [ ] Document rotation process

---

# Risk Notes

- No secrets should be pasted into ChatGPT, Claude, Codex, or GitHub
- AI tools may inspect code but should not be given live credentials
- Production secrets should be treated as controlled infrastructure assets