import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:legacy_context_menu/legacy_context_menu.dart';

void main() {
  testWidgets('showContextMenu displays menu items', (WidgetTester tester) async {
    // Define the menu items for the test.
    final menuItems = [
      ContextMenuItem(caption: 'Item 1'),
      ContextMenuItem(caption: 'Item 2'),
    ];

    // Build a widget that can display the context menu.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return GestureDetector(
                onLongPressStart: (details) {
                  showContextMenu(
                    context: context,
                    menuItems: menuItems,
                    tapPosition: details.globalPosition,
                  );
                },
                child: const Center(child: Text('Long-press me')),
              );
            },
          ),
        ),
      ),
    );

    // Find the widget to long-press.
    final tapTarget = find.text('Long-press me');
    expect(tapTarget, findsOneWidget);

    // Simulate a long press to show the menu.
    await tester.longPress(tapTarget);
    await tester.pumpAndSettle(); // Wait for the menu to appear.

    // Verify that the menu items are displayed.
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
  });
}
