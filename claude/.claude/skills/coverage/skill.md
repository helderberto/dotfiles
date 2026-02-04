---
name: coverage
description: This skill should be used when the user asks to "check coverage", "/coverage", or wants to see which unstaged changes lack test coverage.
version: 1.0.0
---

# Coverage Check

## Context

Run in parallel:
- `git diff --name-only` - get unstaged files
- `git diff -U0 --no-color` - get changed line numbers

## Commands

Sequential:
1. `npm run test:ci` - vitest with coverage
2. `npm run coverage:report` - generate lcov/text reports

## Workflow

1. Get unstaged files and line ranges (parallel):
   - `git diff --name-only`
   - `git diff -U0 --no-color`
2. Run coverage:
   - `npm run test:ci`
   - `npm run coverage:report`
3. Parse `coverage/lcov.info`:
   - Find changed files (SF: lines)
   - Extract line coverage (DA: lines)
   - DA format: `DA:line_number,hit_count` (0=uncovered)
4. Map changed lines to coverage:
   - Match file paths
   - Check hit count for changed line numbers
   - Collect uncovered lines
5. Report:
   - File:line_number for uncovered changes
   - Summary: X/Y changed lines covered

## lcov Format

Parse `coverage/lcov.info`:
```
SF:src/utils/helper.ts
DA:10,1    # line 10, covered (hit 1 time)
DA:11,0    # line 11, NOT covered
DA:12,5    # line 12, covered (hit 5 times)
end_of_record
SF:src/another.ts
...
```

Key:
- `SF:` - source file path
- `DA:line,hits` - line coverage (0 = uncovered)
- Match SF paths to git diff file paths

## Rules

- Only analyze unstaged changes (`git diff`)
- Use sequential commands: `test:ci` then `coverage:report`
- Parse lcov.info for coverage data
- Report uncovered lines: `file.ts:42`
- Ignore files without coverage data (non-code files)
