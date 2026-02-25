#!/usr/bin/env bash
# Backup current dotfiles before applying chezmoi

set -e

BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "📦 Creating backup..."
echo "Backup location: $BACKUP_DIR"
echo ""

mkdir -p "$BACKUP_DIR"

# Files to backup
FILES=(
    ".zshrc"
    ".aliases"
    ".exports"
    ".functions"
    ".dircolors"
    ".gitconfig"
    ".gitignore_global"
    ".gitattributes"
    ".gittemplates"
    ".tmux.conf"
    ".alacritty.toml"
    ".catppuccin.toml"
    ".editorconfig"
    ".tool-versions"
    ".config/ghostty"
    ".claude"
)

for file in "${FILES[@]}"; do
    if [ -e "$HOME/$file" ]; then
        # Create parent directories in backup
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"

        # Copy file (dereference symlinks)
        cp -rL "$HOME/$file" "$BACKUP_DIR/$file" 2>/dev/null || true
        echo "✓ Backed up ~/$file"
    fi
done

echo ""
echo "✅ Backup complete!"
echo "📁 Location: $BACKUP_DIR"
echo ""
echo "To restore: cp -r $BACKUP_DIR/* ~/"
