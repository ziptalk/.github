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

# Root-level copies (for AI agents reading git directly)
cp "$SOURCE" "$ROOT_DIR/AGENTS.md"
cp "$SOURCE" "$ROOT_DIR/GEMINI.md"
sed 's/\*\*//g' "$SOURCE" > "$ROOT_DIR/.cursorrules"

# .cursor/rules modern format (add YAML frontmatter)
mkdir -p "$ROOT_DIR/.cursor/rules"
{
    echo '---'
    echo 'description: Blockwave Labs coding standards - commit, branch, PR conventions, code review, and coding patterns'
    echo 'alwaysApply: true'
    echo '---'
    echo ''
    sed 's/\*\*//g' "$SOURCE"
} > "$ROOT_DIR/.cursor/rules/blockwave-standards.mdc"

# Plugin directory copies (for Claude Code /plugin install)
cp "$SOURCE" "$PLUGIN_DIR/CLAUDE.md"
cp "$SOURCE" "$PLUGIN_DIR/AGENTS.md"
sed 's/\*\*//g' "$SOURCE" > "$PLUGIN_DIR/.cursorrules"

echo "Synced from CLAUDE.md:"
echo "  Root:   AGENTS.md, GEMINI.md, .cursorrules, .cursor/rules/blockwave-standards.mdc"
echo "  Plugin: CLAUDE.md, AGENTS.md, .cursorrules"
