# 0001 — Bootstrap kit, charter sample, link audit

- GH issue: #1
- Branch: `gov/0001-bootstrap-and-audit-references`
- Opened: 2026-05-05
- Closed:

## 1. Mandate

- Author: user+agent
- Model: Claude Opus 4.7
- Review: pending

### 1.1 Context

Bootstrap of the `claude-gov-jumpstart` kit.
`main` carries one initial commit; the kit files (`CLAUDE.md`, `CEREMONIES.md`, `architecture/`, `.claude-template/`) are untracked.
Kit documents are written from a target-project perspective and reference artefacts the target supplies (charter, HOWTO-\*, ARCHITECTURE, scripts, prettier config, venv).

### 1.2 Task nature

Execution.

### 1.3 Problem statement

Three gaps in the kit:

1. No charter exists in-kit, but `CLAUDE.md` and `CEREMONIES.md` cite one.
2. The devlog-folder rule (`[gov]` → `governance/devlog/`, `[study]` → `studies/devlog/`) does not match the dominant practice of `architecture/devlog/`. This devlog itself sits under `architecture/devlog/`, contradicting the rule.
3. Inter-document links across `CLAUDE.md`, `CEREMONIES.md`, `architecture/devlog/CLAUDE.md`, `.claude-template/settings.json`, and `.claude-template/hooks/*` are unverified.

### 1.4 Goal

1. Sample `CHARTER.md` placeholder committed at repo root.
2. CLAUDE.md devlog-folder rule updated so `architecture/devlog/` is the default for all task categories; ripple through CEREMONIES.md and `architecture/devlog/CLAUDE.md` as needed.
3. Every inter-document link audited and fixed, treating `.claude-template/` as if mounted at `.claude/` (install-time fact, not in scope).

### 1.5 Design decisions

1. **`.claude-template/` stays on disk; refs to `.claude/...` are treated as correct.** Rationale: kit must be retrofit-safe — install must not clobber an existing `.claude/`. The mount/copy mechanism is a separate later task.
2. **Sample charter filename: `CHARTER.md`.** Existing references to `AI-AUGMENTED-ENGINEERING-CHARTER.md` get updated to `CHARTER.md` as part of the link-fix step.
3. **Devlog folder simplifies to single `architecture/devlog/`** for all task categories. CLAUDE.md and CEREMONIES.md text updated.
4. **Out-of-kit references** (HOWTO-\*, `architecture/ARCHITECTURE.md`, `governance/scripts/...`, `implementation/...`, historical issue/devlog anchors `#32`, `#35`, `#138`, `#148`, `#158`, `#174`, `0007`): per-ref decision in § 3 — keep as target-project placeholder, soften wording, or remove.
   Default lean: remove kit-specific historical anchors that have no meaning in a fresh install.

### 1.6 Test plan / fixtures

Grep enumeration over `*.md`, `.claude-template/settings.json`, `.claude-template/hooks/*.{sh,py,env}` for path-like and file-like tokens.
Build a classification table: source location, target reference, category (intra-kit / target-project / historical anchor), decision, fix status.
Re-grep after fixes; zero unresolved intra-kit refs is the gate.

### 1.7 Acceptance criteria

1. `CHARTER.md` exists at repo root and is minimally coherent with CLAUDE.md Block 3 `[charter § 12.X]` tags.
2. CLAUDE.md and CEREMONIES.md consistently use `architecture/devlog/`; no surviving mention of `governance/devlog/` or `studies/devlog/` as task-category-specific folders.
3. Audit table in § 3 enumerates every inter-document reference with per-row decision and post-fix status.
4. Re-grep after fixes: zero broken intra-kit links.
5. Kit files committed to the branch as a separate "import as-is" commit before audit-fix commits.

### 1.8 Watchlist reminder

n/a — first task, no watchlist established.

### 1.9 Coverage check

Within charter scope.

## 2. Execution plan

- Author: user+agent
- Model: Claude Opus 4.7
- Review: pending

### 2.1 Steps

1. Commit kit files (`CLAUDE.md`, `CEREMONIES.md`, `architecture/`, `.claude-template/`) on the branch as a single "import as-is" commit, separate from this devlog and from later fix commits.
2. Draft `CHARTER.md` placeholder — skeleton with § 12 sub-numbering matching CLAUDE.md Block 3 `[charter § 12.X]` tags.
3. Update CLAUDE.md devlog-folder rule; ripple through CEREMONIES.md.
4. Grep for inter-document references; build classification table.
5. Apply per-row decisions: rename `AI-AUGMENTED-ENGINEERING-CHARTER.md` → `CHARTER.md`, soften or remove out-of-kit refs, fix any `.claude/` vs `.claude-template/` discrepancies (audit treats `.claude/` as correct, so most fixes target the doc side).
6. Re-grep; confirm gate.
7. Fill § 3 with audit table and outcome.

### 2.2 Scope boundary

Out of scope:

- Authoring the real charter — `CHARTER.md` is a placeholder only.
- Authoring HOWTO-\*, `architecture/ARCHITECTURE.md`, `governance/scripts/`, `implementation/...`.
- `.claude-template/` → `.claude/` rename or install mechanism (later task).
- `MEMORY.md`, `TODO.md` bootstrap (separate housekeeping).
- Charter recompilation of CLAUDE.md Block 3.

## 3. Closure

- Author: agent
- Model: Claude Opus 4.7
- Review: pending

_(filled at closure)_

## Governance trace

_(populated incrementally)_

## Resource consumption

_(populated at closure)_
