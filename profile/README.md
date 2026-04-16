# Blockwave Labs

Building onchain products.

[Website](https://blockwavelabs.io) | [GitHub](https://github.com/ziptalk)

## AI-Native Development

This organization uses AI-native coding standards. AI agents working in any Blockwave Labs repository should follow the rules defined in this repo.

### For AI Tool Users

| Tool | How to use |
|------|-----------|
| **Claude Code** | Install as plugin: `ziptalk/.github` |
| **Codex / Gemini CLI** | Copy `AGENTS.md` into your project root |
| **Cursor** | Copy `.cursorrules` into your project root |

Or run the setup script:

```bash
# Clone and install for your tool
git clone https://github.com/ziptalk/.github.git /tmp/ziptalk-standards
bash /tmp/ziptalk-standards/scripts/setup.sh <tool>
```

Where `<tool>` is one of: `claude`, `codex`, `cursor`, `all`

### What is Included

- Commit message format and conventions
- Branch naming rules
- Pull request standards and review checklist
- Code review process for AI agents
- Coding patterns (architecture, error handling, style, testing)

See [CLAUDE.md](./CLAUDE.md) for the full rules.
