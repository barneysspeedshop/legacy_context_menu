import 'package:flutter/material.dart';
import 'package:legacy_context_menu/legacy_context_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Menu Example'),
      ),
      body: GestureDetector(
        onTapUp: (details) {
          showContextMenu(
            context: context,
            menuItems: [
              ContextMenuItem(
                caption: 'Copy',
                leading: const Icon(Icons.copy),
                onTap: () => debugPrint('Copied'),
              ),
              ContextMenuItem(
                caption: 'Paste',
                leading: const Icon(Icons.paste),
                onTap: () => debugPrint('Pasted'),
                trailing:
                    const Text('Ctrl+V', style: TextStyle(color: Colors.grey)),
              ),
              ContextMenuItem.divider,
              ContextMenuItem(
                caption: 'Collapsible Submenu',
                submenuBehavior: SubmenuBehavior.collapsible,
                submenuBuilder: (context) async {
                  return [
                    ContextMenuItem(
                        caption: 'Subitem 1',
                        onTap: () => debugPrint('Subitem 1')),
                    ContextMenuItem(
                        caption: 'Subitem 2',
                        onTap: () => debugPrint('Subitem 2')),
                  ];
                },
              ),
              ContextMenuItem(
                caption: 'Standard Submenu',
                submenuBuilder: (context) async {
                  return [
                    ContextMenuItem(
                        caption: 'Subitem 3',
                        onTap: () => debugPrint('Subitem 3')),
                    ContextMenuItem(
                        caption: 'Subitem 4',
                        onTap: () => debugPrint('Subitem 4')),
                  ];
                },
              ),
              ContextMenuItem(
                caption: 'User Info',
                submenuBuilder: (context) async {
                  await Future.delayed(const Duration(seconds: 1));
                  return [
                    const ContextMenuItem(caption: 'Name: John Doe'),
                    const ContextMenuItem(
                        caption: 'Email: john.doe@example.com'),
                  ];
                },
              ),
            ],
            tapPosition: details.globalPosition,
            theme: ContextMenuTheme(
              backgroundColor: Colors.grey.shade200,
              elevation: 8,
              dividerHeight: 2,
              menuBorder: BorderSide(color: Colors.grey.shade400, width: 2),
            ),
          );
        },
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Tap anywhere to show the context menu.'),
          ),
        ),
      ),
    );
  }
}
