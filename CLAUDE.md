# CLAUDE.md

WSL2 dotfiles repo. Files are stored without their leading dot and symlinked
into `$HOME` by `install.sh` — the layout map is in README.md.

- The `$HOME` copies are symlinks into this repo; the repo is the single
  source of truth. After adding a new dotfile, add a `link`/`link_dir` call
  in `install.sh` and re-run it.
- Tooling split: zi (in `zsh/zshrc`) loads zsh plugins only; CLI tools
  (eza, fd, runtimes) belong in `config/mise/config.toml`, never in zi
  `gh-r` ices.
- WSL/Windows interop is deliberate: git uses Windows `ssh.exe`
  (`core.sshCommand`) and signs commits through 1Password's
  `op-ssh-sign-wsl.exe`. Do not "fix" these to Linux paths.
- This repo is public. Never commit secrets, private keys, or anything
  work/enterprise-related. `claude/rules/` holds global Claude Code rules;
  `enterprise-context-no-leak.md` intentionally stays untracked in
  `~/.claude/rules/`.
