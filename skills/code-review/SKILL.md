---
name: code-review
description: Use when reviewing code, providing code feedback, or evaluating pull requests. Defines how AI agents should conduct code reviews in Blockwave Labs repositories.
---

# Code Review Standards

You MUST follow these review standards when reviewing code in Blockwave Labs repositories.

## Review Checklist

For every code review, check the following in order:

### 1. Correctness
- Does the code do what the PR description says?
- Are there edge cases that are not handled?
- Are there off-by-one errors, null checks, or race conditions?

### 2. Security
- No hardcoded secrets, API keys, or credentials.
- User input is validated and sanitized.
- No SQL injection, XSS, or command injection vectors.
- Authentication and authorization are checked where needed.

### 3. Architecture
- Does the change fit the existing codebase patterns?
- Is there unnecessary duplication?
- Are new abstractions justified, or is the code over-engineered?
- Is state managed in one place (single source of truth)?

### 4. Readability
- Can a new team member understand this code without extra context?
- Are variable and function names descriptive?
- Is the logic straightforward, or unnecessarily clever?

### 5. Testing
- Are there tests for the new behavior?
- Do the tests cover edge cases, not just the happy path?
- Are tests independent and deterministic?

### 6. Performance
- Are there obvious performance issues (N+1 queries, unnecessary loops)?
- Is data fetched efficiently?
- Are expensive operations cached where appropriate?

## How to Comment

- Be specific. Point to the exact line and explain what is wrong and why.
- Suggest a fix, not just a complaint. "This could break if X" is better with "Consider adding a null check here."
- Distinguish between blocking issues and suggestions. Use "MUST" for blockers and "CONSIDER" for suggestions.
- Never approve code with known security issues.
- One comment per issue. Do not bundle unrelated feedback.

## Approval Criteria

- All blocking issues are resolved.
- Tests pass.
- The PR follows commit, branch, and PR conventions.
- No security vulnerabilities.
