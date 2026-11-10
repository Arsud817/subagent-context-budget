#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DEST_ROOT=${1:-"${CODEX_HOME:-$HOME/.agents}/skills"}
DEST="$DEST_ROOT/subagent-context-budget"
SKILL_FILE="$SCRIPT_DIR/SKILL.md"

# Also support: curl -fsSL <raw install.sh URL> | sh
if [ ! -f "$SKILL_FILE" ]; then
  TMP_DIR=$(mktemp -d)
  trap 'rm -rf "$TMP_DIR"' EXIT HUP INT TERM
  curl -fsSL "https://raw.githubusercontent.com/Arsud817/subagent-context-budget/main/SKILL.md" -o "$TMP_DIR/SKILL.md"
  SKILL_FILE="$TMP_DIR/SKILL.md"
fi

mkdir -p "$DEST"
install -m 0644 "$SKILL_FILE" "$DEST/SKILL.md"
printf 'Installed subagent-context-budget to %s\n' "$DEST/SKILL.md"
printf 'Restart or refresh your agent runtime if it does not discover skills dynamically.\n'
