import 'package:shadcn_flutter/shadcn_flutter.dart';

class SimpleApp extends StatelessWidget {
  final Widget child;
  final bool useScaffold;
  final ThemeData theme;
  const SimpleApp({
    super.key,
    required this.child,
    this.useScaffold = true,
    this.theme = const ThemeData(platform: TargetPlatform.macOS),
  });
  const SimpleApp.scaffold({super.key, required this.child})
      : useScaffold = true,
        theme = const ThemeData(platform: TargetPlatform.macOS);
  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      theme: theme,
      home: useScaffold ? Scaffold(child: child) : child,
    );
  }
}
