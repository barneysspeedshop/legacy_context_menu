import 'package:flutter/material.dart';

import 'submenu_behavior.dart';

/// Represents an item in a context menu.
///
/// A [ContextMenuItem] can be a regular menu item with a caption and an action,
/// a divider, or an item with a submenu.
class ContextMenuItem {
  /// The text to display for the menu item.
  ///
  /// This is required for non-divider menu items.
  final String? caption;

  /// The callback to execute when the menu item is tapped.
  final VoidCallback? onTap;

  /// A widget to display before the [caption].
  final Widget? leading;

  /// A function that builds a submenu for this menu item.
  ///
  /// If this is provided, a submenu will be displayed when the user interacts
  /// with this menu item.
  final Future<List<ContextMenuItem>> Function(BuildContext context)?
      submenuBuilder;

  /// A widget to display after the [caption].
  ///
  /// This is typically used to indicate a submenu.
  final Widget? trailing;

  /// Whether to close the menu when this item is tapped.
  ///
  /// Defaults to `true`.
  final bool closeMenuOnTap;

  /// Custom content to display instead of the default menu item layout.
  ///
  /// If this is provided, the [caption], [leading], and [trailing] properties
  /// will be ignored.
  final Widget? childContent;

  /// Whether this menu item is a divider.
  ///
  /// If `true`, this item will be rendered as a horizontal line.
  final bool isDivider;

  /// The behavior of the submenu, if any.
  final SubmenuBehavior submenuBehavior;

  /// Creates a new context menu item.
  ///
  /// - [caption]: The text to display for the menu item.
  /// - [onTap]: The callback to execute when the menu item is tapped.
  /// - [leading]: A widget to display before the [caption].
  /// - [submenuBuilder]: A function that builds a submenu for this menu item.
  /// - [trailing]: A widget to display after the [caption].
  /// - [closeMenuOnTap]: Whether to close the menu when this item is tapped.
  /// - [childContent]: Custom content to display instead of the default menu item layout.
  /// - [isDivider]: Whether this menu item is a divider.
  /// - [submenuBehavior]: The behavior of the submenu, if any.
  const ContextMenuItem(
      {this.caption,
      this.onTap,
      this.leading,
      this.submenuBuilder,
      this.trailing,
      this.closeMenuOnTap = true,
      this.childContent,
      this.isDivider = false,
      this.submenuBehavior = SubmenuBehavior.standard})
      : assert(isDivider || caption != null,
            'A caption is required for non-divider menu items.');

  /// A constant context menu item that represents a divider.
  static const ContextMenuItem divider = ContextMenuItem(isDivider: true);
}
