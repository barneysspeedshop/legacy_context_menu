import 'package:material_ui/material_ui.dart';

import '../models/context_menu_item.dart';
import 'context_menu_theme.dart';

class ContextMenuItemWidget extends PopupMenuItem<String> {
  final ContextMenuItem menuItem;
  final ContextMenuTheme theme;
  final double? menuWidth;
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
              final textStyle =
                  Theme.of(innerContext).popupMenuTheme.textStyle ??
                      Theme.of(innerContext).textTheme.bodyMedium;
              return ConstrainedBox(
                constraints: menuWidth != null
                    ? BoxConstraints.tightFor(width: menuWidth)
                    : const BoxConstraints(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: menuItem.childContent ??
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (menuItem.leading != null) ...[
                            menuItem.leading!,
                            const SizedBox(width: 10),
                          ],
                          if (menuItem.trailing != null) ...[
                            Expanded(
                              child: Text(menuItem.caption!, style: textStyle),
                            ),
                            const SizedBox(width: 10),
                            menuItem.trailing!,
                          ] else
                            Text(menuItem.caption!, style: textStyle),
                        ],
                      ),
                ),
              );
            },
          ),
        );
}
