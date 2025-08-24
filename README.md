# legacy_context_menu

A simple, extensible context menu for Flutter that supports nested and collapsible submenus.

`legacy_context_menu` provides a straightforward way to display a customizable context menu in your Flutter application. It's designed to be simple to use while offering powerful features like nested submenus and custom item widgets.

## Features

*   **Simple, Flexible API**: Show a context menu with a single call to `showContextMenu`.
*   **Complex Menu Structures**: Create complex, nested menus, including asynchronously-loaded and collapsible submenus.
*   **Customizable Items**: Display menu items with text, leading, and trailing widgets.
*   **Custom Item Content**: Provide a completely custom widget for a menu item's content.
*   **Dividers**: Separate menu items with dividers.
*   **Customizable Appearance**: Adjust the menu's width, height, elevation, padding, and background color with `ContextMenuTheme`.

## Getting Started

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  legacy_context_menu: ^1.0.0 # Replace with the latest version
```

Then, run `flutter pub get` in your terminal.

## Usage

Import the package in your Dart file:

```dart
import 'package:legacy_context_menu/legacy_context_menu.dart';
```

Here's a basic example of how to show a context menu when a widget is tapped:

```dart
GestureDetector(
  onTapUp: (details) {
    showContextMenu(
      context,
      menuItems: [
        ContextMenuItem(caption: 'Copy', onTap: () {}),
        ContextMenuItem(caption: 'Paste', onTap: () {}),
        ContextMenuItem.divider,
        ContextMenuItem(
          caption: 'Share',
          leading: const Icon(Icons.share),
          submenuBuilder: (context) async => [
            ContextMenuItem(
              caption: 'Email',
              leading: const Icon(Icons.email),
              onTap: () {},
            ),
            ContextMenuItem(
              caption: 'SMS',
              leading: const Icon(Icons.sms),
              onTap: () {},
            ),
          ],
        ),
      ],
      details.globalPosition,
    );
  },
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
    child: Center(child: Text('Tap me!')),
  ),
)
```

## Example

For a more comprehensive example, please see the `example` directory in this package.

## API Overview

### `showContextMenu<T>`

This function displays the context menu. It's a wrapper around Flutter's `showMenu`.

```dart
Future<void> showContextMenu({
  required BuildContext context,
  required List<ContextMenuItem> menuItems,
  Offset? tapPosition,
  ContextMenuTheme theme = const ContextMenuTheme(),
})
```

*   `context`: The `BuildContext` from which the menu is shown.
*   `menuItems`: The list of `ContextMenuItem`s to display.
*   `tapPosition`: The global position where the tap occurred. This is used to position the menu.
*   `theme`: The theme to use for the context menu.

### `ContextMenuItem<T>`

This class defines the properties of a single item in the context menu.

```dart
class ContextMenuItem<T> {
  final String caption;
  final T? value;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool closeMenuOnTap;
  final bool enabled;
  final ContextMenuItemType type;
  final List<ContextMenuItem> items;
}
```

*   `caption`: The text displayed for the menu item.
*   `value`: The value associated with the menu item.
*   `onTap`: The callback function executed when the item is tapped.
*   `icon`: An optional icon to display next to the caption.
*   `closeMenuOnTap`: Whether the menu should close when the item is tapped. Defaults to `true`.
*   `enabled`: Whether the menu item is interactive. Defaults to `true`.
*   `type`: The type of the menu item (`item`, `divider`, or `submenu`).
*   `items`: A list of sub-items for a submenu.

## Customization

You can customize the appearance of the context menu by providing a `ContextMenuTheme` to `showContextMenu`:

```dart
showContextMenu(
  context,
  myMenuItems,
  details.globalPosition,
  const ContextMenuTheme(
    backgroundColor: Colors.grey[200],
    elevation: 12,
    menuWidth: 250,
    menuItemHeight: 50,
    dividerHeight: 2,
  ),
);
```

## Additional Information

To contribute to this package, please visit the [GitHub repository](https://github.com/your-username/legacy_context_menu).

If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/your-username/legacy_context_menu/issues).
