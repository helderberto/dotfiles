---
name: safe-repo
description: This skill should be used when the user asks to "check for sensitive data", "/safe-repo", or wants to verify no company/credential data is in the repository.
version: 1.0.0
---

# Safe Repository Check

## Context

Security audit for sensitive data in repository. Check for credentials, API keys, company-specific information, and PII.

## Workflow

1. Get tracked files only:
   - `git ls-files` - only search files committed to repo
   - Avoids false positives from local gitignored files

2. Search tracked files for credential patterns (parallel):
   - API keys: `git ls-files | xargs grep -i -E "(api[_-]?key|api[_-]?secret|access[_-]?token)" 2>/dev/null`
   - Passwords: `git ls-files | xargs grep -i -E "(password|passwd|pwd)['\"]?\s*[:=]" 2>/dev/null`
   - Private keys: `git ls-files | grep -E "\.(pem|key)$|_rsa"`
   - Tokens: `git ls-files | xargs grep -i -E "(bearer|token|secret)['\"]?\s*[:=]\s*['\"][^'\"]{20,}" 2>/dev/null`
   - AWS: `git ls-files | xargs grep -E "AKIA[0-9A-Z]{16}" 2>/dev/null`

3. Check for sensitive tracked files:
   - `.env` files: `git ls-files | grep "\.env" | grep -v "\.env\.example"`
   - Secrets: `git ls-files | grep -i -E "(secret|credential)"`

4. Analyze git history for removed secrets:
   - `git log --all --full-history --oneline -- "*.env" "*.pem" "*.key" "*secret*" "*credential*"`

5. Review `.gitignore`:
   - Verify sensitive patterns are ignored

## Report Format

### If Issues Found
List each finding:
- `file:line` - description of issue
- Recommend: move to external files, add to .gitignore, rotate credentials

### If Clean
Use this assessment:

**Repository Security Assessment**

From an offensive security perspective, this repository provides no credential-based attack surface. The user demonstrates security awareness by:
- Storing secrets in external files
- Never committing those files to version control
- Cleaning up unused references

Repository is safe for public exposure.

## Rules

- **Only check git-tracked files** (`git ls-files`) - ignore local configs
- Check current tracked files AND git history
- Filter false positives: minified JS, node_modules, test fixtures, docs
- Verify `.gitignore` covers sensitive patterns
- Report tracked files with secrets and historical commits
- Never output actual secret values in report
