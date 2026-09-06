#!/usr/bin/env bash
# Build rocky-mode.skill (the uploadable package) from .claude/skills/rocky-mode.
#
# The archive must contain regular files only: claude.com rejects a zip that
# holds a symbolic link. Everything is copied with `cp -RL`, which dereferences
# links instead of preserving them, and the result is verified below.

set -euo pipefail

cd "$(dirname "$0")"

SKILL_DIR=".claude/skills/rocky-mode"
OUT="$PWD/rocky-mode.skill"

[ -f "$SKILL_DIR/SKILL.md" ] || { echo "no SKILL.md in $SKILL_DIR" >&2; exit 1; }

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir "$STAGE/rocky-mode"
cp -RL "$SKILL_DIR"/. "$STAGE/rocky-mode/"
find "$STAGE" -name '.DS_Store' -delete

rm -f "$OUT"
( cd "$STAGE" && zip -q -r -X "$OUT" rocky-mode )

if zipinfo "$OUT" | grep -q '^l'; then
    echo "refusing to ship: archive contains a symbolic link" >&2
    exit 1
fi

echo "built $OUT"
unzip -l "$OUT"
