# WEBSITE_CONTROL_LAYER

## Purpose

This document is the operating manual for ORM-controlled websites.

Its job is to keep strategy, files, domains, GitHub, Netlify, and live public surfaces aligned so website work can be repeated without confusion.

This control layer should help Daniel:

- know which websites exist
- know what each site is supposed to do
- know where the source files live
- know what branch and deployment assumptions are active
- know what must be reviewed before deployment
- prevent drift between ORM, CEH Standard, CEH Infrastructure Index, DGE&I, and future landing pages

This document is operational.

It is not:

- a design brief
- a content draft
- a DNS record file
- a sitemap file
- a one-time migration note

---

# Website List

| Website | Canonical Domain | Owner | Primary Function | Current Status | Deployment Platform | GitHub Repo | Branch Assumption | Update Cadence |
|---|---|---|---|---|---|---|---|---|
| Oak Ridge Management | `oakridgemanagement.net` | Daniel Cobb / ORM | Parent platform, ecosystem orientation, contact, resources, investor entry | Active | Netlify | `oakridgemanagement` | `main` currently used for production deploys | Weekly review, update as needed |
| CEH Standard | `cehstandard.com` | Daniel Cobb / ORM | Standards and methodology surface | Active but operationally transitional | Netlify | `ceh-pricing-engine` | Verify before each deployment | Review before any standards update |
| CEH Infrastructure Index | `cehinfrastructureindex.com` | Daniel Cobb / ORM | Product and intelligence surface | Active but operationally transitional | Netlify | `ceh-pricing-engine` | Verify before each deployment | Review before any product or SEO update |
| Future ORM Landing Pages | `TBD` | Daniel Cobb / ORM | Campaign, product, or partner-specific pages | Planned / placeholder | TBD | TBD | TBD | As needed |

---

# Site Roles

## Oak Ridge Management

Primary role:

- parent governance and ownership surface
- ecosystem orientation
- partner / investor / contact access point

This site should not drift into acting as:

- the CEH Standard canonical home
- the CEH Index canonical home
- the DGE&I execution platform home

## CEH Standard

Primary role:

- methodology and standards publication surface

This site should not drift into acting as:

- ORM parent site
- CEH Index product site

## CEH Infrastructure Index

Primary role:

- product, intelligence, and access-request surface

This site should not drift into acting as:

- CEH Standard root authority
- ORM parent site

## Future Landing Pages

Primary role:

- focused marketing or informational surface under ORM control

Each future landing page must be assigned:

- a domain
- a repo or subdirectory owner
- a purpose
- a deployment owner
- a review cadence

before it goes live

---

# Change Rules

## Rule 1

Inspect the current live site and current source files before making changes.

## Rule 2

Do not assume the repo, domain, and deployment relationships are obvious. Confirm them.

## Rule 3

Do not change canonical domains, major route ownership, or Netlify deployment behavior during a normal content update.

## Rule 4

Keep ORM, CEH Standard, CEH Infrastructure Index, DGE&I, and any future SBR-related language separated unless the page intentionally explains their relationship.

## Rule 5

Every website change should update at least one of:

- `WEBSITE_BUILD_QUEUE.md`
- `SEO_DEPLOYMENT_TRACKER.md`
- `WEBSITE_INVENTORY.md`

if the change affects operating reality

## Rule 6

If the update changes deployment behavior, branch assumptions, robots, sitemap, canonicals, metadata, or domain references, use `WEBSITE_UPDATE_CHECKLIST.md` before pushing.

---

# Approval Flow Before Deployment

Use this sequence for every meaningful website change.

1. Confirm which website is being changed.
2. Confirm which repo and branch currently control that surface.
3. Confirm whether the change is content-only, SEO-only, design-only, or deployment-sensitive.
4. Review the current live page before editing source.
5. Make the change in the correct files only.
6. Check links, metadata, domain references, sitemap/robots implications, and navigation.
7. Review `git status`.
8. Create a clear commit.
9. Push only to the intended branch.
10. Verify Netlify deploy and live output.
11. Update the tracker documents if operating reality changed.

---

# Deployment Checklist Trigger

Use the full deployment checklist when any of the following are true:

- a new page is added
- a page title or description changes
- a domain reference changes
- robots or sitemap files change
- canonical tags change
- navigation changes
- a protected route changes
- a new landing page is introduced
- a repo / branch / Netlify assumption changes

---

# Operating Notes

- Unknown values should be written as `UNKNOWN`, not guessed.
- Transitional states should be labeled `TRANSITIONAL`, not hidden.
- A live website is not automatically the source of truth.
- The source of truth for messaging should still be checked against `CONTENT_SOURCE_OF_TRUTH.md`.

# Primary Operational Objective

The primary goal of the ORM Website Control Layer is:

1. Maintain accurate live websites
2. Ensure deployment stability
3. Keep content current
4. Preserve SEO integrity
5. Maintain brand consistency
6. Prevent deployment drift
7. Enable repeatable updates by AI systems

Governance exists to support live operational execution.

The objective is not documentation for its own sake.