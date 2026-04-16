# AI-Native .github Repository -- Design Spec

## Goal

Transform `ziptalk/.github` from a static guideline doc into a multi-tool
AI agent plugin. One repo, three config file names, same content. Internal
team enforcement first, publicly forkable.

## Distribution Model

GitHub's `.github` repo does NOT auto-distribute custom files to org repos.
Distribution works via:

- **Claude Code**: install as plugin `"ziptalk/.github"` -- reads CLAUDE.md
  and skills/ directory
- **Codex / Gemini CLI**: copy AGENTS.md into project root
- **Cursor**: copy .cursorrules into project root
- **setup.sh**: one command copies the right file into any project

## Repo Structure

```
ziptalk/.github/
  .claude-plugin/
    plugin.json                 Claude Code plugin manifest (v1.0.0)
  .cursor-plugin/
    plugin.json                 Cursor plugin manifest
  profile/README.md             Human-facing org profile
  CLAUDE.md                     Main rules file (source of truth)
  AGENTS.md                     Self-contained copy for Codex/Gemini
  .cursorrules                  Self-contained copy for Cursor
  skills/
    commit-conventions/SKILL.md
    branch-conventions/SKILL.md
    pr-conventions/SKILL.md
    code-review/SKILL.md
    coding-patterns/SKILL.md
  scripts/
    setup.sh                    Copies config into a target project
    sync.sh                     Rebuilds AGENTS.md + .cursorrules from CLAUDE.md
  docs/
    specs/                      Design documents
```

## File Sync

CLAUDE.md is the single source of truth. AGENTS.md and .cursorrules are
derived files. When CLAUDE.md changes, run `scripts/sync.sh` to rebuild.

- AGENTS.md: direct copy of CLAUDE.md
- .cursorrules: CLAUDE.md with markdown bold syntax stripped

Not symlinks -- GitHub renders symlinks as raw text on github.com.

## Plugin Architecture

Claude Code plugin uses skills/ directory (not rules/). Each skill has a
SKILL.md with YAML frontmatter defining when it triggers. Skills fire
based on description matching against user intent:

- commit-conventions: triggers on commit creation, message writing
- branch-conventions: triggers on branch creation, naming
- pr-conventions: triggers on PR creation, description writing
- code-review: triggers on code review, PR evaluation
- coding-patterns: triggers on code writing, implementation, refactoring

## Content: CLAUDE.md

Written as imperative directives. Sections:

1. Identity -- "You are working in a Blockwave Labs repository."
2. Commit Rules -- format, types, examples
3. Branch Rules -- format, types, examples
4. Pull Request Rules -- title, description, size
5. Code Review -- checklist, comment rules, approval criteria
6. Coding Patterns -- architecture, error handling, style, testing
7. Repository Naming -- format, examples

Self-contained. No cross-references to rules/ files.

## Content: profile/README.md

Human-facing org profile:
- One-line description of Blockwave Labs
- Installation table for each AI tool
- Setup script usage
- List of what standards are included
- Link to CLAUDE.md for full rules

## Out of Scope (v1)

- GitHub Actions workflows
- Issue/PR templates
- Language-specific rules
- Auto-generation / templating
- Pre-commit hooks for sync enforcement
