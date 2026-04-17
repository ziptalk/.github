#!/bin/bash
# sync.sh -- Rebuild all agent config files from the plugin CLAUDE.md
# Run this after editing plugins/blockwave-coding-standards/CLAUDE.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
PLUGIN_DIR="$ROOT_DIR/plugins/blockwave-coding-standards"
SOURCE="$PLUGIN_DIR/CLAUDE.md"

if [ ! -f "$SOURCE" ]; then
    echo "Error: CLAUDE.md not found at $SOURCE"
    exit 1
fi

# Plugin directory copies
cp "$SOURCE" "$PLUGIN_DIR/AGENTS.md"
sed 's/\*\*//g' "$SOURCE" > "$PLUGIN_DIR/.cursorrules"

# Root copies (for AI agents reading git directly)
cp "$SOURCE" "$ROOT_DIR/CLAUDE.md"
cp "$SOURCE" "$ROOT_DIR/AGENTS.md"
sed 's/\*\*//g' "$SOURCE" > "$ROOT_DIR/.cursorrules"

echo "Synced all agent config files from plugins/blockwave-coding-standards/CLAUDE.md"
echo "  Root:   CLAUDE.md, AGENTS.md, .cursorrules"
echo "  Plugin: CLAUDE.md, AGENTS.md, .cursorrules"
