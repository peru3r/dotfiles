# AGENTS.md

## Project overview

This repository contains my personal dotfiles and scripts for deploying them.

Target platforms:

- macOS on Apple Silicon
- Debian / Ubuntu
- Fedora
- Arch Linux
- WSL (Ubuntu/Debian)

Dotfiles are deployed using Dotbot.

The repository should remain portable between supported systems.

## General rules

- Make small, focused changes.
- Do not modify unrelated files.
- Do not introduce new dependencies unless necessary.
- Prefer simple and portable solutions.
- Preserve compatibility with all supported platforms unless a change is explicitly platform-specific.
- Do not modify files outside this repository.

## Git rules

- Do not create commits unless explicitly asked.
- Commit only after the user has reviewed and approved the specific changes and explicitly requested the commit. Passing technical checks or a previous commit request does not authorize a new commit.
- Once authorized, create a separate commit for each completed plan item, containing only changes related to that item.
- Do not push changes unless explicitly asked.
- Do not amend, rebase, reset, or otherwise rewrite Git history unless explicitly asked.
- Before completing a task, show or summarize the changes made.
- Keep changes small enough to be reviewed independently.

## Implementation workflow

Work iteratively: implement one plan item at a time, then wait for the user's personal review before proceeding to the next item.

For each task:

1. Inspect the existing implementation.
2. Briefly explain the intended changes before editing files.
3. Implement only the requested scope.
4. Run relevant validation/tests.
5. Report:
   - files changed;
   - tests/checks performed;
   - anything that could not be tested;
    - potential platform-specific issues.

Mark a plan item complete only after implementation and relevant checks have finished. A checked item records implementation and technical validation; record user acceptance separately.

If an architectural decision is not covered by PLAN.md, stop the affected implementation and ask the user to approve the decision before proceeding.

## Testing

Changes should be validated before they are considered complete.

Where applicable:

- validate configuration syntax;
- run application-specific config checks;
- test installation/deployment scripts in an isolated environment;
- avoid modifying the real `$HOME/.config` during tests.

Platform-specific behavior should be tested on the corresponding platform when possible.

Do not claim that a configuration works on a platform if it was not actually tested there.

## Dotfiles rules

- Repository files are the source of truth.
- Do not directly edit the user's real files in `~/.config`.
- Deployment should be reproducible through Dotbot.
- Platform-specific configuration should be clearly separated when necessary.
- Avoid hardcoded absolute paths tied to one machine.

## Documentation

Update documentation when behavior, installation steps, supported platforms, or dependencies change.

Do not duplicate large amounts of information between README.md, PLAN.md, and AGENTS.md.

Keep development and agent workflow rules in AGENTS.md. Keep scope, agreed implementation decisions, tasks, progress, and validation results in PLAN.md.
