# Github Guideline
https://www.notion.so/blockwavelabs/f77e7d0e74b14d26963abad8aad58095?pvs=4
---
## Repository Creation Rules

- Name repositories in the format “repository-name-repository-content”.
- Use lowercase letters and dashes (-).
- Example: nexton-backend, jeff-marketmaking
- Include a README file to describe the repository overview.
- Set visibility to private.

## Commit Rules

- Format: “commit-type:commit-content”.
- Use lowercase letters and colons (:).
- **Commit Types**:
    - **Feat**:
        - For developing new features.
        - Example: `feat:user authentication module`
    - **Fix**:
        - For fixing bugs.
        - Example: `fix:login issue with incorrect password handling`
    - **Update**:
        - For updating existing features or files.
        - Example: `update:dashboard layout for better user experience`
    - **Remove**:
        - For removing features or files.
        - Example: `remove:deprecated API endpoints`
    - **Refactor**:
        - For restructuring code without changing functionality.
        - Example: `refactor:authentication module for better readability`
    - **Style**:
        - For code formatting or style changes (no functional changes).
        - Example: `style:format code with Prettier`
- Include a brief description of the commit in the body if necessary.

## Branch Rules

- Format: “branch-type/branch-content”.
- Use lowercase letters and hyphens (/).
- **Branch Types**:
    - **Feat**:
        - For developing new features.
        - Example: `feat/user-authentication`
    - **Fix**:
        - For fixing bugs.
        - Example: `fix/login-password-issue`
    - **Update**:
        - For updating existing features or files.
        - Example: `update/dashboard-layout`
    - **Remove**:
        - For removing features or files.
        - Example: `remove/deprecated-api`
    - **Refactor**:
        - For restructuring code without changing functionality.
        - Example: `refactor/authentication-module`
    - **Style**:
        - For code formatting or style changes (no functional changes).
        - Example: `style/code-format`
- Create branches from the main branch and merge upon completion.
- If a dev branch is needed, create branches from the dev branch.

## Pull Request (PR) Rules

- All changes must be made through a Pull Request.
- PR titles should clearly describe the changes.
- PR descriptions should include the changes made.
