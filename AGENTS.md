- Extreme concision in all interactions and commits. Sacrifice grammar for brevity.
- Always TDD: failing test first, even for vague asks ("fix bug" → reproducing test)
- At plan end: list unresolved questions
- Never commit or stage `.specs/` dirs unless user explicitly forces it (workflow artifacts from /hb:prd and /hb:plan)

## Before Coding
- State assumptions explicitly. Multiple interpretations → present all, don't pick silently
- Unclear → stop and ask before implementing
- If simpler approach exists, say so. Push back when warranted

## Surgical Changes
- Don't improve adjacent code, comments, or formatting
- Only remove orphans YOUR changes created
- Every changed line must trace to the request

## Verification (CRITICAL)
- For UI changes: take before/after screenshots, compare
- 8+ files → break into phases first
