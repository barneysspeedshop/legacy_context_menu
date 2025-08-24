import 'dart:async';

import 'package:flutter/material.dart';

import '../models/context_menu_item.dart';
import '../models/submenu_behavior.dart';
import 'context_menu_item_widget.dart';
import 'context_menu_theme.dart';

class SubmenuEntry extends PopupMenuItem<String> {
  final ContextMenuItem menuItem;
  final ContextMenuTheme theme;
  final double menuWidth;
  final double menuItemHeight;

  const SubmenuEntry({
    required this.menuItem,
    required this.theme,
    required this.menuWidth,
    required this.menuItemHeight,
    super.padding,
    super.key,
  }) : super(
          child: const SizedBox.shrink(),
        );

  @override
  SubmenuEntryState createState() => SubmenuEntryState();
}

class SubmenuEntryState extends PopupMenuItemState<String, SubmenuEntry> {
  bool _isExpanded = false;

  @override
  void handleTap() {
    if (widget.menuItem.submenuBehavior == SubmenuBehavior.collapsible) {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    } else {
      _showSubmenu();
    }
  }

  @override
  Widget buildChild() {
    final textStyle = Theme.of(context).popupMenuTheme.textStyle ??
        Theme.of(context).textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.menuItemHeight,
          child: Row(
            children: [
              if (widget.menuItem.leading != null) ...[
                widget.menuItem.leading!,
                const SizedBox(width: 10),
              ],
              Expanded(child: Text(widget.menuItem.caption!, style: textStyle)),
              _buildTrailingIcon(),
            ],
          ),
        ),
        if (_isExpanded) ...[
          const Divider(),
          FutureBuilder<List<ContextMenuItem>>(
            future: widget.menuItem.submenuBuilder!(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Error loading submenu');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data!.map((item) {
                    return ContextMenuItemWidget(
                      menuItem: item,
                      theme: widget.theme,
                      menuWidth: widget.menuWidth,
                      menuItemHeight: widget.menuItemHeight,
                      padding: widget.padding,
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ],
    );
  }

  Widget _buildTrailingIcon() {
    final Color? iconColor = Theme.of(context).iconTheme.color?.withAlpha(178);

    if (widget.menuItem.submenuBehavior == SubmenuBehavior.collapsible) {
      // For collapsible menus, use a drop-down arrow that rotates when expanded.
      // It respects the theme's trailingIcon if provided.
      final icon =
          widget.theme.trailingIcon ?? Icon(Icons.arrow_drop_down, color: iconColor);
      return Transform.rotate(
        angle: _isExpanded ? 3.14159 : 0, // 180 degrees
        child: icon,
      );
    }

    // For standard submenus, always use a right-facing chevron to indicate
    // the menu opens to the side. This ensures a consistent and intuitive user experience.
    return Icon(Icons.chevron_right, color: iconColor);
  }

  Future<void> _showSubmenu() async {
    final RenderBox? button = context.findRenderObject() as RenderBox?;
    if (button == null) {
      debugPrint('Error: Could not find RenderBox for submenu item.');
      return;
    }

    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

    final List<ContextMenuItem> submenuItems =
        await widget.menuItem.submenuBuilder!(context);

    if (!mounted) return;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromLTWH(offset.dx + button.size.width, offset.dy, 0, 0),
      Offset.zero & overlay.size,
    );

    await showMenu<dynamic>(
      context: context,
      position: position,
      items: submenuItems.map<PopupMenuEntry<dynamic>>((item) {
        if (item.isDivider) {
          return PopupMenuDivider(height: widget.theme.dividerHeight);
        } else if (item.submenuBuilder != null) {
          return SubmenuEntry(
            menuItem: item,
            theme: widget.theme,
            menuWidth: widget.menuWidth,
            menuItemHeight: widget.menuItemHeight,
            padding: widget.padding,
          );
        } else {
          return ContextMenuItemWidget(
            menuItem: item,
            theme: widget.theme,
            menuWidth: widget.menuWidth,
            menuItemHeight: widget.menuItemHeight,
            padding: widget.padding,
          );
        }
      }).toList(),
      elevation: widget.theme.elevation,
      color: widget.theme.backgroundColor,
    );
  }
}
