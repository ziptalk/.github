#!/bin/bash
# sync.sh -- Rebuild AGENTS.md and .cursorrules from CLAUDE.md
# Run this after editing CLAUDE.md to keep all tool configs in sync.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

CLAUDE_MD="$ROOT_DIR/CLAUDE.md"
AGENTS_MD="$ROOT_DIR/AGENTS.md"
CURSORRULES="$ROOT_DIR/.cursorrules"

if [ ! -f "$CLAUDE_MD" ]; then
    echo "Error: CLAUDE.md not found at $CLAUDE_MD"
    exit 1
fi

# AGENTS.md is a direct copy (Codex and Gemini CLI read markdown the same way)
cp "$CLAUDE_MD" "$AGENTS_MD"
echo "Synced: AGENTS.md"

# .cursorrules strips markdown bold syntax for plain-text compatibility
sed 's/\*\*//g' "$CLAUDE_MD" > "$CURSORRULES"
echo "Synced: .cursorrules"

echo "Done. All tool configs are in sync with CLAUDE.md."
