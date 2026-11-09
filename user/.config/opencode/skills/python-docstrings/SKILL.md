---
name: python-docstrings
description: Python docstring and formatting conventions. Use when writing or editing Python docstrings, comments, or code formatting, including line length, docstring shape, imperative mood, :raises, and when to omit a docstring.
---

# Python Docstrings & Formatting

## When to write a docstring

Do not add docstrings by default. Only add one where it adds value beyond the
name and type hints. Self-explanatory functions, and especially self-explanatory
classes, must NOT have a docstring.

## Formatting

1. Keep lines at 88 characters or less, including docstrings and comments.
   Unless otherwise specified in pyproject.toml, use the ruff default. Fill up to
   the max length where it makes sense.
2. Always leave a blank line after a docstring before code.
3. Single-line docstrings stay on one line:

   ```python
   def get_provider(name: str) -> Provider:
       """Return the provider for a name."""

       ...
   ```

4. Multi-line docstrings: first and last lines contain only `"""`:

   ```python
   def normalize_manifest(asset_id: str, files: list[Path]) -> Manifest:
       """
       Return the normalized manifest for a downloaded asset.
       """
   ```

   Do not write `"""Summary...` or `..."""` on the same line as text.

## Content

1. Write in imperative: `Return`, `Update`, `Run`, `Render`, `Compute`, not
   `Returns`, `Updates`, `This function renders`.
2. Functions that return something start the docstring with `Return ...`.
   Functions that return `None` start with a verb describing the side effect,
   e.g. `Update ...`, `Run ...`, `Render ...`.
3. Never use `:param:`, `:type:`, `:return:`, or `:rtype:`. Parameters and return
   values are documented by type hints and must be fully annotated.
4. Use `:raises ...:` if the function raises, with a trailing period:

   ```python
   def get_provider(name: str) -> Provider:
       """
       Return the provider for a name.

       :raises ValueError: if no provider exists for the name.
       """

       ...
   ```
