import 'dart:async';

import 'package:flutter/material.dart';

import 'models/context_menu_item.dart';
import 'widgets/context_menu_item_widget.dart';
import 'widgets/context_menu_theme.dart';
import 'widgets/submenu_entry.dart';

Future<void> showContextMenu({
  required BuildContext context,
  required List<ContextMenuItem> menuItems,
  Offset? tapPosition,
  double menuWidth = 200.0,
  double menuItemHeight = 37.0,
  EdgeInsets? padding = const EdgeInsets.symmetric(horizontal: 16.0),
  ContextMenuTheme theme = const ContextMenuTheme(),
}) async {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    tapPosition != null
        ? Rect.fromLTWH(tapPosition.dx, tapPosition.dy, 0, 0)
        : Rect.fromLTWH(0, 0, 0, 0),
    Offset.zero & overlay.size,
  );

  await showMenu<dynamic>(
    context: context,
    position: position,
    shape: theme.menuBorder != null ? RoundedRectangleBorder(side: theme.menuBorder!) : null,
    items: menuItems.map<PopupMenuEntry<dynamic>>((item) {
      if (item.isDivider) {
        return PopupMenuDivider(height: theme.dividerHeight);
      } else if (item.submenuBuilder != null) {
        return SubmenuEntry(
          menuItem: item,
          theme: theme,
          menuWidth: menuWidth,
          menuItemHeight: menuItemHeight,
          padding: padding,
        );
      } else {
        return ContextMenuItemWidget(
          menuItem: item,
          theme: theme,
          menuWidth: menuWidth,
          menuItemHeight: menuItemHeight,
          padding: padding,
        );
      }
    }).toList(),
    elevation: theme.elevation,
    color: theme.backgroundColor,
  );
}
