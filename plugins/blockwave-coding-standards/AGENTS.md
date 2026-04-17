# Blockwave Labs -- Coding Standards

You are working in a Blockwave Labs repository. Follow these rules exactly.

## Commit Rules

Format: `type:description` -- lowercase, no space after colon.

| Type | Use for | Example |
|------|---------|---------|
| feat | New feature | `feat:user authentication module` |
| fix | Bug fix | `fix:login issue with incorrect password handling` |
| update | Modify existing feature | `update:dashboard layout for better user experience` |
| remove | Delete feature or file | `remove:deprecated API endpoints` |
| refactor | Restructure code, no behavior change | `refactor:authentication module for better readability` |
| style | Formatting only, no logic change | `style:format code with Prettier` |

Rules:
- Pick the most specific type. New endpoint = `feat`, not `update`.
- One logical change per commit. Split mixed changes.
- Never use generic messages like "fix bug" or "update code".
- Include a body if the summary alone does not explain the change.

## Branch Rules

Format: `type/branch-content` -- lowercase, kebab-case after slash.

| Type | Example |
|------|---------|
| feat | `feat/user-authentication` |
| fix | `fix/login-password-issue` |
| update | `update/dashboard-layout` |
| remove | `remove/deprecated-api` |
| refactor | `refactor/authentication-module` |
| style | `style/code-format` |

Rules:
- Branch from `main` (or `dev` if it exists).
- Merge back to the source branch upon completion.
- One logical unit of work per branch.

## Pull Request Rules

- All changes go through a Pull Request. Never push directly to main.
- PR titles use the same type prefix: `feat:`, `fix:`, `update:`, etc.
- Every PR description MUST include: what changed, why, and how to test.
- Keep PRs small and focused. Over 10 files or 500 lines needs justification.

## Code Review

When reviewing code, check in this order:

1. **Correctness** -- Does it do what the PR says? Edge cases handled?
2. **Security** -- No hardcoded secrets. Input validated. No injection vectors.
3. **Architecture** -- Fits existing patterns? No unnecessary duplication? Not over-engineered?
4. **Readability** -- Understandable without extra context? Clear names?
5. **Testing** -- Tests exist for new behavior? Edge cases covered?
6. **Performance** -- No N+1 queries? No unnecessary loops?

Comment rules:
- Be specific. Point to the exact line with what is wrong and why.
- Suggest a fix, not just a complaint.
- Use "MUST" for blockers, "CONSIDER" for suggestions.

## Coding Patterns

### Architecture
- Single source of truth. Never duplicate state.
- No over-engineering. Do not build for scenarios nobody asked for.
- One concern per file. Split files over 300 lines.
- No circular dependencies.

### Error Handling
- Never swallow errors silently.
- Validate at boundaries (user input, API responses, env vars).
- Fail fast on invalid input.

### Code Style
- Write human-readable code. No robotic comment blocks.
- Descriptive names, no abbreviations. Booleans: `is`, `has`, `should`, `can`.
- Functions start with a verb: `getUser`, `validateInput`, `handleClick`.
- Only comment WHY, never WHAT. Delete commented-out code.
- Remove dead code immediately. Git has history.

### Testing
- Test behavior, not implementation.
- One assertion per test. Descriptive test names.
- Tests must be independent and deterministic.

## Repository Naming

Format: `repository-name-repository-content` -- lowercase, dashes.

Examples: `nexton-backend`, `jeff-marketmaking`

Always include a README describing the repository.
