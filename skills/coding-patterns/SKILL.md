---
name: coding-patterns
description: Use when writing code, implementing features, fixing bugs, or refactoring in Blockwave Labs repositories. Enforces architecture principles, error handling, and code style standards.
---

# Coding Patterns

You MUST follow these patterns when writing code in Blockwave Labs repositories.

## Architecture Principles

### Single Source of Truth
- Never duplicate state. One source, everything else reads from it.
- If you are tempted to copy state to fix a display bug, you are solving the wrong problem.

### No Over-Engineering
- Do not build for scenarios nobody asked for.
- If the solution handles hypothetical future needs, strip it back.
- Simple and correct beats elaborate and speculative.
- Three similar lines of code is better than a premature abstraction.

### Small, Focused Files
- One concern per file.
- If a file exceeds 300 lines, consider splitting it by responsibility.
- Barrel files (index.ts re-exports) are acceptable for clean imports.

### Dependency Direction
- High-level modules do not depend on low-level details.
- Shared utilities live in a shared location, not duplicated per feature.
- Circular dependencies are never acceptable.

## Error Handling

### Fail Explicitly
- Never swallow errors silently. Log them, handle them, or propagate them.
- Use specific error types over generic catch-all handlers.
- User-facing errors must be clear and actionable.

### Validate at Boundaries
- Validate all external input: user input, API responses, environment variables.
- Internal function calls between trusted modules do not need defensive validation.
- Fail fast on invalid input rather than passing bad data downstream.

## Code Style

### Write Human Code
- Code should read like a human wrote it.
- No robotic comment blocks or excessive section headers.
- If three experienced devs would all write it the same way, that is the way.

### Naming
- Variables and functions: descriptive, no abbreviations unless universally understood.
- Booleans: prefix with `is`, `has`, `should`, `can`.
- Functions: start with a verb (`getUser`, `validateInput`, `handleClick`).
- Constants: UPPER_SNAKE_CASE.

### Comments
- Only add comments where the logic is not self-evident.
- Never comment WHAT the code does (the code says that). Comment WHY.
- Delete commented-out code. That is what version control is for.

### Dead Code
- Remove unused imports, variables, functions, and files immediately.
- Do not leave dead code "in case we need it later." Git has history.
- Clean up after every refactor.

## Testing

### Test Behavior, Not Implementation
- Tests verify WHAT the code does, not HOW it does it.
- Do not test private methods directly. Test through the public interface.
- If refactoring breaks tests but not behavior, the tests were wrong.

### Test Structure
- One assertion per test where practical.
- Test names describe the behavior: "returns error when input is empty."
- Arrange, Act, Assert pattern.
- Tests must be independent and run in any order.
