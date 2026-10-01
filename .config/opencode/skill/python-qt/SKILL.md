---
name: qt
description: Qt widget and PySide/qtpy coding standards. Use when writing or editing Qt widgets, delegates, item views, or any Qt/PySide code, including class attribute helpers, method ordering, naming, and module-level type aliases.
---

# Qt Standards

## Module layout

Order within a module:

1. Module-level aliases (see below)
2. Classes, base classes first
3. helper functions.

Keep each module's `__all__` in `__init__.py` in sync with the re-exports.

## Module-level aliases

Long `QtCore`/`QtWidgets`/`QtGui` enum paths are aliased at the top of the file
when used repeatedly and the full path makes lines too long:

```python
StateFlag = QtWidgets.QStyle.StateFlag
SelectionFlag = QtCore.QItemSelectionModel.SelectionFlag
ScrollHint = QtWidgets.QAbstractItemView.ScrollHint
CursorAction = QtWidgets.QAbstractItemView.CursorAction
Shader = QtGui.QOpenGLShader.ShaderTypeBit
Policy = QtWidgets.QSizePolicy.Policy
```

Rules:

- Alias only frequently used items, or where the full path would exceed the line
  length. Do not alias one-off enum accesses.
- Alias the enum/type, not a single member. Use `StateFlag.State_Selected`,
  never a bare `State_Selected`.
- Keep the alias name short and meaningful; it should read naturally at the use
  site.
- `qt_material_icons` icons and other Qt objects built at class/instance level
  are not aliased.

## Class attributes

Do not expose mutable configuration as bare public attributes. Store state on
private attributes (`self._radius`) and expose getter/setter helper methods.

```python
class GridItemDelegate(QtWidgets.QStyledItemDelegate):
    def __init__(self, parent: QtWidgets.QWidget | None = None) -> None:
        super().__init__(parent)
        self._radius = 6

    def radius(self) -> int:
        return self._radius

    def set_radius(self, radius: int) -> None:
        self._radius = radius
```

- Getters take no arguments and return the value; setters take the value and
  return `None`.
- Do not prefix getters with `is_`/`get_`. Use `expanded()` / `set_expanded()`,
  `single_open()` / `set_single_open()`, not `is_expanded()`.
- Name the pair after the concept, e.g. `title()` / `set_title()`,
  `grid_geometry()` / `set_grid_geometry()`.
- Simple getters and setters need no docstring. Add one only when the behavior
  is not obvious from the name (e.g. a setter with a side effect).

## Method order

Within a class, order methods:

1. `__init__` and other dunders (`__repr__`, `__eq__`, ...) — `__init__` first.
2. `_init_*` setup helpers (`_init_ui`, `_init_actions`).
3. Inherited / overridden Qt methods, in rough alphabetical or event order
   (`actionEvent`, `enterEvent`, `eventFilter`, `keyPressEvent`,
   `mousePressEvent`, `paintEvent`, `resizeEvent`, `wheelEvent`).
4. Public methods (getters/setters and the widget's own API).
5. Private methods (`_on_*`, `_changed`, `_show_*`).
6. `@staticmethod` and `@classmethod` last.

Example grouping:

```python
class Viewer(QtWidgets.QWidget):
    def __init__(self, parent=None): ...

    def _init_ui(self): ...

    def keyPressEvent(self, event): ...

    def mousePressEvent(self, event): ...

    def offset(self): ...

    def set_offset(self, offset): ...

    def _flip_y(self, position): ...
```

- Signal handlers are private and named `_on_*` or `_*_changed` / `_*_toggled`.
- Helper methods that build UI live in `_init_*`, called from `__init__`.

## Signals

- Declare signals on the class, typed as `QtCore.Signal(...)`.
- Prefer connecting to private `_on_*` slots; keep construction wiring in
  `_init_ui` or `__init__`.
- Name a state-change signal after the state, e.g. `toggled = Signal(bool)`.

## Widget construction

- Build child widgets and layouts in `_init_ui` (or inline in `__init__` for
  very small widgets), then expose them via getter methods.
- Use `QtCore.QMargins()` (empty) rather than `QtCore.QMargins(0, 0, 0, 0)`.
- Set layout contents margins to empty and let the parent control spacing where
  a compact layout is wanted.
- Prefer palette roles over hardcoded colors so themes keep working
  (`option.palette.highlight()`, `self.palette().brightText()`).

## Copying external widgets

When a widget is copied from another project (e.g. `VerticalScrollArea` from
`qt-parameters`), copy it verbatim, including its existing style, and do not
"improve" it.

## Verification

After changes, run scoped checks:

```sh
ruff format <package> examples
ruff check --select I --fix <package> examples
ruff check <package> examples
ty check <package> examples
pytest
```
