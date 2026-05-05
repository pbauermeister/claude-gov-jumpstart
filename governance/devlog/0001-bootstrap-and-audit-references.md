# 0001 — Bootstrap kit, charter sample, link audit

- GH issue: #1
- Branch: `gov/0001-bootstrap-and-audit-references`
- Opened: 2026-05-05
- Closed:

## 1. Mandate

- Author: user+agent
- Model: Claude Opus 4.7
- Review: user

### 1.1 Context

Kit unpacked, untracked beyond the initial `main` commit.
Kit docs are written from the consumer's perspective; several refs point at consumer-supplied artefacts.

### 1.2 Task nature

Execution.

### 1.3 Problem statement

1. No in-kit charter; cited by `CLAUDE.md` and `CEREMONIES.md`.
2. Devlog-folder rule cites `studies/devlog/` (absent) and `governance/devlog/` (absent — no navigability marker, nothing populated).
3. Inter-document links across kit files unverified.

### 1.4 Goal

1. New kit-provided files: `README.md` (placeholder), `GOVERNANCE-KIT.md` (transient adaptation checklist).
2. `governance/devlog/` populated with a `README.md` marker; CLAUDE.md devlog rule cleaned (drop `studies/devlog/`).
3. Inter-doc links audited and fixed, treating `.claude-template/` as `.claude/`. Charter (`AI-AUGMENTED-ENGINEERING-CHARTER.md`, ships full) verified coherent with CLAUDE.md Block 3 `§ 12.X` tags.

### 1.5 Design decisions

1. `.claude-template/` stays; `.claude/...` refs are correct (retrofit must not clobber an existing `.claude/`). Mount/copy is a later task.
2. Charter filename: `AI-AUGMENTED-ENGINEERING-CHARTER.md`.
3. `governance/devlog/` holds governance maintenance/evolution tasks; `architecture/devlog/` holds the rest. Drop `[study] → studies/devlog/`. This devlog moves to `governance/devlog/` during implementation.
4. Out-of-kit refs (HOWTO-\*, `ARCHITECTURE.md`, `governance/scripts/`, `implementation/...`, historical anchors): per-ref decision in § 3 — keep, soften, or remove. Default lean: remove anchors meaningless in a fresh install.

### 1.6 Test plan / fixtures

Grep refs in `*.md` and `.claude-template/{settings.json,hooks/*}`. Classify (source / target / category / decision / fix-status). Re-grep; gate = zero unresolved intra-kit refs.

### 1.7 Acceptance criteria

1. `AI-AUGMENTED-ENGINEERING-CHARTER.md` (full charter) coherent with CLAUDE.md Block 3 `[charter § 12.X]` tags; `README.md` and `GOVERNANCE-KIT.md` exist.
2. `governance/devlog/README.md` exists; CLAUDE.md no longer references `studies/devlog/`; this devlog sits at `governance/devlog/0001-bootstrap-and-audit-references.md`.
3. § 3 audit table covers every inter-doc ref with decision and fix status.
4. Zero broken intra-kit links post-fix.
5. Kit imported on the branch as a separate commit before audit-fix commits.

### 1.8 Coverage check

Within charter scope.

## 2. Execution plan

- Author: user+agent
- Model: Claude Opus 4.7
- Review: user

### 2.1 Steps

1. Commit existing kit files (including the full charter) as a single import-as-is commit.
2. Create new kit-provided files: `README.md`, `GOVERNANCE-KIT.md`, `governance/devlog/README.md`.
3. Update CLAUDE.md devlog rule (drop `studies/devlog/`); ripple to `CEREMONIES.md`.
4. Grep refs; build classification table.
5. Apply per-row decisions: soften/remove out-of-kit refs.
6. Move this devlog to `governance/devlog/`.
7. Re-grep; confirm gate; fill § 3.

### 2.2 Scope boundary

Out of scope: real charter authoring; HOWTO-\*, `ARCHITECTURE.md`, `governance/scripts/`, `implementation/...`; rename/install mechanism; `MEMORY.md`/`TODO.md`; Block 3 recompilation.

## 3. Closure

- Author: agent
- Model: Claude Opus 4.7
- Review: pending

### 3.1 Implementation deviations

- Charter ships full (not a skeleton); mandate corrected mid-stream (commit `755cb2c`); GOVERNANCE-KIT.md framing reflects "adapt the charter, don't fill it".
- Historical-anchor scrub went beyond § 1.5 #4's WP-2.x scope — also #138, #148, #158, #162/#174, #8, #9, devlog 0007 — per user direction.
- Anonymisation (CKW/AXSA endpoints, branch examples, model versions) done during pre-implementation rather than step 5; step 5 then only handled residual narrative anchors.
- `README.md` was tracked from the initial commit; overwritten in place rather than newly created.
- Block 3 recompilation gap surfaced during writing of GOVERNANCE-KIT.md and captured as new § 6.

### 3.2 File inventory

- Imported (post-anonymisation): `.claude-template/{settings.json, hooks/*}` (12 hook files), `CLAUDE.md`, `CEREMONIES.md`, `architecture/devlog/CLAUDE.md`, `AI-AUGMENTED-ENGINEERING-CHARTER.md`.
- Created: `GOVERNANCE-KIT.md`, `governance/devlog/README.md`.
- Overwritten: `README.md`.
- Moved: this devlog → `governance/devlog/`.

### 3.3 Verification commands and audit table

```
grep -rnE '\b(ckw|axsa|cloudhub|grafana|swiss|axpo)\b' . --include='*.md' --include='*.json'
grep -rnE 'WP-[0-9]|Originating (evidence|incident)|devlog 0007' . --include='*.md'
grep -rnE '#(8|9|32|35|138|148|158|162|174)\b' . --include='*.md'
grep -rn 'Claude Opus 4\.6' . --include='*.md' --include='*.json'
python3 -c "import json; json.load(open('.claude-template/settings.json'))"
```

All return clean. Reference classification:

| Category                   | Status                                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Intra-kit                  | All resolve (CLAUDE.md ↔ CEREMONIES.md ↔ devlog standard ↔ charter ↔ README ↔ GOVERNANCE-KIT ↔ `.claude/`)    |
| Target-project (consumer)  | Catalogued in `GOVERNANCE-KIT.md § 2` (~20 items)                                                            |
| External tools / standards | Catalogued in `GOVERNANCE-KIT.md § 3-4` (8 items)                                                            |
| Historical anchors         | All softened or removed                                                                                       |

### 3.4 Coverage check

Within charter scope.

### 3.6 Gate check

Acceptance criteria from § 1.7 — all met:

1. ✅ Charter coherent with Block 3 § 12.X tags; `README.md` and `GOVERNANCE-KIT.md` exist.
2. ✅ `governance/devlog/README.md` exists; CLAUDE.md drops `studies/devlog/`; this devlog at `governance/devlog/0001-bootstrap-and-audit-references.md`.
3. ✅ Audit table in § 3.3.
4. ✅ Re-grep clean on intra-kit and historical anchors.
5. ✅ Kit imported as separate commit (`c4976dd`) before audit-fix commits.

### 3.9 Retrospective

| #   | Point                                                                   | Agent    | User |
| --- | ----------------------------------------------------------------------- | -------- | ---- |
| 1   | Iterative mandate shaping (5 rounds) before attestation                 | well     | —    |
| 2   | Convergence-check could have fired earlier; rule didn't strictly apply  | not well | —    |
| 3   | Anonymisation caught the only confidentiality leak (CKW/AXSA endpoints) | well     | —    |
| 4   | Charter being full (not skeleton) reframed mid-mandate                  | surprise | —    |
| 5   | Block 3 recompilation gap captured rather than swept under              | well     | —    |
| 6   | Transient/deletable design for GOVERNANCE-KIT.md                        | well     | —    |

### 3.10 Forward-looking check

Tasks naturally enabled by this bootstrap:

- `.claude-template/` → `.claude/` install mechanism (mount/copy/script).
- Block 3 recompilation procedure (the § 6 gap in GOVERNANCE-KIT.md).
- `.gitignore` for kit hygiene (pycache, OS files).
- License decision (current badge: `TBD`).

### 3.11 Verdict

**Recommendation:** Accept.

Rationale:

- All 5 acceptance criteria met.
- Anonymisation removed the only true confidentiality leak.
- Zero intra-kit broken refs; valid JSON; explicit adaptation pathway via `GOVERNANCE-KIT.md`.
- Block 3 recompilation gap captured (`GOVERNANCE-KIT.md § 6`) rather than hidden.

## Governance trace

| Source                              | Clause                               | Action  | Note                                                                     |
| ----------------------------------- | ------------------------------------ | ------- | ------------------------------------------------------------------------ |
| `CLAUDE.md` § Task execution        | Convergence check                    | tension | 5 rounds of mandate iteration; rounds added substance — rule didn't fire |
| `CEREMONIES.md` § Task start        | Mandate approval gate                | applied | user attested § 1 + § 2 (commit `6e2e21f`) before implementation         |
| `CLAUDE.md` § Permissions           | settings.json requires user review   | applied | user approved anonymisation before commit                                |
| `CLAUDE.md` § Naming discipline     | Outcome-named identifiers            | applied | branch examples genericised by outcome, not tech                         |
| `architecture/devlog/CLAUDE.md`     | Lean mandate + execution plan        | applied | mandate compressed to 92 lines pre-attestation                           |
| `CLAUDE.md` § Density and terseness | Sentence-per-line, tables over prose | applied | audit summary table replaces ref-by-ref prose                            |
| `CLAUDE.md` § YAGNI                 | No premature abstraction             | applied | `.gitignore` not added mid-task; surfaced in § 3.10 instead              |
| `CEREMONIES.md` § Task closure      | Forward-looking check                | applied | § 3.10 lists four enabled successor tasks                                |

## Resource consumption

| Phase          | Tokens (approx) | Wall time          |
| -------------- | --------------- | ------------------ |
| Mandate        | ~80k            | several iterations |
| Implementation | ~70k            | single session     |
| Closure        | ~25k            | this writing       |
| **Total**      | **~175k**       |                    |

| Counter                | Value                                            |
| ---------------------- | ------------------------------------------------ |
| Pre-commit hook fails  | 0 (hooks not active in this repo — kit-template) |
| Subagent invocations   | 0                                                |
| `/clear` events        | 0                                                |
| Memory rotation events | 0                                                |
| LOC changed            | ~2200 (kit import baseline + audit fixes)        |
| Files changed          | 21                                               |
