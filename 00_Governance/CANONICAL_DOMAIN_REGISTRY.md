# CANONICAL_DOMAIN_REGISTRY

## Purpose

This document defines the official canonical domain governance framework for the Oak Ridge Management ecosystem.

Its purpose is to prevent:

- canonical ambiguity
- SEO conflicts
- deployment-layer ownership confusion
- public-facing narrative drift
- domain overlap between standards, products, and execution entities
- accidental reclassification of entity boundaries through redirects or convenience hosting

This is a governance document.

It is not:

- a DNS zone file
- a registrar configuration sheet
- a Netlify configuration file
- a redirect implementation checklist
- a technical hosting runbook

This document governs:

- official canonical domains
- domain ownership interpretation
- redirect authority
- canonical URL behavior
- cross-domain linking behavior
- future domain transition decisions

All deployment, SEO, redirect, and URL-structure decisions must conform to this registry.

---

# 1. Purpose of Canonical Domain Governance

Canonical domain governance exists because public URL structure influences institutional perception.

If a domain, subdomain, path, or canonical tag suggests the wrong ownership or wrong entity relationship, the platform becomes ambiguous even if the written narrative is correct.

Canonical domain governance therefore exists to ensure that:

- Oak Ridge Management remains the parent governance layer
- CEH Standard remains distinct from CEH Infrastructure Index
- DGE&I remains distinct from ORM and CEH ownership
- public URLs reinforce official institutional boundaries
- redirects do not create implied ownership errors
- future monorepo deployment flexibility does not collapse entity identity

Canonical domains are governance assets, not merely technical assets.

---

# 2. Official Canonical Domains

## Oak Ridge Management

Official canonical domain:

- `oakridgemanagement.net`

Official role:

- parent platform
- governance layer
- ownership layer
- institutional control surface

This domain is the official canonical public home of ORM.

## CEH Standard

Official canonical domain:

- `cehstandard.com`

Official role:

- methodology layer
- standards publication layer
- certification and benchmarking logic layer

This domain is the official canonical public home of CEH Standard.

## CEH Infrastructure Index

Official canonical domain:

- `cehinfrastructureindex.com`

Official role:

- product layer
- intelligence layer
- rankings, research, and index-access layer

This domain is the official canonical public home of CEH Infrastructure Index.

## DGE&I

Official canonical public domain:

- to be formally designated

Until formally designated, DGE&I should be treated as a controlled execution/reference entity whose public-facing digital presence must not imply parent-platform ownership.

If DGE&I public materials are hosted temporarily under another controlled surface, such hosting must be explicitly documented as transitional.

DGE&I does not inherit canonical ownership merely through temporary hosting.

---

# 3. Secondary / Supporting Domains

Secondary and supporting domains may exist for:

- redirects
- campaign routing
- transitional migration
- staging or preview experiences
- archived historical entry points
- gated or investor-specific access surfaces

Secondary/supporting domains are not canonical unless explicitly declared in this document.

## Current Supporting Relationship Rules

`oakridgemanagement.net` may link to:

- `cehstandard.com`
- `cehinfrastructureindex.com`
- future official DGE&I domain

`cehstandard.com` may link upward to:

- `oakridgemanagement.net`

`cehinfrastructureindex.com` may link upward to:

- `oakridgemanagement.net`

DGE&I supporting surfaces may link upward to:

- `oakridgemanagement.net`
- `cehstandard.com` where relevant
- `cehinfrastructureindex.com` where contextually appropriate

Supporting domains must not override canonical ownership hierarchy.

---

# 4. Canonical Ownership Hierarchy

Canonical domain ownership must reflect the institutional hierarchy.

Official hierarchy:

1. Oak Ridge Management
2. CEH Standard
3. CEH Infrastructure Index
4. DGE&I

This means:

- ORM owns the parent institutional layer
- CEH Standard owns the standard-layer canonical home
- CEH Infrastructure Index owns the product-layer canonical home
- DGE&I does not own the parent ecosystem, regardless of deployment or hosting convenience

## Interpretation Rule

If a canonical domain setup implies that:

- DGE&I is the parent layer
- CEH Infrastructure Index owns CEH Standard
- CEH Standard owns ORM
- CEH Infrastructure Index is merely a CEH Standard subpage by default

then the setup is institutionally incorrect unless explicitly approved as transitional and documented.

---

# 5. Redirect Authority Rules

## Redirect Authority Principle

Redirects are governance actions, not merely technical conveniences.

Any redirect can imply:

- ownership
- canonical priority
- product dependence
- parent-child relationship
- institutional nesting

Therefore redirect decisions must follow governance authority.

## Redirect Authority

Final redirect authority resides with:

- Daniel Cobb as final human principal
- Oak Ridge Management as governance control layer

No sub-entity may unilaterally establish redirect behavior that changes perceived ownership hierarchy.

## Redirect Rules

ORM may redirect supporting or transitional traffic into ORM-controlled canonical surfaces.

CEH Standard may redirect legacy or support URLs into `cehstandard.com`.

CEH Infrastructure Index may redirect legacy or support URLs into `cehinfrastructureindex.com`.

DGE&I may redirect its own support URLs into officially approved DGE&I surfaces only.

## Prohibited Redirect Behavior

The following is prohibited unless explicitly approved and documented:

- redirecting CEH Infrastructure Index into CEH Standard in a way that implies the Index is not a distinct product layer
- redirecting CEH Standard into DGE&I surfaces
- redirecting ORM parent traffic into DGE&I execution pages
- using redirect behavior to solve deployment convenience at the expense of institutional clarity

---

# 6. Canonical URL Rules

## Canonical URL Principle

A canonical URL must reflect the official home of the entity or content being served.

Canonical tags must reinforce entity identity, not blur it.

## Rules by Entity

ORM pages must canonicalize to:

- `oakridgemanagement.net`

CEH Standard pages must canonicalize to:

- `cehstandard.com`

CEH Infrastructure Index pages must canonicalize to:

- `cehinfrastructureindex.com`

DGE&I pages must canonicalize to:

- the future official DGE&I domain or formally approved transitional path

## Canonical Path Rule

A CEH Infrastructure Index page must not canonically resolve to a CEH Standard path merely because the content is historically related.

A CEH Standard page must not canonically resolve to ORM merely because ORM is the parent owner.

A DGE&I page must not canonically resolve to ORM or CEH unless the page is actually an ORM or CEH page.

## Content Identity Rule

The canonical URL must match the institutional identity of the page, not the convenience of the current hosting repo or deployment system.

---

# 7. Cross-Domain Linking Rules

## Cross-Domain Linking Principle

Cross-domain links are allowed and often necessary, but they must reinforce hierarchy rather than obscure it.

## Approved Linking Pattern

ORM links downward to:

- CEH Standard
- CEH Infrastructure Index
- DGE&I

CEH Standard links upward to:

- ORM

CEH Standard may link laterally to:

- CEH Infrastructure Index where analytically relevant

CEH Infrastructure Index links upward to:

- ORM

CEH Infrastructure Index may link laterally to:

- CEH Standard where methodology context is relevant

DGE&I links upward to:

- ORM

DGE&I may link to:

- CEH Standard as adopted methodology
- CEH Infrastructure Index as analytical context where appropriate

## Linking Rule

Cross-domain links must communicate relationship clearly in surrounding language.

A link alone does not create ambiguity.
A link plus unclear framing does.

---

# 8. SEO and Canonicalization Rules

## SEO Principle

Search optimization must serve institutional clarity, not undermine it.

SEO gains achieved through blurred canonical behavior are governance failures.

## Canonicalization Rules

Each indexable page must declare:

- one canonical URL
- one clear entity identity
- one clear public ownership relationship

There must not be multiple competing canonical signals for the same content across ORM, CEH Standard, and CEH Infrastructure Index.

## Duplicate Content Rule

If materially similar content appears across multiple domains, one location must be declared primary.

The others must be:

- rewritten with clearly different purpose
- noindexed where appropriate
- redirected where appropriate
- archived where appropriate

## SEO Ownership Rule

Search ranking convenience must never override official institutional topology.

If a technically convenient canonical structure conflicts with governance hierarchy, governance hierarchy wins.

---

# 9. Domain Transition Rules

## Transition Principle

Domains may evolve over time, but transitions must be governed and explicitly documented.

No entity may “drift” into a new canonical home through repeated convenience deployments.

## Transition Requirements

Before any canonical domain transition occurs, governance must define:

- why the change is needed
- what entity identity is affected
- what historical URLs are impacted
- what redirects are required
- what SEO risks exist
- what public ownership interpretation may change
- what rollback path exists

## Required Documentation

Any canonical transition must be logged in:

- `DECISIONS.md`
- `SESSION_LOG.md`

Any transitional hosting or mixed-domain period must be explicitly documented as transitional.

## Transition Rule

Temporary deployment convenience does not become permanent canonical authority unless formally approved.

---

# 10. Rules for Future Deploy Targets

## Future Deploy Target Principle

Future deploy targets may change, but entity boundaries must remain stable.

A monorepo, multi-site build system, or new deployment platform does not alter canonical ownership.

## Required Future Deploy Behavior

Each future public deploy target must map cleanly to one of the following:

- ORM parent surface
- CEH Standard surface
- CEH Infrastructure Index surface
- DGE&I surface

Each deploy target must declare:

- its canonical domain
- its redirect authority
- its parent governance relationship
- its public ownership relationship

## Monorepo Compatibility Rule

Future monorepo architecture may centralize source code and shared services, but must not collapse canonical domain distinctions.

A shared codebase may support multiple properties.
It may not erase their separate canonical homes.

---

# 11. Anti-Ambiguity Rules

The following rules are mandatory.

## Anti-Ambiguity Rule 1
`oakridgemanagement.net` is the canonical parent platform domain.

## Anti-Ambiguity Rule 2
`cehstandard.com` is the canonical standard-layer domain.

## Anti-Ambiguity Rule 3
`cehinfrastructureindex.com` is the canonical product-layer domain.

## Anti-Ambiguity Rule 4
CEH Infrastructure Index must not canonically point to CEH Standard paths by default.

## Anti-Ambiguity Rule 5
A deployment repo may host content for convenience, but repo location does not determine institutional ownership.

## Anti-Ambiguity Rule 6
Redirects must not be used to imply a different entity hierarchy than the official platform boundary map.

## Anti-Ambiguity Rule 7
DGE&I must never become the implied canonical home of ORM, CEH Standard, or CEH Infrastructure Index.

## Anti-Ambiguity Rule 8
A domain must not simultaneously function as the canonical home of multiple distinct entity layers unless explicitly approved and documented as temporary.

## Anti-Ambiguity Rule 9
Canonical tags, sitemap logic, redirect behavior, and page framing must all point in the same institutional direction.

## Anti-Ambiguity Rule 10
Public domain structure must reinforce the official platform hierarchy even during migration periods.

---

# 12. Governance Enforcement

## Enforcement Authority

This registry is governed by:

- Oak Ridge Management as parent control layer
- Daniel Cobb as final approving authority

## Scope of Enforcement

This document governs:

- canonical tags
- redirect rules
- domain transitions
- SEO ownership interpretation
- repo-to-domain mapping decisions
- staging-to-production domain assumptions
- future deploy target assignments

## Violation Standard

Any of the following constitutes governance drift:

- a CEH Index page canonically resolving to CEH Standard without approved rationale
- DGE&I content implying parent-platform ownership
- ORM parent content hidden behind another entity’s canonical surface
- duplicate public content with conflicting canonical ownership
- deployment convenience overriding official topology

## Correction Rule

If a domain, canonical tag, redirect, or deployment pattern conflicts with this registry, the conflict must be corrected before:

- platform consolidation
- major redesign
- repo migration
- public relaunch
- production-scale deployment changes

---

# Official Canonical Registry Summary

## Canonical Domains

- Oak Ridge Management: `oakridgemanagement.net`
- CEH Standard: `cehstandard.com`
- CEH Infrastructure Index: `cehinfrastructureindex.com`
- DGE&I: to be formally designated

## Governance Hierarchy

- ORM governs
- CEH Standard defines
- CEH Infrastructure Index productizes
- DGE&I executes

## Canonical Governance Principle

Domains must reflect institutional truth.

Technical convenience may shape implementation, but it must never redefine ownership, hierarchy, or public identity.