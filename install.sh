#!/bin/sh
# Installs this repo's skills and commands into ~/.claude so they are
# available in every project, not just this one.
#
#   sh install.sh
#
# Re-running is safe: it overwrites its own files and leaves anything
# else in ~/.claude untouched.
set -eu

src=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dst="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

[ -d "$src/.claude/skills" ] || { echo "no .claude/skills next to $0" >&2; exit 1; }

mkdir -p "$dst/skills" "$dst/commands"
cp -R "$src/.claude/skills/." "$dst/skills/"
cp -R "$src/.claude/commands/." "$dst/commands/"

echo "installed $(ls "$dst/skills" | wc -l | tr -d ' ') skills and $(ls "$dst/commands" | wc -l | tr -d ' ') commands into $dst"
echo "restart Claude Code to pick them up."
