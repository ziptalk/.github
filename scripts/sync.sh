#!/bin/bash
# sync.sh -- Rebuild all agent config files from CLAUDE.md (source of truth)
# Run this after editing CLAUDE.md at the repo root.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
PLUGIN_DIR="$ROOT_DIR/plugins/blockwave-coding-standards"
SOURCE="$ROOT_DIR/CLAUDE.md"

if [ ! -f "$SOURCE" ]; then
    echo "Error: CLAUDE.md not found at $SOURCE"
    exit 1
fi

# Root-level AGENTS.md (for Codex, Gemini CLI, Cursor reading git directly)
cp "$SOURCE" "$ROOT_DIR/AGENTS.md"

# Plugin directory copies (for Claude Code /plugin install)
cp "$SOURCE" "$PLUGIN_DIR/CLAUDE.md"
cp "$SOURCE" "$PLUGIN_DIR/AGENTS.md"

echo "Synced from CLAUDE.md:"
echo "  Root:   AGENTS.md"
echo "  Plugin: CLAUDE.md, AGENTS.md"
