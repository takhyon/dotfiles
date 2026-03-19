# dotfiles

Personal dotfiles for macOS with zsh + oh-my-zsh.

## Setup

```bash
git clone --recursive <repo-url> ~/.dotfiles
cd ~/.dotfiles
./symlinks.sh
```

If already cloned without `--recursive`:

```bash
git submodule update --init
```

To update vim plugins:

```bash
git submodule update --remote
```

## What's Included

| File | Purpose |
|------|---------|
| `zshrc` | Main zsh config — oh-my-zsh setup, sources modular configs |
| `zsh/aliases.zsh` | Shell aliases |
| `zsh/proxy.zsh` | Corporate proxy management (`proxy_enable`, `proxy_disable`, `proxy_status`, `proxy_authenticate`) |
| `gitconfig` | Git config, aliases, and color settings |
| `vimrc` | Vim config with solarized theme |
| `vim/` | Vim runtime — syntax, indent, ftplugin for json, ps1, ruby + vim-terraform plugin |
| `authproxy-config` | Auth proxy endpoint configuration |
| `packaged-goods` | Declarative Homebrew package sync tool |
| `packages.txt` | Homebrew package manifest |
| `_packaged-goods` | Zsh completions for packaged-goods |
| `symlinks.sh` | Symlinks dotfiles into `~` |

## Homebrew Packages

Edit `packages.txt` then run:

```bash
packaged-goods              # sync packages
packaged-goods --dry-run    # preview changes
packaged-goods --upgrade    # upgrade all
```
