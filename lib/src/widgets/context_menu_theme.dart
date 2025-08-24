import 'package:flutter/material.dart';

class ContextMenuTheme {
  final double elevation;
  final double dividerHeight;
  final Color? backgroundColor;
  final Border? itemBorder;
  final BorderSide? menuBorder;
  final Widget? trailingIcon;

  const ContextMenuTheme({
    this.elevation = 8.0,
    this.dividerHeight = 1.0,
    this.backgroundColor,
    this.itemBorder,
    this.menuBorder,
    this.trailingIcon,
  });
}
