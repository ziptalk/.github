---
name: pr-conventions
description: Use when creating pull requests, writing PR descriptions, or reviewing PRs. Enforces Blockwave Labs pull request format and review process.
---

# Pull Request Conventions

You MUST follow these PR rules in all Blockwave Labs repositories.

## Rules

- All changes MUST go through a Pull Request. Never push directly to main or dev.
- PR titles MUST clearly describe the changes in one line.
- PR titles follow the same type prefix as commits: `feat:`, `fix:`, `update:`, etc.

## PR Description

Every PR description MUST include:

1. **What changed** -- a brief summary of the changes made.
2. **Why** -- the motivation or problem being solved.
3. **How to test** -- steps to verify the changes work correctly.

## PR Template

```markdown
## What changed
[Brief summary of changes]

## Why
[Motivation or problem being solved]

## How to test
- [ ] Step 1
- [ ] Step 2
```

## PR Size

- Keep PRs small and focused. One logical change per PR.
- If a PR touches more than 10 files, consider splitting it.
- If a PR has more than 500 lines changed, it needs a strong justification.

## When Creating PRs

- Generate the title from the branch name and commit history.
- Write a clear description covering what, why, and how to test.
- Never create a PR with an empty description.

## When Reviewing PRs

- Check that the title and description follow the format above.
- Verify the PR is focused on a single concern.
- Flag PRs that are too large or mix unrelated changes.
- Verify that the "how to test" section is actionable.
