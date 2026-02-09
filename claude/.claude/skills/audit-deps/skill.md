---
name: audit-deps
description: This skill should be used when the user asks to "audit dependencies", "/audit-deps", "check for vulnerabilities", or wants to check dependency health.
version: 1.0.0
---

# Dependency Audit

## Commands

Run in parallel:
- `npm audit` - security vulnerabilities
- `npm outdated` - outdated packages

## Workflow

1. Run security audit and outdated check
2. Report critical vulnerabilities with fix commands
3. List outdated packages (major vs minor/patch)
4. Check for unused deps: grep imports in src/

## Report

- Critical vulns: package + CVE + fix command
- Outdated: table of package/current/latest/type
- Unused: packages in package.json but not imported

## Rules

- Use `npm audit`, never `npx`
- Focus on actionable items
- Prioritize: security > major updates > unused > minor updates
