# Proposed .gitignore Additions — 2026-05-17

This file is a proposed `.gitignore` draft only. It does not modify the actual `.gitignore`.

## Recommended Patterns

```gitignore
# Office and LibreOffice lock files
.~lock.*
~$*

# Temporary and editor swap files
*.tmp
*.temp
*.bak
*.swp
*.swo

# OS junk
.DS_Store
Thumbs.db
desktop.ini

# Raw ChatGPT export archives
09_AI_Systems/ChatGPT_Export/Raw/*.zip
09_AI_Systems/ChatGPT_Export/Raw/**/*.zip

# Raw media and attachment exports if later copied into repo
*.wav
*.mp3
*.mp4
*.mov
*.m4a
*.heic
*.webp

# Large binary export artifacts if not intentionally tracked
*.pdf
*.docx
*.xlsx
*.pptx
*.msg

# Local AI app state if ever copied into repo
.codex/
.claude/
**/.codex/
**/.claude/

# Optional generated artifact example
10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html
```

## Rationale By Pattern

### Office lock files
- `.~lock.*`
- `~$*`

Rationale:
- These are transient lock artifacts.
- They are not source of truth.
- They create noisy working trees and should not be committed.

### Temporary and editor swap files
- `*.tmp`
- `*.temp`
- `*.bak`
- `*.swp`
- `*.swo`

Rationale:
- These are local editing byproducts.
- They are not durable repo artifacts.
- They create false-positive repo drift.

### OS junk
- `.DS_Store`
- `Thumbs.db`
- `desktop.ini`

Rationale:
- These are operating-system metadata files.
- They provide no institutional value in repo history.

### Raw ChatGPT export ZIP files
- `09_AI_Systems/ChatGPT_Export/Raw/*.zip`
- `09_AI_Systems/ChatGPT_Export/Raw/**/*.zip`

Rationale:
- Raw export ZIPs are large and sensitive.
- They are better treated as immutable source archives, not normal git content.
- Ignoring them reduces accidental commits while preserving the option to reference them by path, checksum, and timestamp.

### Raw media and attachment exports
- `*.wav`
- `*.mp3`
- `*.mp4`
- `*.mov`
- `*.m4a`
- `*.heic`
- `*.webp`

Rationale:
- These files are large and usually sensitive.
- They are typically evidence or attachment material, not operational source files.
- They should be deliberately approved before tracking.

### Large binary export artifacts
- `*.pdf`
- `*.docx`
- `*.xlsx`
- `*.pptx`
- `*.msg`

Rationale:
- These formats often contain sensitive business content.
- They do not diff cleanly in git.
- They should be path-scoped or intentionally approved if the repo needs them as governed source artifacts.

Note:
- These patterns may be too broad for a repo that intentionally tracks some business documents.
- A narrower path-based rule may be safer if those formats are used as legitimate source artifacts elsewhere.

### Local AI app state
- `.codex/`
- `.claude/`
- `**/.codex/`
- `**/.claude/`

Rationale:
- Local app state is machine-specific and not part of repo truth.
- If copied into the repo accidentally, it can expose sensitive metadata and internal session state.
- These paths should be explicitly excluded unless a future archive workflow intentionally snapshots them elsewhere.

### Generated artifact example
- `10_Operations/Platform_Control/Architecture/CEH_Flywheel_Pricing_Model_v1.0.html`

Rationale:
- This appears likely generated from workbook or script output.
- If reproducible, it should not be tracked by default.
- Keeping it out of normal commits reduces binary/generated noise.

## Implementation Note
- Review these patterns before editing the real `.gitignore`.
- Prefer narrower path-based ignores where the repo intentionally tracks some documents or media as governed source artifacts.
