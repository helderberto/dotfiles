# Simplificacao dotfiles

## Mudancas

- [x] 1. Hardcodar `HOMEBREW_PREFIX="/opt/homebrew"` no `dot_zshrc` (remover `$(brew --prefix)`)
- [x] 2. Migrar aliases `docker-compose` -> `docker compose` no `dot_aliases`
- [x] 3. Remover `dot_dircolors` e referencia no `dot_zshrc` (lsd ignora dircolors)
- [x] 4. Verificar se workaround kitty keyboard no `dot_zshrc` ainda e necessario -- SIM, manter (safety net para TUI apps killed via Ctrl-C)
- [x] 5. Avaliar unificacao `test-chezmoi.sh` + `validate-setup.sh` -- unificado com flag `--post-apply`
- [x] 6. Revisar globs agressivos no `.gitignore` -- mantidos, apropriados para repo dotfiles
