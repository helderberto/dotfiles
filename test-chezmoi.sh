#!/usr/bin/env bash
# shellcheck disable=SC2088
set -e

CHEZMOI_SOURCE="${CHEZMOI_SOURCE:-$PWD}"
ERRORS=0
POST_APPLY=false
[[ "${1:-}" == "--post-apply" ]] && POST_APPLY=true

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
done < <(find "$CHEZMOI_SOURCE" -name "*.tmpl" \
    -not -path "*/dot_claude/*" \
    -not -path "*/claude/*" \
    -not -path "*/skills/*" \
    -not -path "*/.agents/*" \
    -not -path "*/.git/*" \
    -not -name ".chezmoi.toml.tmpl" \
    -not -path "*/.chezmoiscripts/*" \
    -print0)
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
done < <(find "$CHEZMOI_SOURCE" \( -name "*.sh" -o -name "*.sh.tmpl" \) \
    -not -path "*/.git/*" \
    -not -path "*/.github/*" \
    -not -path "*/.agents/*" \
    -not -path "*/dot_claude/*" \
    -not -path "*/.chezmoiscripts/*" \
    -print0)
[ $SYNTAX_ERRORS -gt 0 ] && ((ERRORS++)) || true

# 4. Lua syntax (neovim config)
echo ""
echo "4) lua syntax"
LUA_ERRORS=0
if command -v luajit >/dev/null 2>&1; then
    while IFS= read -r -d '' luafile; do
        relative="${luafile#"$CHEZMOI_SOURCE"/}"
        if luajit -bl "$luafile" /dev/null 2>/dev/null; then
            pass "$relative"
        else
            fail "$relative - syntax error"
            ((LUA_ERRORS++))
        fi
    done < <(find "$CHEZMOI_SOURCE/dot_config/nvim" -name "*.lua" -print0)
    [ $LUA_ERRORS -gt 0 ] && ((ERRORS++)) || true
else
    warn "luajit not found, skipping lua syntax checks"
fi

# 5. Required files exist
echo ""
echo "5) required files"
REQUIRED_FILES=(
    "dot_gitconfig.tmpl"
    "dot_zshrc"
    "dot_aliases"
    "dot_exports"
    "dot_tmux.conf"
    "dot_tool-versions"
    "dot_gitignore_global"
    "dot_gitattributes"
    "dot_gittemplates/commit"
    "dot_config/ghostty/config"
    "dot_config/nvim/init.lua"
    "Brewfile"
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

# 6. Bootstrap scripts are executable
echo ""
echo "6) script permissions"
while IFS= read -r -d '' script; do
    if [ -x "$script" ]; then
        pass "$(basename "$script") is executable"
    else
        fail "$(basename "$script") not executable"
    fi
done < <(find "$CHEZMOI_SOURCE" -name "run_once_*.sh*" -print0)

# 7. No hardcoded secrets
echo ""
echo "7) secrets scan"
SECRET_PATTERNS="password|secret|token|api[_-]?key|private[_-]?key"
SECRETS=$(grep -r -i -E "$SECRET_PATTERNS" "$CHEZMOI_SOURCE" \
    --exclude-dir=dot_claude \
    --exclude-dir=.claude \
    --exclude-dir=claude \
    --exclude-dir=skills \
    --exclude-dir=.agents \
    --exclude-dir=.chezmoiscripts \
    --exclude-dir=.github \
    --exclude-dir=nvim \
    --exclude-dir=.git \
    --exclude="*.md" \
    --exclude=".chezmoiignore" \
    --exclude=".gitignore" \
    --exclude="test-chezmoi.sh" \
    | grep -v "keybind\|keyboard\|keyword\|AWS_OKTA_MFA_DUO_DEVICE=token\|1password" || true)
if [ -n "$SECRETS" ]; then
    fail "potential secrets found:"
    echo "$SECRETS"
else
    pass "no secrets detected"
fi

# 8. Aliases reference only Brewfile-managed tools
echo ""
echo "8) alias-brewfile consistency"
BREW_TOOLS=$(grep -E '^brew "' "$CHEZMOI_SOURCE/Brewfile" | sed 's/brew "//;s/"//' || true)
CASK_TOOLS=$(grep -E '^cask "' "$CHEZMOI_SOURCE/Brewfile" | sed 's/cask "//;s/"//' || true)
ALL_BREW="$BREW_TOOLS"$'\n'"$CASK_TOOLS"
for tool in lsd lazygit; do
    if echo "$ALL_BREW" | grep -q "^${tool}$"; then
        pass "$tool in Brewfile"
    else
        fail "$tool used in aliases but missing from Brewfile"
    fi
done

# 9. Post-apply environment validation
if $POST_APPLY; then
    echo ""
    echo "9) post-apply validation"

    # Git configuration
    if git config --get user.name >/dev/null 2>&1; then
        pass "git user.name: $(git config --get user.name)"
    else
        fail "git user.name not set"
    fi
    if git config --get user.email >/dev/null 2>&1; then
        pass "git user.email: $(git config --get user.email)"
    else
        fail "git user.email not set"
    fi

    # Shell
    if [ "$SHELL" = "/bin/zsh" ]; then
        pass "zsh is default shell"
    else
        fail "default shell: $SHELL (expected /bin/zsh)"
    fi

    # Aliases file
    if [ -f "$HOME/.aliases" ]; then
        pass "~/.aliases present"
    else
        fail "~/.aliases not found"
    fi

    # Key tools (all referenced in configs)
    for tool in git nvim tmux fzf brew lsd lazygit z.sh; do
        if [ "$tool" = "z.sh" ]; then
            if [ -f "/opt/homebrew/etc/profile.d/z.sh" ]; then
                pass "z.sh plugin present"
            else
                fail "z.sh plugin missing"
            fi
        elif command -v "$tool" >/dev/null 2>&1; then
            pass "$tool available"
        else
            fail "$tool not found"
        fi
    done

    # Zsh plugin paths (referenced in dot_zshrc)
    ZSH_PLUGINS=(
        "/opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme"
        "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        "/opt/homebrew/share/zsh-completions"
        "/opt/homebrew/opt/asdf/libexec/asdf.sh"
    )
    for plugin in "${ZSH_PLUGINS[@]}"; do
        if [ -e "$plugin" ]; then
            pass "$(basename "$plugin")"
        else
            fail "$(basename "$plugin") missing at $plugin"
        fi
    done

    # Git support files (referenced in dot_gitconfig.tmpl)
    for file in ~/.gitignore_global ~/.gitattributes ~/.gittemplates/commit; do
        if [ -e "$file" ]; then
            pass "$(basename "$file") present"
        else
            fail "$file missing"
        fi
    done

    # TPM (tmux plugin manager)
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        pass "TPM installed"
    else
        fail "TPM missing (~/.tmux/plugins/tpm)"
    fi

    # Workspace
    if [ -d "$HOME/workspace" ]; then
        pass "~/workspace exists"
    else
        fail "~/workspace missing"
    fi
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
