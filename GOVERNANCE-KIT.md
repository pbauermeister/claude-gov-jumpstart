# Governance kit — installation and adaptation

> **Transient.** This file is a checklist for adapting the kit to a host project. Delete it once the conditions in § 6 are met.

## 1. What the kit provides

In-kit files, intended to be copied or merged into the host project:

| File                                  | Role                                                                                          |
| ------------------------------------- | --------------------------------------------------------------------------------------------- |
| `CLAUDE.md`                           | Project conventions for the Claude Code agent — manual Block 1, compiled Block 3             |
| `CEREMONIES.md`                       | Trigger-driven procedures: task start, task closure, weekly review, factoring, traces, costs |
| `architecture/devlog/CLAUDE.md`       | Devlog standard structure and review-gate granularity                                         |
| `governance/devlog/README.md`         | Marker — governance maintenance/evolution tasks live here                                     |
| `AI-AUGMENTED-ENGINEERING-CHARTER.md` | Full charter — kit baseline; adapt content to the host project's principles                 |
| `.claude-template/settings.json`      | Claude Code hook bindings; mount as `.claude/settings.json`                                   |
| `.claude-template/hooks/*`            | Hook scripts (commit blockers, attestation guards, prettier, length warnings, venv activate) |
| `README.md`                           | Placeholder repo orientation; replace with the host project's README                          |
| `GOVERNANCE-KIT.md`                   | This file — bootstrap checklist; delete once fully adapted                                    |

## 2. What the consumer must create

Each row is a checkbox. Tick it when the artefact exists in the host project and the references in `CLAUDE.md` / `CEREMONIES.md` resolve to it.

### 2.1 Required at install time

- [ ] **Adapt the charter** at `AI-AUGMENTED-ENGINEERING-CHARTER.md`. The kit ships a **full charter** as a reference baseline — review every section and rewrite to reflect the host project's principles. Cited at `CLAUDE.md:148`, `CEREMONIES.md:232,258`. The charter is meant to be edited, not consumed verbatim.
- [ ] **Recompile `CLAUDE.md` Block 3 from the adapted charter.** See § 6 — the recompilation procedure is sketched but not fully defined; in particular, merging with the previous Block 3 (so edits made directly into Block 3 since the last compilation are not lost) is currently a manual reconciliation step.
- [ ] **Mount `.claude-template/`** as `.claude/`. Mechanism (copy, symlink, install script) is the host project's call; do not clobber an existing `.claude/`. The hooks reference `.claude/hooks/...`, not `.claude-template/...`.
- [ ] **`MEMORY.md`** at repo root. Holds `last-weekly-alignment-review` (and later `last-factoring-review`).
- [ ] **`TODO.md`** at repo root — the capture buffer for ideas arising during work.

### 2.2 Created when their feature is first exercised

- [ ] **`architecture/ARCHITECTURE.md`** — living architecture reference; created when implementation begins.
- [ ] **`architecture/input/`** — folder for analysis / design inputs.
- [ ] **`architecture/FACTORING-TODO.md`** — created at first Factoring review (`CEREMONIES.md:157`).
- [ ] **`product/`** — folder for product requirements.
- [ ] **`studies/`** — folder for research and analysis scripts.
- [ ] **`implementation/`** — code root.
- [ ] **`implementation/CLAUDE.md`** — implementation conventions (`CLAUDE.md:55`).
- [ ] **`implementation/HOWTO-DEVELOP.md`** — implementation procedure index (`CEREMONIES.md:31`).
- [ ] **`implementation/HOWTO-TEST.md`** — test-suite guide (`CEREMONIES.md:44`).
- [ ] **`implementation/HOWTO-USE.md`** — operational usage guide (`CEREMONIES.md:64`).
- [ ] **`implementation/.prettierrc`** — Prettier config, `proseWrap: preserve` (`CLAUDE.md:108`).
- [ ] **`implementation/.venv/bin/activate`** — Python venv (path used by `.claude/hooks/session-start-venv-activate.sh`).
- [ ] **`implementation/node_modules/.bin/prettier`** — Prettier binary (path used by `.claude/hooks/save-md-prettier-run.sh`).
- [ ] **`HOWTO-SCRIPTS.md`** — script-language guide (`CLAUDE.md:86`).
- [ ] **`HOWTO-MEMORY-AUDIT.md`** — memory audit guide (`CEREMONIES.md:142`).
- [ ] **`governance/scripts/analyse_governance_traces.py`** — effectiveness-report tool; create at first weekly review (`CEREMONIES.md:222`).
- [ ] **`Makefile`** — at minimum a `test` target (`CEREMONIES.md:48` requires `make test` for implementation closure).

## 3. External tools assumed

The host project's environment must provide these. The kit does not bundle them.

- `pandoc` — PDF generation from Markdown (`CLAUDE.md:22`)
- `gh` — GitHub CLI (issues, PRs)
- `make` — `make test` required at task closure for implementation tasks
- `python3` — for `governance/scripts/...` and Python hooks
- `prettier` — installed via `npm` into `implementation/node_modules/`
- `npm` — package manager for Prettier
- PlantUML — diagram rendering (`CLAUDE.md:22`)

## 4. External standards referenced

- **RFC 2119** — requirement-strength keywords (MUST, SHOULD, MAY) per `CLAUDE.md:92`.

## 5. Historical anchors to soften

The kit's bundled docs reference incident numbers from the originating project. These don't resolve in a fresh install. Treat them as illustrative; the audit task that produced this kit may have softened or removed them.

| Anchor              | Where                                  | Subject                                  |
| ------------------- | -------------------------------------- | ---------------------------------------- |
| `devlog 0007 § 3.2` | `CEREMONIES.md:26`                     | Watchlist origin                         |
| `#138`              | `CEREMONIES.md:262, 281`               | Resource-consumption instrumentation     |
| `#148`              | `CLAUDE.md:84, 179`                    | Ensure-venv reframing                    |
| `#158`              | `CLAUDE.md:242`                        | Closure fill-in                          |
| `#162`, `#174`      | `architecture/devlog/CLAUDE.md:97`     | Subsection numbering                     |

## 6. Known incomplete procedures

These kit-level workflows are sketched but not fully codified. The consumer takes them on as residual manual work, with care.

### 6.1 Charter recompilation into `CLAUDE.md` Block 3

`CLAUDE.md` Block 2 points at `AI-AUGMENTED-ENGINEERING-CHARTER.md` Appendix A for "when and how to recompile". The trigger and direction are clear; the **merge-with-previous-Block-3 step is not codified**.

Naive recompilation overwrites Block 3 from the charter alone, losing any edits made directly into Block 3 since the previous compilation (e.g. ad-hoc clarifications added during a task that haven't yet been back-ported into the charter).

Until the procedure is automated:

1. Diff the current Block 3 against what the charter would produce.
2. Identify changes that exist only in Block 3 (not in the charter) — these are edits that must either be back-ported into the charter first, or preserved during the merge.
3. Draft the new Block 3 from the adapted charter; reconcile each Block-3-only change by hand.
4. Apply the section-metadata reset rule (any agent edit to reviewed content resets the review to `pending`).
5. Have the user attest the new Block 3.

Recompilation is therefore a multi-step human review, not a one-shot regeneration.

## 7. When to delete this file

Delete `GOVERNANCE-KIT.md` (and remove its mention from `README.md`) when all of the following hold:

1. Every box in § 2.1 is ticked.
2. Every reference in `CLAUDE.md` and `CEREMONIES.md` either resolves to a real host-project file or has been deliberately stripped/rewritten as part of adaptation.
3. The host project's own README has replaced the kit's placeholder.
4. A fresh grep over the kit's docs surfaces no path that points at an absent artefact.
5. § 6 procedures have either been formalised (codified workflow committed) or explicitly accepted as residual manual work for the host project.

The kit's purpose is to bootstrap a project into AI-augmented governance. Once the project owns its own conventions, this file is dead weight — delete it and trust the project's own docs.
