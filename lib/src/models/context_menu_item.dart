import 'package:flutter/material.dart';

import 'submenu_behavior.dart';

class ContextMenuItem {
  final String? caption;
  final VoidCallback? onTap;
  final Widget? leading;
  final Future<List<ContextMenuItem>> Function(BuildContext context)? submenuBuilder;
  final Widget? trailing;
  final bool closeMenuOnTap;
  final Widget? childContent;
  final bool isDivider;
  final SubmenuBehavior submenuBehavior;

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
      : assert(isDivider || caption != null, 'A caption is required for non-divider menu items.');

  static const ContextMenuItem divider = ContextMenuItem(isDivider: true);
}