# Context Engineering

## Hierarchy (load in this order)

1. **Rules** — persistent, project-wide conventions (always loaded)
2. **Specs/PRDs** — per-feature requirements and constraints
3. **Relevant source** — files directly related to the task
4. **Error output** — current failures and stack traces
5. **Conversation history** — managed by compaction

## Principles

- Quality over quantity: focused context <2000 lines outperforms comprehensive dumps
- Load only what the current task needs — don't preload "just in case"
- When context grows large, summarize completed work and drop intermediate steps
- Reference files by path instead of pasting full contents when possible

## Red flags (context is failing when)

- Agent invents APIs, functions, or flags that don't exist
- Output diverges from documented conventions
- Quality degrades as conversation lengthens
- Agent asks questions already answered in loaded context
- Same mistake repeats after correction

## Recovery

- `/clear` between unrelated tasks
- Re-load rules and relevant files after compaction
- Break large tasks into smaller conversations
- When quality drops: stop, summarize state, start fresh session
