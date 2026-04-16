#!/bin/bash
# setup.sh -- Install Blockwave Labs coding standards into a project.
#
# Usage:
#   bash setup.sh claude    # Copies CLAUDE.md
#   bash setup.sh codex     # Copies AGENTS.md
#   bash setup.sh cursor    # Copies .cursorrules
#   bash setup.sh all       # Copies all three

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="${2:-.}"

copy_file() {
    local src="$1"
    local dst="$2"
    if [ -f "$TARGET_DIR/$dst" ]; then
        echo "Warning: $dst already exists in $TARGET_DIR. Overwrite? [y/N]"
        read -r confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            echo "Skipped: $dst"
            return
        fi
    fi
    cp "$ROOT_DIR/$src" "$TARGET_DIR/$dst"
    echo "Installed: $dst"
}

case "${1:-}" in
    claude)
        copy_file "CLAUDE.md" "CLAUDE.md"
        ;;
    codex|gemini)
        copy_file "AGENTS.md" "AGENTS.md"
        ;;
    cursor)
        copy_file ".cursorrules" ".cursorrules"
        ;;
    all)
        copy_file "CLAUDE.md" "CLAUDE.md"
        copy_file "AGENTS.md" "AGENTS.md"
        copy_file ".cursorrules" ".cursorrules"
        ;;
    *)
        echo "Usage: bash setup.sh <tool> [target-dir]"
        echo ""
        echo "Tools:"
        echo "  claude    Copy CLAUDE.md"
        echo "  codex     Copy AGENTS.md"
        echo "  gemini    Copy AGENTS.md"
        echo "  cursor    Copy .cursorrules"
        echo "  all       Copy all config files"
        echo ""
        echo "Options:"
        echo "  target-dir    Directory to install into (default: current directory)"
        exit 1
        ;;
esac
