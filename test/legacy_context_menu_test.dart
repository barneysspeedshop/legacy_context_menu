import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:legacy_context_menu/legacy_context_menu.dart';

void main() {
  testWidgets('showContextMenu displays menu items', (
    WidgetTester tester,
  ) async {
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

  testWidgets('nested action uses the standalone Material theme', (
    tester,
  ) async {
    var selected = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          popupMenuTheme: const PopupMenuThemeData(
            textStyle: TextStyle(color: Colors.purple),
          ),
        ),
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showContextMenu(
                context: context,
                menuItems: [
                  ContextMenuItem(
                    caption: 'Actions',
                    submenuBehavior: SubmenuBehavior.collapsible,
                    submenuBuilder: (_) async => [
                      ContextMenuItem(
                        caption: 'Archive',
                        onTap: () => selected = true,
                      ),
                    ],
                  ),
                ],
              ),
              child: const Text('Open menu'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open menu'));
    await tester.pumpAndSettle();
    expect(find.text('Archive'), findsNothing);
    await tester.tap(find.text('Actions'));
    await tester.pumpAndSettle();
    expect(find.text('Archive'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Archive')).style?.color,
      Colors.purple,
    );
    await tester.tap(find.text('Archive'));
    await tester.pumpAndSettle();
    expect(selected, isTrue);
    expect(find.text('Actions'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
