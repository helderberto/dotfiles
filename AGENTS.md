- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- **English always** for all written artifacts: code, comments, commit messages, branch names, PR titles/bodies, GitHub issues, ADRs, plans, READMEs, and inline docs. Chat replies follow the user's language; written artifacts do not.
- Always TDD: red → green → refactor. Transform vague tasks into verifiable goals first ("fix bug" → "write reproducing test, make it pass")
- At plan end: list unresolved questions
- Never commit or stage `.tracerkit/` dirs unless user explicitly forces it (TracerKit artifacts)

## Before Coding
- State assumptions explicitly. Multiple interpretations → present all, don't pick silently
- Unclear → stop and ask before implementing
- If simpler approach exists, say so. Push back when warranted

## Surgical Changes
- Don't improve adjacent code, comments, or formatting
- Match existing style even if you'd do it differently
- Only remove orphans YOUR changes created
- Every changed line must trace to the request

## Ad-hoc Scripts
- Default to Node or shell for one-off scripts. Python under asdf can fail with "no version set" when the cwd has no `.tool-versions`. Reserve Python for tasks that genuinely need its stdlib (data crunching, scientific libs)
- For string manipulation, JSON munging, or PR/API automation: Node `<<'JS' ... JS` or POSIX shell pipelines are the safer default

## Verification (CRITICAL)
- Always run tests after implementation; fix all failures
- For UI changes: take before/after screenshots, compare

## Task Sizing

| Size | Files | Action |
|------|-------|--------|
| XS | 1 | Single function/fix |
| S | 1–2 | One component/endpoint |
| M | 3–5 | Complete feature slice |
| L | 5–8 | Multi-component feature |
| XL | 8+ | **Break down further** |

## Lifecycle → Agent Mapping

| Task type | Flow |
|-----------|------|
| Bug | debugger (prove-it) → test-auditor |
| New feature | junior-engineer (clarify) → plan → code-reviewer |
| Migration | parity-check → code-reviewer |
| Security concern | security-auditor → code-reviewer |
| Architecture question | frontend-architect |
| Capture insight | learner |
