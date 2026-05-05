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

Kit unpacked, untracked beyond the initial `main` commit.
Kit docs are written from the consumer's perspective; several refs point at consumer-supplied artefacts.

### 1.2 Task nature

Execution.

### 1.3 Problem statement

1. No in-kit charter; cited by `CLAUDE.md` and `CEREMONIES.md`.
2. Devlog-folder rule contradicts dominant practice and this devlog itself.
3. Inter-document links across kit files unverified.

### 1.4 Goal

1. Sample `CHARTER.md` at repo root.
2. `architecture/devlog/` is the default for all task categories.
3. Inter-doc links audited and fixed, treating `.claude-template/` as `.claude/`.

### 1.5 Design decisions

1. `.claude-template/` stays; `.claude/...` refs are correct (retrofit must not clobber an existing `.claude/`). Mount/copy is a later task.
2. Charter filename: `CHARTER.md`.
3. Single devlog folder `architecture/devlog/`.
4. Out-of-kit refs (HOWTO-\*, `ARCHITECTURE.md`, `governance/scripts/`, `implementation/...`, historical anchors): per-ref decision in § 3 — keep, soften, or remove. Default lean: remove anchors meaningless in a fresh install.

### 1.6 Test plan / fixtures

Grep refs in `*.md` and `.claude-template/{settings.json,hooks/*}`. Classify (source / target / category / decision / fix-status). Re-grep; gate = zero unresolved intra-kit refs.

### 1.7 Acceptance criteria

1. `CHARTER.md` coherent with Block 3 `[charter § 12.X]` tags.
2. No surviving `governance/devlog/` or `studies/devlog/` references.
3. § 3 audit table covers every inter-doc ref with decision and fix status.
4. Zero broken intra-kit links post-fix.
5. Kit imported on the branch as a separate commit before audit-fix commits.

### 1.8 Coverage check

Within charter scope.

## 2. Execution plan

- Author: user+agent
- Model: Claude Opus 4.7
- Review: pending

### 2.1 Steps

1. Commit kit files as a single import-as-is commit.
2. Draft `CHARTER.md` skeleton matching Block 3 § 12.X tags.
3. Update devlog rule in `CLAUDE.md`; ripple to `CEREMONIES.md`.
4. Grep refs; build classification table.
5. Apply per-row decisions: rename charter refs, soften/remove out-of-kit refs.
6. Re-grep; confirm gate; fill § 3.

### 2.2 Scope boundary

Out of scope: real charter authoring; HOWTO-\*, `ARCHITECTURE.md`, `governance/scripts/`, `implementation/...`; rename/install mechanism; `MEMORY.md`/`TODO.md`; Block 3 recompilation.

## 3. Closure

- Author: agent
- Model: Claude Opus 4.7
- Review: pending

_(filled at closure)_

## Governance trace

_(populated incrementally)_

## Resource consumption

_(populated at closure)_
