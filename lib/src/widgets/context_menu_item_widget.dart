import 'package:flutter/material.dart';

import '../models/context_menu_item.dart';
import 'context_menu_theme.dart';

class ContextMenuItemWidget extends PopupMenuItem<String> {
  final ContextMenuItem menuItem;
  final ContextMenuTheme theme;
  final double menuWidth;
  final double menuItemHeight;

  ContextMenuItemWidget({
    required this.menuItem,
    required this.theme,
    required this.menuWidth,
    required this.menuItemHeight,
    super.padding,
    super.key,
  }) : super(
          enabled: menuItem.onTap != null,
          height: menuItemHeight,
          onTap: menuItem.onTap,
          child: Builder(
            builder: (innerContext) {
              final textStyle = Theme.of(innerContext).popupMenuTheme.textStyle ??
                  Theme.of(innerContext).textTheme.bodyMedium;
              return Container(
                width: menuWidth,
                alignment: Alignment.centerLeft,
                child: menuItem.childContent ??
                    Row(
                      children: [
                        if (menuItem.leading != null) ...[
                          menuItem.leading!,
                          const SizedBox(width: 10),
                        ],
                        Expanded(child: Text(menuItem.caption!, style: textStyle)),
                        if (menuItem.trailing != null) ...[
                          const SizedBox(width: 10),
                          menuItem.trailing!,
                        ],
                      ],
                    ),
              );
            },
          ),
        );
}