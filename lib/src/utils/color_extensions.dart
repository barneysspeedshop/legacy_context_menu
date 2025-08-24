import 'package:flutter/material.dart';

extension ColorAlphas on Color {
  Color withValues({
    int? alpha,
    int? red,
    int? green,
    int? blue,
  }) {
    // ignore: deprecated_member_use
    final int currentValue = value;
    return Color.fromARGB(
      alpha ?? (currentValue >> 24) & 0xFF,
      red ?? (currentValue >> 16) & 0xFF,
      green ?? (currentValue >> 8) & 0xFF,
      blue ?? currentValue & 0xFF,
    );
  }
}