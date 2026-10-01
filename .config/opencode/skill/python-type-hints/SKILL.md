---
name: python-type-hints
description: Python type-hint and static-checking standards using ruff and ty. Use when adding or editing Python type annotations, generics, or dunders, or when formatting and checking Python after a change (ruff format, ruff check, ty check).
---

# Python Type Hints & Verification

## Type hints

1. Fully annotate all parameters and return values, including `-> None` and
   dunders (`__eq__(self, other: object) -> bool`, `__hash__(self) -> int`).
   Never leave a parameter unannotated.
2. Never use bare generics: `dict[str, Any]`, not `dict`; `tuple[Any, ...]`, not
   `tuple`.
3. Use `object` when accepting anything and narrowing with `isinstance`
   (e.g. `__eq__`). Use `Any` only for dynamic passthrough (e.g. delegating
   `__getattr__` / `__getitem__`).

## Verification

After a change, format the touched files with ruff, e.g.
`uv run ruff format <package>`. Ruff format does not sort imports, so also run
`uv run ruff check --select I --fix <package>`. Then run the scoped type check
for the touched package, e.g. `uv run ty check <package>`. Do not run unrelated
suites unless asked.
