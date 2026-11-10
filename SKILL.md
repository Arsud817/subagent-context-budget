---
name: subagent-context-budget
description: "Trigger: before spawning a subagent, delegate, worker prompt, or agent task. Minimize inherited and repeated context while preserving scope, constraints, and verification."
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

## Activation Contract

Run this preparation immediately before every subagent launch. The orchestrator owns prompt construction and must do this before delegation, not ask the worker to optimize its own input.

## Hard Rules

- Preserve the user's intent, acceptance criteria, allowed edit surfaces, safety constraints, required skills, test-first policy, and exact verification commands.
- Do not forward entire conversation history, task logs, documents, files, or prior worker reports when a relevant excerpt or concise factual summary is sufficient.
- Never remove a constraint merely to reduce tokens. Resolve conflicts by retaining authoritative instructions and noting the relevant source.
- Do not claim token counts unless measured by the runtime; use estimates only when explicitly labeled.
- When a delegated task requires tests, instruct the worker to run them through the repository's existing job mechanism (jobs), rather than streaming the complete test output into the conversation.
- Require test results to report only the command/job identifier, pass/fail status, concise failure summary, and the relevant failing test/error lines. Do not return successful-test output or full logs; preserve logs in the job's normal location and retrieve a bounded excerpt only when diagnosing a failure.

## Decision Gates

| Input | Preparation |
|---|---|
| Long task/spec/history | Extract only applicable requirements; retain exact user wording only where required by the task contract. |
| Broad repo context | Give target paths/symbols and ask for bounded exploration; avoid preloading unrelated files. |
| Long tool output or logs | Summarize findings and keep only errors, evidence, and decisions needed for the work. |
| Tests required | Use the project's jobs workflow; relay only status and failure details, not full output. |
| Repeated instructions | Deduplicate while preserving every distinct obligation and its source. |

## Execution Steps

1. Identify the delegated unit, its needed context, and what the worker can inspect itself.
2. Build a compact prompt with task/outcome, relevant specs, edit surfaces, invariants, relevant skills, test-first requirements, exact checks, and return format. For tests, name the jobs workflow when available and require concise failure-only reporting.
3. Remove unrelated history, duplicated prose, full diffs, and already-known outputs. Link to a task document only when required; specify the exact sections/range to read.
4. Check the final prompt for missing constraints and unnecessary context. If unusually large, explain the unavoidable source and reduce or summarize it before launch.
5. After the worker returns, summarize evidence and outcomes in the parent thread; do not re-inject its full transcript into later agents.

## Output Contract

Launch with the prepared prompt. Keep a short note of what was intentionally excluded and any remaining context risk; do not report token savings without measured before/after usage.

## References

- Apply the orchestrator's active delegation, edit-surface, verification, and safety contracts; this skill supplements and never overrides them.
