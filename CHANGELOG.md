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
