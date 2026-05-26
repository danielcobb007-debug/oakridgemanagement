## Summary
Adds the ORM design system package as a self-contained `design-system/` folder. No application code is modified.

## Contents
- `colors_and_type.css` — core tokens (colors, type scale, spacing, radius)
- `assets/` — brand marks and shared CSS/JS
- `preview/` — 22 token + component preview pages
- `ui_kits/` — investor-portal and public-site kits
- `review/` — review index + 10 reference screenshots
- `launch/` — launch index and PR brief
- `ORM Design System Review.html` — top-level review entry point
- `README.md`, `SKILL.md` — usage and authoring notes

## Scope
- Pure addition under `design-system/`
- No edits to app, build, or CI
- No new runtime dependencies

## How to review
1. Pull the branch
2. Open `design-system/review/index.html` in a browser
3. Walk the preview pages from `design-system/launch/index.html`

## Screenshots
See `design-system/review/*.png`.

## Rollout
- Merge as additive; no migration required
- Follow-up PRs will wire tokens into the app
