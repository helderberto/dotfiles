#!/usr/bin/env bash
# Test chezmoi configuration before applying

set -e

CHEZMOI_SOURCE="${CHEZMOI_SOURCE:-$PWD/chezmoi}"
ERRORS=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🧪 Testing Chezmoi Configuration"
echo "================================"
echo ""

# Test 1: Chezmoi doctor
echo "1️⃣  Running chezmoi doctor..."
if chezmoi doctor --source "$CHEZMOI_SOURCE" >/dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Chezmoi health check passed"
else
    echo -e "${RED}✗${NC} Chezmoi health check failed"
    ((ERRORS++))
fi

# Test 2: Template syntax
echo ""
echo "2️⃣  Validating template syntax..."
TEMPLATE_ERRORS=0
for tmpl in "$CHEZMOI_SOURCE"/*.tmpl; do
    if [ -f "$tmpl" ]; then
        if chezmoi execute-template --source "$CHEZMOI_SOURCE" < "$tmpl" >/dev/null 2>&1; then
            echo -e "${GREEN}✓${NC} $(basename "$tmpl")"
        else
            echo -e "${RED}✗${NC} $(basename "$tmpl") - template error"
            ((TEMPLATE_ERRORS++))
        fi
    fi
done
if [ $TEMPLATE_ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓${NC} All templates valid"
else
    echo -e "${RED}✗${NC} $TEMPLATE_ERRORS template(s) failed"
    ((ERRORS++))
fi

# Test 3: No secrets in source
echo ""
echo "3️⃣  Checking for secrets..."
SECRET_PATTERNS="password|secret|token|api[_-]?key|private[_-]?key"
if grep -r -i -E "$SECRET_PATTERNS" "$CHEZMOI_SOURCE" --exclude-dir=dot_claude \
    | grep -v "keybind\|keyboard\|keyword\|AWS_OKTA_MFA_DUO_DEVICE=token" >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠${NC}  Potential secrets found (review manually)"
    grep -r -i -E "$SECRET_PATTERNS" "$CHEZMOI_SOURCE" --exclude-dir=dot_claude \
        | grep -v "keybind\|keyboard\|keyword\|AWS_OKTA_MFA_DUO_DEVICE=token" || true
else
    echo -e "${GREEN}✓${NC} No secrets detected"
fi

# Test 4: Required files exist
echo ""
echo "4️⃣  Checking required files..."
REQUIRED_FILES=(
    "dot_gitconfig.tmpl"
    "dot_zshrc"
    "dot_aliases"
    "dot_config/ghostty/config"
    ".chezmoiignore"
)
MISSING=0
for file in "${REQUIRED_FILES[@]}"; do
    if [ -e "$CHEZMOI_SOURCE/$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${RED}✗${NC} $file missing"
        ((MISSING++))
    fi
done
if [ $MISSING -gt 0 ]; then
    ((ERRORS++))
fi

# Test 5: Bootstrap scripts are executable
echo ""
echo "5️⃣  Checking bootstrap scripts..."
for script in "$CHEZMOI_SOURCE"/run_once_*.sh*; do
    if [ -f "$script" ]; then
        if [ -x "$script" ]; then
            echo -e "${GREEN}✓${NC} $(basename "$script") is executable"
        else
            echo -e "${RED}✗${NC} $(basename "$script") not executable"
            ((ERRORS++))
        fi
    fi
done

# Test 6: Validate chezmoi diff runs
echo ""
echo "6️⃣  Testing chezmoi diff..."
if chezmoi diff --source "$CHEZMOI_SOURCE" >/dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Chezmoi diff completed"
else
    echo -e "${RED}✗${NC} Chezmoi diff failed"
    ((ERRORS++))
fi

# Test 7: Check for work-specific patterns
echo ""
echo "7️⃣  Checking for work data leaks..."
WORK_PATTERNS="corp|company"
if grep -r -i -E "$WORK_PATTERNS" "$CHEZMOI_SOURCE" --exclude="*.md" >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠${NC}  Found work patterns (review manually)"
    grep -r -i -E "$WORK_PATTERNS" "$CHEZMOI_SOURCE" --exclude="*.md" || true
else
    echo -e "${GREEN}✓${NC} No work patterns found"
fi

# Summary
echo ""
echo "================================"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All tests passed!${NC}"
    echo ""
    echo "Safe to apply with: make apply"
    exit 0
else
    echo -e "${RED}❌ $ERRORS test(s) failed${NC}"
    echo ""
    echo "Fix errors before applying"
    exit 1
fi
