## 3.0.1

- Keep long captions without trailing widgets within menu bounds, wrapping text while preserving selection.

## 3.0.0

* **BREAKING**: Use standalone `material_ui` types instead of Flutter's legacy Material library. Applications must import `package:material_ui/material_ui.dart` and use its `MaterialApp`, theme, icons, and menu widgets.
* **BREAKING**: Require Dart 3.13 and Flutter 3.47 or newer.
* Update examples to use standalone Material widgets throughout, including shortcut labels.

## 2.2.0

* **FEAT**: Added an `icon` property on `ContextMenuItem` as a convenience alias for `leading`.
* **FEAT**: Made `menuWidth` optional on `showContextMenu`; when omitted, menu items size to their content instead of using a fixed width.
* **FIX**: Improved menu item layout when a trailing widget is present so the caption and trailing content align correctly.

## 2.1.2

* Add screenshot to pubspec.yaml

## 2.1.1

* **FIX**: Corrected the example for deployment to gh-pages

## 2.1.0

* **FEAT**: Updated the example to use `legacy_keyboard_shortcut_decoration` for keyboard shortcuts.

## 2.0.0

* **BREAKING CHANGE**: Reworked the theme system to properly support dark mode and app-wide theme customization.
  * `ContextMenuTheme` is now an `InheritedWidget` for providing theme data down the tree.
  * The theme properties class is now `ContextMenuThemeData`. This replaces the old `ContextMenuTheme` class used for styling.
  * Menu widgets now derive their default colors and styles from the ambient `ThemeData`, ensuring they adapt to light and dark modes automatically.
* **FEAT**: Added `ContextMenuTheme` and `ContextMenuThemeData` for flexible, app-wide, and per-menu styling.

## 1.0.1

* FIX: Add some dartdoc, fix up some dart formatting warnings

## 1.0.0

* Initial release.
