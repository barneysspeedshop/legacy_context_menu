import 'package:flutter_test/flutter_test.dart';
import 'package:legacy_context_menu/legacy_context_menu.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('long context menu captions wrap and remain actionable', (
    tester,
  ) async {
    var selected = false;
    const caption = 'Export Folder as OKF Bundle with all nested documents';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showContextMenu(
                context: context,
                menuWidth: 160,
                menuItems: [
                  ContextMenuItem(
                    caption: caption,
                    onTap: () => selected = true,
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
    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.text(caption)).width, lessThanOrEqualTo(160));
    await tester.tap(find.text(caption));
    await tester.pumpAndSettle();
    expect(selected, isTrue);
  });
}
