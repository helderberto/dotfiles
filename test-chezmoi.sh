#!/usr/bin/env bash
# shellcheck disable=SC2088,SC2015
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
fail() { echo -e "${RED}✗${NC} $1"; ERRORS=$((ERRORS+1)); }
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
        TEMPLATE_ERRORS=$((TEMPLATE_ERRORS+1))
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
[ $TEMPLATE_ERRORS -gt 0 ] && ERRORS=$((ERRORS+1)) || true

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
        SYNTAX_ERRORS=$((SYNTAX_ERRORS+1))
    fi
done < <(find "$CHEZMOI_SOURCE" \( -name "*.sh" -o -name "*.sh.tmpl" \) \
    -not -path "*/.git/*" \
    -not -path "*/.github/*" \
    -not -path "*/.agents/*" \
    -not -path "*/dot_claude/*" \
    -not -path "*/.chezmoiscripts/*" \
    -print0)
[ $SYNTAX_ERRORS -gt 0 ] && ERRORS=$((ERRORS+1)) || true

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
            LUA_ERRORS=$((LUA_ERRORS+1))
        fi
    done < <(find "$CHEZMOI_SOURCE/dot_config/nvim" -name "*.lua" -print0)
    [ $LUA_ERRORS -gt 0 ] && ERRORS=$((ERRORS+1)) || true
else
    warn "luajit not found, skipping lua syntax checks"
fi

# 5. Required files exist
echo ""
echo "5) required files"
REQUIRED_FILES=(
    "dot_gitconfig"
    "dot_zshrc"
    "dot_aliases"
    "dot_exports"
    "dot_tmux.conf"
    "dot_tool-versions"
    "dot_gitignore_global"
    "dot_gitattributes"
    "dot_gittemplates/commit"
    "dot_config/ghostty/config"
    "dot_p10k.zsh"
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
    | grep -v "keybind\|keyboard\|keyword\|1password" || true)
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
    for tool in git nvim tmux fzf brew lsd lazygit asdf z.sh; do
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
    )
    for plugin in "${ZSH_PLUGINS[@]}"; do
        if [ -e "$plugin" ]; then
            pass "$(basename "$plugin")"
        else
            fail "$(basename "$plugin") missing at $plugin"
        fi
    done

    # Git support files (referenced in dot_gitconfig)
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

    while read -r _ _ domain key type value; do
        expected="$value"
        [ "$type" = "-bool" ] && { [ "$value" = true ] && expected=1 || expected=0; }
        actual=$(defaults read "$domain" "$key" 2>/dev/null || echo unset)
        [ "$actual" = "$expected" ] && pass "$domain $key" || fail "$domain $key is $actual, expected $expected"
    done < <(grep '^defaults write' "$CHEZMOI_SOURCE/.chezmoiscripts/run_onchange_after_macos.sh")
fi

# 10. Content asserts (regression guards for hardcoded values)
echo ""
echo "10) content asserts"

GITCONFIG="$CHEZMOI_SOURCE/dot_gitconfig"
if grep -q "name = Helder Burato Berto" "$GITCONFIG" && \
   grep -q "email = helder.burato@gmail.com" "$GITCONFIG"; then
    pass "dot_gitconfig has expected name/email"
else
    fail "dot_gitconfig missing expected name/email"
fi

if ! grep -q "{{" "$GITCONFIG"; then
    pass "dot_gitconfig has no template syntax"
else
    fail "dot_gitconfig has stray template syntax"
fi

if ! grep -q "^\[data\]" "$CHEZMOI_SOURCE/.chezmoi.toml.tmpl"; then
    pass ".chezmoi.toml.tmpl has no dead [data] section"
else
    fail ".chezmoi.toml.tmpl still has [data] section"
fi

# 11. Template matrix (env-conditional rendering)
echo ""
echo "11) template matrix"

SSH_TMPL="$CHEZMOI_SOURCE/.chezmoiscripts/run_once_after_ssh.sh.tmpl"
MATRIX_TMP=$(mktemp -d)
trap 'rm -rf "$MATRIX_TMP"' EXIT
cp "$SSH_TMPL" "$MATRIX_TMP/ssh.tmpl"
ssh_with_ci=$(CI=1 chezmoi execute-template --source "$MATRIX_TMP" < "$MATRIX_TMP/ssh.tmpl" 2>/dev/null || true)
ssh_no_ci=$(env -u CI chezmoi execute-template --source "$MATRIX_TMP" < "$MATRIX_TMP/ssh.tmpl" 2>/dev/null || true)

if ! echo "$ssh_with_ci" | grep -q "ssh-keygen"; then
    pass "ssh script skips keygen when CI=1"
else
    fail "ssh script still renders keygen with CI=1"
fi

if echo "$ssh_no_ci" | grep -q "ssh-keygen"; then
    pass "ssh script includes keygen when CI unset"
else
    fail "ssh script missing keygen when CI unset"
fi

# 12. Render determinism (proxy for idempotency without full apply)
echo ""
echo "12) render determinism"

render_all() {
    find "$CHEZMOI_SOURCE" -name "*.tmpl" \
        -not -path "*/dot_claude/*" \
        -not -path "*/claude/*" \
        -not -path "*/skills/*" \
        -not -path "*/.agents/*" \
        -not -path "*/.git/*" \
        -not -name ".chezmoi.toml.tmpl" \
        -not -path "*/.chezmoiscripts/*" \
        -print0 | sort -z | while IFS= read -r -d '' tmpl; do
            chezmoi execute-template --source "$CHEZMOI_SOURCE" < "$tmpl" 2>/dev/null || true
        done
}

hash1=$(render_all | shasum | awk '{print $1}')
hash2=$(render_all | shasum | awk '{print $1}')
if [ "$hash1" = "$hash2" ] && [ -n "$hash1" ]; then
    pass "template rendering is deterministic"
else
    fail "template rendering differs between runs ($hash1 vs $hash2)"
fi

# 13. Brewfile covers apps and configs on a fresh machine
echo ""
echo "13) brewfile coverage"

BREWFILE="$CHEZMOI_SOURCE/Brewfile"
for entry in 'cask "font-jetbrains-mono-nerd-font"' 'cask "shottr"' 'cask "deepl"' \
    'brew "gh"' 'brew "jq"' 'brew "shellcheck"' 'brew "tree"' 'brew "hyperfine"' 'brew "tig"' 'brew "pandoc"' \
    'mas "The Unarchiver", id: 425424353' 'mas "Presentify", id: 1507246666'; do
    if grep -qF "$entry" "$BREWFILE"; then
        pass "$entry"
    else
        fail "Brewfile missing $entry"
    fi
done

if ! grep -rqi "cursor" "$BREWFILE" "$CHEZMOI_SOURCE/.chezmoiscripts"; then
    pass "no cursor references"
else
    fail "cursor still referenced"
fi

PACKAGES_TMPL="$CHEZMOI_SOURCE/.chezmoiscripts/run_onchange_before_packages.sh.tmpl"
if grep -qF '{{ include "Brewfile" | sha256sum }}' "$PACKAGES_TMPL" 2>/dev/null; then
    pass "packages script reruns on Brewfile change"
else
    fail "packages script not keyed on Brewfile hash"
fi

ASDF_TMPL="$CHEZMOI_SOURCE/.chezmoiscripts/run_onchange_after_asdf.sh.tmpl"
if grep -qF '{{ include "dot_tool-versions" | sha256sum }}' "$ASDF_TMPL" 2>/dev/null && \
   grep -qF "done < \"\$HOME/.tool-versions\"" "$ASDF_TMPL"; then
    pass "asdf script adds plugins from .tool-versions"
else
    fail "asdf script not driven by .tool-versions"
fi

! grep -q '^cask "claude' "$BREWFILE" && pass "claude installed natively, not via brew" || fail "claude cask in Brewfile"

grep -q '^defaults write' "$CHEZMOI_SOURCE/.chezmoiscripts/run_onchange_after_macos.sh" 2>/dev/null && pass "macos defaults script present" || fail "macos defaults script missing"

[ ! -e "$CHEZMOI_SOURCE/.chezmoiscripts/run_once_after_mas.sh" ] && pass "mas script merged into Brewfile" || fail "mas script still present"

if grep -q "claude.ai/install.sh" "$CHEZMOI_SOURCE/.chezmoiscripts/run_once_after_claude-code.sh" 2>/dev/null; then
    pass "claude code installer script present"
else
    fail "claude code installer script missing"
fi

for script in run_onchange_before_packages.sh.tmpl run_onchange_after_asdf.sh.tmpl; do
    rendered=$(chezmoi execute-template --source "$CHEZMOI_SOURCE" < "$CHEZMOI_SOURCE/.chezmoiscripts/$script")
    if env -i HOME="$HOME" PATH=/usr/bin:/bin bash -c "$(echo "$rendered" | sed -n '/brew shellenv/p'); command -v brew" >/dev/null 2>&1; then
        pass "$script finds brew on a fresh PATH"
    else
        fail "$script can't find brew on a fresh PATH"
    fi
done

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
