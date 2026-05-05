# How We Work

This document is for human readers. It is informational only — the authoritative sources are the Charter and CLAUDE.md, referenced below.

## 1. Overview

### 1.1 Context

This repository is a software development project for a product embedding AI, and the development itself is AI-augmented — a coding agent (Claude) participates throughout the engineering process. The project includes innovative and exploratory aspects alongside conventional software work.

We say "AI-augmented" rather than the more common "AI-assisted" deliberately: the human–agent combination expands what either party can do alone, not merely accelerates existing work. Both modes coexist — routine tasks are assisted, but the overall approach is augmented.

Governance is part of this repository. Unlike traditional projects where engineering governance is handled separately and predates the work, here the involvement of an AI agent is new territory. The governance definition and its evolution are integral to the project and tracked alongside architecture and code.

### 1.2 AI-augmented engineering essentials

Three artefacts define how the human–agent collaboration works:

1. **Charter** ([`AI-AUGMENTED-ENGINEERING-CHARTER.md`](AI-AUGMENTED-ENGINEERING-CHARTER.md)) — Principles and enforcement rules governing the collaboration. This is the source of truth.
2. **CLAUDE.md** ([`CLAUDE.md`](CLAUDE.md)) — The agent's operating manual. A mix of hand-crafted project conventions (operational conventions) and rules compiled from the Charter, automatically recompiled when the Charter changes.
3. **Ceremonies** ([`CEREMONIES.md`](CEREMONIES.md)) — Checklists for task start, task closure, and weekly alignment review. Companion to CLAUDE.md, read by the agent at specific trigger points rather than loaded on every prompt.
4. **Agent memory** — The agent maintains persistent memory across sessions to preserve context, conventions, and project state. This memory is per-user and not committed. A weekly ceremony scans it for rules worth promoting to shared files (CLAUDE.md, CEREMONIES.md) so all team members benefit.

### 1.3 Key practices

1. **Task discipline.** Every task gets a GitHub issue, a devlog entry, and a git branch — all created together at task start.
2. **Ceremonies.** Defined in [`CEREMONIES.md`](CEREMONIES.md): a task start checklist (GH issue, branch, devlog, assessments), a task closure protocol (review, retrospective, user approval, finalization), and a weekly alignment review (drift check, landscape scan, memory transfer).
3. **Bias controls.** The workflow includes specific bias controls: fact/inference separation, confidence marking, proportionality checks, coverage checks at phase boundaries, flattery avoidance.
4. **Level separation.** Governance, architecture, and domain concerns are kept distinct in discussions and documents.
5. **Roles.** An architect, a product manager, and the agent. The human remains the decision-maker; humans mandate and ideate, the agent helps refine; agent and human co-generate, the agent can be asked to review; the human does the final review and approves.

## 2. Details and pointers

### 2.1 Repository structure

The repository is organised into five areas. Architecture and governance have their own `devlog/` folders for task logs:

1. **`docs/`** — Published deliverables (PDFs, copies of pitch materials, technical architecture documents).
2. **`product/`** — Product requirements, decisions, and domain inputs (reference library, no devlogs).
3. **`governance/`** — General governance, with a special focus on AI-augmented engineering: charter and governance artefacts.
4. **`architecture/`** — Principal architecture deliverable and working documents (analysis, design).
5. **`implementation/`** — Application code (future).

### 2.2 Work process

A task follows this lifecycle:

1. **Start** — create a GitHub issue, a devlog file, and a branch; run the task start checklist (see [`CEREMONIES.md`](CEREMONIES.md)).
2. **Define** the mandate in the devlog (what to do, scope, acceptance criteria).
3. **Refine** the mandate through human–agent dialogue.
4. **Execute** — the agent generates, the human reviews, iterate until satisfactory.
5. **Log** outcomes and debrief in the devlog.
6. **Close** — run the task closure ceremony: agent requests review and drafts retrospective, user affixes review approval and commits (non-delegable), then push, merge, and clean up.

A good example of a complete lifecycle is [`architecture/devlog/0015-align-architecture-with-mvp-focus.md`](architecture/devlog/0015-align-architecture-with-mvp-focus.md).

### 2.3 Traceability

When a published or closed document is updated after the fact, changes are annotated inline with `[Updated DATE: summary]` to maintain traceability while preserving the document's history.

### 2.4 Toolchain

Documents are written in Markdown with PlantUML and data-flow diagrams. PDFs are generated via `pandoc` using the Makefile in `docs/phase-0-technical-architecture/`.

### 2.5 Naming conventions

GitHub issues and pull requests use category prefixes in their titles: `[gov]` for governance, `[arch]` for architecture, `[impl]` for implementation.

### 2.6 Pointers for self-guided reading

1. [AI-Augmented Engineering Charter](AI-AUGMENTED-ENGINEERING-CHARTER.md) — start here for principles
2. [CLAUDE.md](CLAUDE.md) — compiled agent instructions
3. [Ceremonies](CEREMONIES.md) — task start, closure, and weekly review checklists
4. [Devlog example (task #15)](architecture/devlog/0015-align-architecture-with-mvp-focus.md) — complete task lifecycle

## 3. Status and limitations

### 3.1 Current phase

The project is in Phase 0 — documentation (analysis and architecture) only. There is no application code yet. The repository contains architecture documents, governance artefacts, and their supporting materials.

### 3.2 Multi-user teamwork

The current workflow has been developed and tested with a single human + agent pair. Multi-user modalities are not yet defined. Known issues:

1. Agent memory is per-user. A weekly ceremony mitigates this by promoting useful rules to shared files, but ad-hoc knowledge remains siloed until the next review.
2. Concurrent work on the same task or document has no defined protocol.
3. Consistency of compiled agent instructions (CLAUDE.md) when multiple users may trigger recompilation.
4. Devlog and branch ownership when tasks involve more than one contributor.
