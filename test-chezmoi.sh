#!/usr/bin/env bash
set -e

CHEZMOI_SOURCE="${CHEZMOI_SOURCE:-$PWD/chezmoi}"
ERRORS=0

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass() { echo -e "${GREEN}✓${NC} $1"; }
fail() { echo -e "${RED}✗${NC} $1"; ((ERRORS++)); }
warn() { echo -e "${YELLOW}⚠${NC}  $1"; }

echo "Testing Chezmoi Configuration"
echo "=============================="

# 1. Chezmoi health check
echo ""
echo "1) chezmoi doctor"
if chezmoi doctor --source "$CHEZMOI_SOURCE" >/dev/null 2>&1; then
    pass "health check passed"
else
    fail "health check failed"
fi

# 2. Template syntax (all .tmpl files, all depths)
echo ""
echo "2) template syntax"
TEMPLATE_ERRORS=0
while IFS= read -r -d '' tmpl; do
    if chezmoi execute-template --source "$CHEZMOI_SOURCE" < "$tmpl" >/dev/null 2>&1; then
        pass "$(basename "$tmpl")"
    else
        fail "$(basename "$tmpl") - template error"
        ((TEMPLATE_ERRORS++))
    fi
done < <(find "$CHEZMOI_SOURCE" -name "*.tmpl" -not -path "*/dot_claude/*" -print0)
[ $TEMPLATE_ERRORS -gt 0 ] && ((ERRORS++)) || true

# 3. Shell script syntax
echo ""
echo "3) shell script syntax"
SYNTAX_ERRORS=0
while IFS= read -r -d '' script; do
    if bash -n "$script" 2>/dev/null; then
        pass "$(basename "$script")"
    else
        fail "$(basename "$script") - syntax error"
        bash -n "$script" 2>&1 || true
        ((SYNTAX_ERRORS++))
    fi
done < <(find "$CHEZMOI_SOURCE" -name "*.sh" -o -name "*.sh.tmpl" -print0)
[ $SYNTAX_ERRORS -gt 0 ] && ((ERRORS++)) || true

# 4. Required files exist
echo ""
echo "4) required files"
REQUIRED_FILES=(
    "dot_gitconfig.tmpl"
    "dot_zshrc"
    "dot_aliases"
    "dot_config/ghostty/config"
    ".chezmoiignore"
    ".chezmoi.toml.tmpl"
)
for file in "${REQUIRED_FILES[@]}"; do
    if [ -e "$CHEZMOI_SOURCE/$file" ]; then
        pass "$file"
    else
        fail "$file missing"
    fi
done

# 5. Bootstrap scripts are executable
echo ""
echo "5) script permissions"
while IFS= read -r -d '' script; do
    if [ -x "$script" ]; then
        pass "$(basename "$script") is executable"
    else
        fail "$(basename "$script") not executable"
    fi
done < <(find "$CHEZMOI_SOURCE" -name "run_once_*.sh*" -print0)

# 6. chezmoi diff runs without error
echo ""
echo "6) chezmoi diff"
if chezmoi diff --source "$CHEZMOI_SOURCE" >/dev/null 2>&1; then
    pass "diff completed"
else
    fail "diff failed"
fi

# 7. No hardcoded secrets
echo ""
echo "7) secrets scan"
SECRET_PATTERNS="password|secret|token|api[_-]?key|private[_-]?key"
SECRETS=$(grep -r -i -E "$SECRET_PATTERNS" "$CHEZMOI_SOURCE" \
    --exclude-dir=dot_claude \
    --exclude="*.md" \
    --exclude=".chezmoiignore" \
    | grep -v "keybind\|keyboard\|keyword\|AWS_OKTA_MFA_DUO_DEVICE=token\|1password" || true)
if [ -n "$SECRETS" ]; then
    fail "potential secrets found:"
    echo "$SECRETS"
else
    pass "no secrets detected"
fi

# Summary
echo ""
echo "=============================="
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}All tests passed${NC}"
    exit 0
else
    echo -e "${RED}$ERRORS test(s) failed${NC}"
    exit 1
fi
