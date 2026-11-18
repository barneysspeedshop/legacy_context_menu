import 'package:material_ui/material_ui.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Context Menu Example')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapUp: (details) {
          showContextMenu(
            context: context, // This was already correct, just formatting.
            menuItems: [
              ContextMenuItem(
                caption: 'Copy',
                icon: const Icon(Icons.copy),
                onTap: () => debugPrint('Copied'),
                trailing: const Text('Ctrl+C'),
              ),
              ContextMenuItem(
                caption: 'Paste',
                leading: const Icon(Icons.paste),
                onTap: () => debugPrint('Pasted'),
                trailing: const Text('Ctrl+V'),
              ),
              ContextMenuItem.divider,
              ContextMenuItem(
                caption: 'Collapsible Submenu',
                submenuBehavior: SubmenuBehavior.collapsible,
                submenuBuilder: (context) async {
                  return [
                    ContextMenuItem(
                      caption: 'Subitem 1',
                      onTap: () => debugPrint('Subitem 1'),
                    ),
                    ContextMenuItem(
                      caption: 'Subitem 2',
                      onTap: () => debugPrint('Subitem 2'),
                    ),
                  ];
                },
              ),
              ContextMenuItem(
                caption: 'Standard Submenu',
                submenuBuilder: (context) async {
                  return [
                    ContextMenuItem(
                      caption: 'Subitem 3',
                      onTap: () => debugPrint('Subitem 3'),
                    ),
                    ContextMenuItem(
                      caption: 'Subitem 4',
                      onTap: () => debugPrint('Subitem 4'),
                    ),
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
                      caption: 'Email: john.doe@example.com',
                    ),
                  ];
                },
              ),
            ],
            tapPosition: details.globalPosition,
          );
        },
        child: const Center(
          child: Text('Tap anywhere to show the context menu.'),
        ),
      ),
    );
  }
}
