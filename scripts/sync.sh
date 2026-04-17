#!/bin/bash
# sync.sh -- Rebuild AGENTS.md and .cursorrules from CLAUDE.md
# Run this after editing CLAUDE.md to keep all tool configs in sync.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
PLUGIN_DIR="$ROOT_DIR/plugins/blockwave-coding-standards"

CLAUDE_MD="$PLUGIN_DIR/CLAUDE.md"
AGENTS_MD="$PLUGIN_DIR/AGENTS.md"
CURSORRULES="$PLUGIN_DIR/.cursorrules"

if [ ! -f "$CLAUDE_MD" ]; then
    echo "Error: CLAUDE.md not found at $CLAUDE_MD"
    exit 1
fi

cp "$CLAUDE_MD" "$AGENTS_MD"
echo "Synced: AGENTS.md"

sed 's/\*\*//g' "$CLAUDE_MD" > "$CURSORRULES"
echo "Synced: .cursorrules"

echo "Done. All tool configs are in sync with CLAUDE.md."
