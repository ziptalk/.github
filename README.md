# Blockwave Labs Coding Standards

This repository contains the coding standards for all Blockwave Labs projects. It serves two purposes:

1. **For developers** -- read this document for the full coding guidelines.
2. **For AI agents** -- install as a plugin or copy the agent config files into your project.

---

## Table of Contents

- [Repository Naming](#repository-naming)
- [Commit Conventions](#commit-conventions)
- [Branch Conventions](#branch-conventions)
- [Pull Request Conventions](#pull-request-conventions)
- [Code Review Process](#code-review-process)
- [Coding Patterns](#coding-patterns)
- [AI Agent Installation](#ai-agent-installation)

---

## Repository Naming

Repositories follow the format `name-content` using lowercase letters and dashes.

| Format | Example |
|--------|---------|
| `name-content` | `nexton-backend` |
| `name-content` | `jeff-marketmaking` |

Every repository must include a README that describes its purpose.
Default visibility is private.

---

## Commit Conventions

Commits follow the format `type:description` using lowercase letters and a colon separator with no space.

### Commit Types

| Type | Purpose | Example |
|------|---------|---------|
| `feat` | New feature or capability | `feat:user authentication module` |
| `fix` | Bug fix | `fix:login issue with incorrect password handling` |
| `update` | Modify an existing feature or file | `update:dashboard layout for better user experience` |
| `remove` | Remove a feature or file | `remove:deprecated API endpoints` |
| `refactor` | Restructure code without changing behavior | `refactor:authentication module for better readability` |
| `style` | Formatting or style changes only | `style:format code with Prettier` |

### Guidelines

- Use the most specific type. Adding a new endpoint is `feat`, not `update`.
- Each commit should contain one logical change. If a commit does two unrelated things, split it.
- Avoid generic messages like "fix bug", "update code", or "misc changes".
- Add a commit body when the one-line summary is not enough to explain the change.

---

## Branch Conventions

Branches follow the format `type/branch-content` using lowercase letters with a forward slash separator and kebab-case content.

### Branch Types

| Type | Purpose | Example |
|------|---------|---------|
| `feat` | New feature | `feat/user-authentication` |
| `fix` | Bug fix | `fix/login-password-issue` |
| `update` | Modify existing feature | `update/dashboard-layout` |
| `remove` | Remove feature or file | `remove/deprecated-api` |
| `refactor` | Code restructuring | `refactor/authentication-module` |
| `style` | Formatting or style changes | `style/code-format` |

### Guidelines

- Branch from `main` by default. If a `dev` branch exists, branch from `dev`.
- Merge back into the branch you branched from when the work is complete.
- Each branch should contain one logical unit of work.
- Do not reuse branch names after they have been merged or deleted.

---

## Pull Request Conventions

All code changes go through a Pull Request. No direct pushes to `main` or `dev`.

### PR Title

Use the same type prefix as commits: `feat:`, `fix:`, `update:`, `remove:`, `refactor:`, `style:`.

### PR Description

Every PR must include three sections:

1. **What changed** -- a summary of the changes.
2. **Why** -- the motivation or problem being solved.
3. **How to test** -- steps to verify the changes work.

### PR Description Template

```markdown
## What changed
[Brief summary of changes]

## Why
[Motivation or problem being solved]

## How to test
- [ ] Step 1
- [ ] Step 2
```

### PR Size

- Keep PRs small and focused. One logical change per PR.
- PRs touching more than 10 files should be split if possible.
- PRs with more than 500 lines changed need a strong justification.

---

## Code Review Process

All PRs require code review before merging.

### Review Checklist

Reviewers should check the following in order:

1. **Correctness** -- Does the code do what the PR says? Are edge cases handled?
2. **Security** -- No hardcoded secrets or credentials. User input is validated. No injection vulnerabilities.
3. **Architecture** -- Does the change fit existing patterns? No unnecessary duplication or over-engineering.
4. **Readability** -- Can a new team member understand this without extra context? Are names clear?
5. **Testing** -- Are there tests for new behavior? Do tests cover edge cases?
6. **Performance** -- No N+1 queries, unnecessary loops, or missing caching where needed.

### Commenting

- Be specific. Point to the line and explain what is wrong and why.
- Always suggest a fix alongside the criticism.
- Mark blocking issues as **MUST** and optional suggestions as **CONSIDER**.
- One comment per issue. Do not bundle unrelated feedback.

### Approval Criteria

- All blocking issues are resolved.
- Tests pass.
- PR follows commit, branch, and PR conventions.
- No security vulnerabilities.

---

## Coding Patterns

These patterns apply across all languages and frameworks.

### Architecture

- **Single source of truth.** Never duplicate state. One source, everything else reads from it.
- **No over-engineering.** Do not build for scenarios nobody asked for. Simple and correct beats elaborate and speculative.
- **One concern per file.** If a file exceeds 300 lines, consider splitting it by responsibility.
- **No circular dependencies.** Dependency direction flows from high-level to low-level.
- **Shared utilities live in a shared location**, not duplicated per feature.

### Error Handling

- **Fail explicitly.** Never swallow errors silently. Log them, handle them, or propagate them.
- **Validate at boundaries.** Validate all external input: user input, API responses, environment variables. Internal calls between trusted modules do not need defensive validation.
- **Fail fast.** Reject invalid input early rather than passing bad data downstream.
- **Specific error types** over generic catch-all handlers.

### Code Style

- **Write human code.** Code should read like a human wrote it. No robotic comment blocks or excessive section headers.
- **Descriptive naming.** No abbreviations unless universally understood. Booleans use `is`, `has`, `should`, `can` prefixes. Functions start with a verb: `getUser`, `validateInput`, `handleClick`. Constants use `UPPER_SNAKE_CASE`.
- **Comments explain why, not what.** The code already shows what it does. Only comment where the logic is not self-evident.
- **No dead code.** Remove unused imports, variables, functions, and files immediately. Do not leave commented-out code "in case we need it later." That is what version control is for.

### Testing

- **Test behavior, not implementation.** Tests verify what the code does, not how it does it.
- **One assertion per test** where practical. Test names describe the behavior: "returns error when input is empty."
- **Arrange, Act, Assert** pattern for all tests.
- **Tests must be independent** and able to run in any order.
- **Do not test private methods directly.** Test through the public interface.

---

## Installation

### For Humans (Plugin Install)

Install the coding standards as a plugin in your AI coding tool.

**Claude Code**

```bash
# Step 1: Add marketplace (one time)
/plugin marketplace add ziptalk/.github

# Step 2: Install
/plugin install blockwave-coding-standards@ziptalk
```

**Codex / Gemini CLI / Cursor** -- copy `AGENTS.md` into your project root:

```bash
curl -sO https://raw.githubusercontent.com/ziptalk/.github/main/AGENTS.md
```

### For AI Agents (Git Direct)

Agent config files live at the root of this repo for direct git access:

| Tool | File |
|------|------|
| Claude Code | `CLAUDE.md` |
| Codex / Gemini CLI / Cursor | `AGENTS.md` |

AI agents can read these directly from the repository without installing anything.
