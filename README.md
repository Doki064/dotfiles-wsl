# dotfiles-wsl

Personal dotfiles for a WSL2 environment that leans on Windows-side tooling
for SSH and commit signing.

## Layout

Files are stored without their leading dot; `install.sh` symlinks them into
place, so the repo stays the single source of truth.

| Repo path | Symlink target |
|---|---|
| `zsh/*` | `~/.zsh/.*` (zsh runs with `ZDOTDIR=~/.zsh`) |
| `zshenv` | `~/.zshenv` |
| `p10k.zsh` | `~/.p10k.zsh` |
| `gnupg/*` | `~/.gnupg/*` |
| `ssh/*` | `~/.ssh/*` |
| `gitconfig`, `gitignore`, `gitattributes` | `~/.gitconfig`, `~/.gitignore`, `~/.gitattributes` |
| `claude/rules/*` | `~/.claude/rules/*` (global Claude Code rules) |
| `config/mise/*` | `~/.config/mise/*` (mise tool versions) |

## Install

```sh
git clone git@github.com:Doki064/dotfiles-wsl.git
cd dotfiles-wsl
./install.sh
```

Do not run with `sudo`. Re-running is safe: existing links are replaced.

## Requirements

- WSL2 with zsh. The [zi](https://github.com/z-shell/zi) plugin manager
  installs itself on first shell start and pulls the plugins listed in
  `zsh/zshrc`.
- [mise](https://mise.jdx.dev) installs the CLI tools pinned in
  `config/mise/config.toml` (eza, fd, actionlint): `curl https://mise.run | sh`,
  then `mise install`.
- Windows-side tools for interop: Windows OpenSSH (`ssh.exe`, used by git via
  `core.sshCommand` and by the `ssh` alias), 1Password SSH commit signing
  (`op-ssh-sign-wsl.exe`), and `gh` for GitHub credentials.

## Extras

- `git-remove-forever.sh` — purge paths from a repository's entire history
  (requires [git-filter-repo](https://github.com/newren/git-filter-repo);
  run from a repo root).
- `~/.claude/rules/enterprise-context-no-leak.md` is deliberately left
  untracked: work-related rules stay out of this public repo.
