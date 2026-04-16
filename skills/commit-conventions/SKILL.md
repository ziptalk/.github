---
name: commit-conventions
description: Use when creating git commits, writing commit messages, or reviewing commit history. Enforces Blockwave Labs commit message format and conventions.
---

# Commit Conventions

You MUST follow these commit rules in all Blockwave Labs repositories.

## Format

```
type:description
```

- Lowercase letters and colons only.
- No space after the colon.
- Description is a brief, imperative summary of the change.

## Commit Types

| Type | When to use | Example |
|------|------------|---------|
| feat | New feature or capability | `feat:user authentication module` |
| fix | Bug fix | `fix:login issue with incorrect password handling` |
| update | Modify existing feature or file | `update:dashboard layout for better user experience` |
| remove | Delete feature or file | `remove:deprecated API endpoints` |
| refactor | Restructure code, no behavior change | `refactor:authentication module for better readability` |
| style | Formatting or style only, no logic change | `style:format code with Prettier` |

## Rules

- Always pick the most specific type. If you added a new endpoint, use `feat`, not `update`.
- If a commit does two things (e.g., fixes a bug AND refactors), split it into two commits.
- Include a brief body description if the summary alone does not explain the change.
- Never use generic messages like "fix bug", "update code", or "misc changes".
- The description must explain WHAT changed, not just repeat the type.

## When Reviewing Commits

- Flag commits that do not follow the `type:description` format.
- Flag commits that bundle unrelated changes.
- Flag vague descriptions that do not explain the change.
