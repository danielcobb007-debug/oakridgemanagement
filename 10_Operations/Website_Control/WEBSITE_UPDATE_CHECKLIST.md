# WEBSITE_UPDATE_CHECKLIST

## Purpose

Use this checklist before pushing or deploying website changes.

This is the last operational check to reduce drift between source files and the live website.

---

# Pre-Push / Pre-Deploy Checklist

- [ ] Confirm the correct website is being updated
- [ ] Confirm the correct repo and branch are being used
- [ ] Content reviewed for clarity and accuracy
- [ ] Internal links checked
- [ ] External links checked
- [ ] Domain references checked
- [ ] Canonical URLs checked
- [ ] Metadata title checked
- [ ] Metadata description checked
- [ ] OpenGraph / social metadata checked if relevant
- [ ] `robots.txt` checked if affected
- [ ] `sitemap.xml` checked or update noted if affected
- [ ] Navigation checked
- [ ] Footer checked
- [ ] Mobile responsiveness checked
- [ ] No broken layout or obvious spacing issues
- [ ] No accidental ORM / CEH / DGE&I / SBR cross-contamination
- [ ] Protected-route or login behavior reviewed if affected
- [ ] `git status` checked
- [ ] Commit created with clear message
- [ ] Pushed to the correct branch
- [ ] Netlify deployment verified
- [ ] Live page verified after deployment

---

# Use This Checklist When

- a page is added
- a page is removed
- content changes materially
- navigation changes
- metadata changes
- SEO files change
- branch or deployment-sensitive files change

---

# Notes

- If any item is uncertain, pause and verify before pushing.
- If the update affects more than one website, run the checklist for each affected surface.

