# legacy_context_menu

[![pub package](https://img.shields.io/pub/v/legacy_context_menu.svg)](https://pub.dev/packages/legacy_context_menu)
[![Live Demo](https://img.shields.io/badge/live-demo-brightgreen)](https://barneysspeedshop.github.io/legacy_context_menu/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A simple, extensible context menu for Flutter that supports nested and collapsible submenus.

`legacy_context_menu` provides a straightforward way to display a customizable context menu in your Flutter application. It's designed to be simple to use while offering powerful features like nested submenus and custom item widgets.

## Features

*   **Simple, Flexible API**: Show a context menu with a single call to `showContextMenu`.
*   **Complex Menu Structures**: Create complex, nested menus, including asynchronously-loaded and collapsible submenus.
*   **Customizable Items**: Display menu items with text, leading, and trailing widgets.
*   **Custom Item Content**: Provide a completely custom widget for a menu item's content.
*   **Dividers**: Separate menu items with dividers.
*   **Customizable Appearance**: Adjust the menu's width, height, elevation, padding, and background color with `ContextMenuTheme`.

## Screenshots

| Light Mode | Dark Mode |
| :---: | :---: |
| **TODO: Add screenshot** | **TODO: Add screenshot** |

## Getting Started

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  legacy_context_menu: ^1.0.0
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
      tapPosition: details.globalPosition,
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

## API Documentation

For a detailed overview of the API, please see the [API documentation](https://pub.dev/documentation/legacy_context_menu/latest/).

## Customization

You can customize the appearance of the context menu by providing a `ContextMenuTheme` to `showContextMenu`:

```dart
showContextMenu(
  context,
  menuItems: myMenuItems,
  tapPosition: details.globalPosition,
  theme: const ContextMenuTheme(
    backgroundColor: Colors.grey[200],
    elevation: 12,
    menuWidth: 250,
    menuItemHeight: 50,
    dividerHeight: 2,
  ),
);
```

## Contributing

Contributions are welcome! Please visit the [GitHub repository](https://github.com/your-username/legacy_context_menu) to learn how to contribute.

If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/your-username/legacy_context_menu/issues).

## License

This package is licensed under the [MIT License](https://opensource.org/licenses/MIT).