---
name: branch-conventions
description: Use when creating git branches, switching branches, or reviewing branch naming. Enforces Blockwave Labs branch naming format and conventions.
---

# Branch Conventions

You MUST follow these branch rules in all Blockwave Labs repositories.

## Format

```
type/branch-content
```

- Lowercase letters, hyphens, and forward slashes only.
- The content after the slash describes the work in kebab-case.

## Branch Types

| Type | When to use | Example |
|------|------------|---------|
| feat | New feature development | `feat/user-authentication` |
| fix | Bug fix | `fix/login-password-issue` |
| update | Modify existing feature | `update/dashboard-layout` |
| remove | Remove feature or file | `remove/deprecated-api` |
| refactor | Code restructuring | `refactor/authentication-module` |
| style | Formatting or style changes | `style/code-format` |

## Rules

- Always branch from `main` unless a `dev` branch exists, in which case branch from `dev`.
- Merge back to the branch you branched from upon completion.
- Branch names must be descriptive enough to understand the work without reading the code.
- Never reuse a branch name after it has been merged or deleted.
- One logical unit of work per branch. Do not mix unrelated changes.

## When Creating Branches

- Suggest the correct branch type based on the user's description of work.
- If the user says "fix the login bug", create `fix/login-bug`, not `feat/login-bug`.
- If the scope is unclear, ask before creating the branch.
