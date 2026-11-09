---
name: git
description: Git commit message conventions following semantic-release / Conventional Commits. Use when writing any git commit message, staging a commit, or asked to commit changes.
---

# Git Commits

Commit messages follow the [Conventional Commits](https://www.conventionalcommits.org/)
format so python-semantic-release can derive versions and changelogs.

## Format

```
<type>(<scope>): <description>
```

- **type** is required and lower-case: `feat`, `fix`, `docs`, `style`,
  `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- **scope** is optional, lower-case, and names the affected area, e.g.
  `inputs`, `editor`, `theme`, `icons`. Add it when the change clearly belongs
  to one area; omit it otherwise.
- **description** is a short imperative, lower-case summary with no trailing
  period. Finish the sentence "This commit will ...". Keep the whole subject
  line under ~72 characters.

## Rules

1. Never add a body, footer, notes, or trailers. The subject line is the entire
   message.
2. Keep it short — one line only.
3. Use `feat` for a new feature, `fix` for a bug fix, and pick the most
   specific other type that fits.
4. Use `!` after the type/scope or `BREAKING CHANGE` only when required; a
   breaking change without a body may use `feat!:` / `fix!:`.
5. When committing, pass the message inline: `git commit -m "fix(editor): handle empty input"`.

## Examples

```
feat(inputs): add locale-aware number validator
fix: correct theme path resolution
refactor(list): extract row builder
docs: update contributing guide
build: switch to uv, ruff, ty
test(icons): cover sharp variants
chore: bump ruff to 0.16
```
