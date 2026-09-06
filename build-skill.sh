#!/usr/bin/env bash
# Regenerate SKILL.md and rocky-mode.skill from the canonical skill file.
#
# The skill has to exist at two paths and neither may be a symbolic link:
#
#   .claude/skills/rocky-mode/SKILL.md  CANONICAL. Claude Code only discovers
#                                       skills under .claude/skills/<name>/ and
#                                       has no setting for extra directories.
#                                       This is the file to edit.
#   SKILL.md                            GENERATED. claude.com requires SKILL.md
#                                       at the top level of the uploaded
#                                       archive. Do not edit; it gets
#                                       overwritten.
#
# claude.com rejects any archive containing a symlink, so the file is duplicated
# rather than linked and this script is what keeps the copy current.
#
#   ./build-skill.sh          regenerate SKILL.md and rocky-mode.skill
#   ./build-skill.sh --check  fail if the copies differ; changes nothing.
#                             .githooks/pre-commit runs this.

set -euo pipefail

cd "$(dirname "$0")"

CANONICAL=".claude/skills/rocky-mode/SKILL.md"
GENERATED="SKILL.md"
OUT="$PWD/rocky-mode.skill"

[ -f "$CANONICAL" ] || { echo "missing $CANONICAL" >&2; exit 1; }

if [ "${1:-}" = "--check" ]; then
    if [ -f "$GENERATED" ] && cmp -s "$CANONICAL" "$GENERATED"; then
        exit 0
    fi
    echo "$GENERATED is out of date." >&2
    echo "Edit $CANONICAL (never $GENERATED), then run ./build-skill.sh" >&2
    exit 1
fi

cp "$CANONICAL" "$GENERATED"

# rocky-mode.skill is the single-file alternative to uploading the repo archive.
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir "$STAGE/rocky-mode"
cp "$CANONICAL" "$STAGE/rocky-mode/SKILL.md"

rm -f "$OUT"
( cd "$STAGE" && zip -q -r -X "$OUT" rocky-mode )

if zipinfo "$OUT" | grep -q '^l'; then
    echo "refusing to ship: archive contains a symbolic link" >&2
    exit 1
fi

echo "regenerated $GENERATED and rocky-mode.skill from $CANONICAL"
