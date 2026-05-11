# CONTENT_SOURCE_OF_TRUTH

## Purpose

This document defines where website content should come from before it is added, edited, or rewritten.

Its job is to prevent content drift across ORM websites.

Use it to decide:

- what language is canonical
- what language is working draft only
- what language must not be casually rewritten
- where Claude should pull from before implementation

---

# Core Content Sources

## ORM founder bio source

Primary source:

- Daniel-approved founder bio language in live ORM materials and approved governance / brand docs

Status:

- verify against current approved ORM site copy before major edits

## CEH Standard language source

Primary source:

- approved CEH methodology and standards language
- governance documents defining CEH Standard as the methodology layer

Status:

- do not rewrite core definitions casually

## CEH Index source

Primary source:

- approved CEH Infrastructure Index product language
- approved public product positioning
- governance documents defining CEH Index as the product/intelligence layer

Status:

- keep distinct from CEH Standard language

## Brand rules source

Primary source:

- `09_AI_Systems/Governance/BRAND_RULES.md`
- approved live site patterns where they do not conflict with governance

## Investor language source

Primary source:

- Daniel-approved investor-facing copy
- approved investor portal or capital materials

Status:

- do not move investor language into public pages casually

## Legal / IP disclaimers source

Primary source:

- current approved trademark, ownership, and disclaimer language already in use
- Daniel-approved updates only

Status:

- do not rewrite without direct instruction

---

# Prohibited Content or Language

Do not publish language that:

- states or implies CEH Standard and CEH Infrastructure Index are the same surface
- implies DGE&I is the parent governance layer
- misstates ORM ownership or hierarchy
- invents certifications, approvals, partnerships, or index claims
- uses placeholder AI language as if it were approved institutional language
- copies rough draft language into live site content without review

---

# Separation Rules

## ORM

ORM content should speak as:

- the parent governance and ownership layer

ORM content should not default into:

- CEH Standard methodology detail
- CEH Index product marketing detail
- DGE&I execution-detail messaging

## CEH Standard

CEH Standard content should speak as:

- the methodology and standards layer

CEH Standard content should not be used as:

- CEH Index product copy
- ORM parent-platform copy

## CEH Infrastructure Index

CEH Index content should speak as:

- the product and intelligence layer

CEH Index content should not be used as:

- CEH Standard root-definition copy
- ORM parent-platform copy

## DGE&I

DGE&I content should speak as:

- the execution / reference implementation layer

DGE&I content should not be used as:

- ORM homepage framing
- CEH Standard methodology ownership
- CEH Index canonical product authority

## SBR

If SBR appears in website content, it must be explicitly defined and separated from ORM, CEH, and DGE&I messaging before publication.

Do not assume the reader knows the relationship.

---

# Working Rule for Claude

Before writing or replacing content, Claude should ask:

1. Which entity is speaking on this page?
2. What is the approved source for that language?
3. Is the content canonical, operational, or draft?
4. Could this wording blur ORM, CEH Standard, CEH Index, DGE&I, or SBR?

If the answer is unclear, Claude should preserve current approved language and flag the uncertainty.
