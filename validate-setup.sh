#!/usr/bin/env bash
# Validate dotfiles setup after applying

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

ERRORS=0

echo "🔍 Validating Dotfiles Setup"
echo "============================="
echo ""

# Test git config
echo "1️⃣  Git configuration..."
if git config --get user.name >/dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} user.name: $(git config --get user.name)"
else
    echo -e "${RED}✗${NC} user.name not set"
    ((ERRORS++))
fi

if git config --get user.email >/dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} user.email: $(git config --get user.email)"
else
    echo -e "${RED}✗${NC} user.email not set"
    ((ERRORS++))
fi

# Test shell
echo ""
echo "2️⃣  Shell configuration..."
if [ "$SHELL" = "/bin/zsh" ]; then
    echo -e "${GREEN}✓${NC} ZSH is default shell"
else
    echo -e "${RED}✗${NC} Default shell: $SHELL (expected /bin/zsh)"
    ((ERRORS++))
fi

# Test aliases
echo ""
echo "3️⃣  Aliases..."
if alias g >/dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Git aliases loaded"
else
    echo -e "${RED}✗${NC} Aliases not loaded"
    ((ERRORS++))
fi

# Test key tools
echo ""
echo "4️⃣  Key tools..."
TOOLS=("git" "nvim" "tmux" "fzf" "brew")
for tool in "${TOOLS[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} $tool"
    else
        echo -e "${RED}✗${NC} $tool not found"
        ((ERRORS++))
    fi
done

# Test workspace
echo ""
echo "5️⃣  Workspace directories..."
if [ -d "$HOME/workspace" ]; then
    echo -e "${GREEN}✓${NC} ~/workspace exists"
else
    echo -e "${RED}✗${NC} ~/workspace missing"
    ((ERRORS++))
fi

# Summary
echo ""
echo "============================="
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ Setup validated!${NC}"
    exit 0
else
    echo -e "${RED}❌ $ERRORS issue(s) found${NC}"
    exit 1
fi
