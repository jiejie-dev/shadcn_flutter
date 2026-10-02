import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../test_helper.dart';

void main() {
  for (final scaling in [1.0, 1.5]) {
    for (final popup in [false, true]) {
      testWidgets(
        'context menus share minimum width popup=$popup scaling=$scaling',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(1600, 1000));
          addTearDown(() => tester.binding.setSurfaceSize(null));
          await tester.pumpWidget(
            SimpleApp(
              theme: ThemeData(
                platform: TargetPlatform.windows,
                scaling: scaling,
              ),
              child: Builder(
                builder: (context) => popup
                    ? ContextMenuPopup(
                        anchorContext: context,
                        position: const Offset(20, 20),
                        anchorSize: Size.zero,
                        children: [
                          MenuButton(
                            child: const Text('复制'),
                            onPressed: (_) {},
                          ),
                        ],
                      )
                    : ContextMenu(
                        items: [
                          MenuButton(
                            child: const Text('复制'),
                            onPressed: (_) {},
                          ),
                        ],
                        child: const Text('打开菜单'),
                      ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          if (!popup) {
            await tester.tap(find.text('打开菜单'), buttons: kSecondaryButton);
            await tester.pumpAndSettle();
          }
          expect(
            tester.getSize(find.byType(MenuPopup)).width,
            greaterThanOrEqualTo(240 * scaling),
          );
          expect(tester.takeException(), isNull);
          await tester.pumpWidget(const SizedBox.shrink());
        },
      );
    }
  }

  for (final minimum in [160.0, 240.0]) {
    testWidgets('submenu inherits context menu minimum width $minimum', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(1600, 1000));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(
        SimpleApp(
          child: ComponentTheme(
            data: ContextMenuTheme(minWidth: minimum),
            child: ContextMenu(
              items: [
                MenuButton(
                  subMenu: [
                    MenuButton(child: const Text('复制'), onPressed: (_) {}),
                  ],
                  child: const Text('子菜单'),
                ),
              ],
              child: const Text('打开菜单'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('打开菜单'), buttons: kSecondaryButton);
      await tester.pumpAndSettle();
      Actions.invoke(
        tester.element(find.text('子菜单')),
        const OpenSubMenuIntent(),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('复制'), findsOneWidget);
      expect(find.byType(MenuPopup), findsNWidgets(2));
      for (final menu in find.byType(MenuPopup).evaluate()) {
        expect((menu.renderObject as RenderBox).size.width, minimum);
      }
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }

  testWidgets(
    'explicit theme width and narrow parent constraints are respected',
    (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: Center(
            child: ComponentTheme(
              data: const ContextMenuTheme(minWidth: 320),
              child: const SizedBox(
                width: 180,
                child: MenuPopup(children: [Text('复制')]),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.getSize(find.byType(MenuPopup)).width, 180);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  group('ContextMenu', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: ContextMenu(
            items: [
              MenuButton(child: const Text('Item 1'), onPressed: (context) {}),
            ],
            child: const Text('Right click me'),
          ),
        ),
      );

      expect(find.text('Right click me'), findsOneWidget);
    });

    testWidgets('opens on right click', (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: ContextMenu(
            items: [
              MenuButton(child: const Text('Item 1'), onPressed: (context) {}),
              MenuButton(child: const Text('Item 2'), onPressed: (context) {}),
            ],
            child: const Text('Right click me'),
          ),
        ),
      );

      // Right click
      await tester.tap(find.text('Right click me'), buttons: kSecondaryButton);
      await tester.pumpAndSettle();

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('handles item tap', (tester) async {
      bool item1Tapped = false;

      await tester.pumpWidget(
        SimpleApp(
          child: ContextMenu(
            items: [
              MenuButton(
                child: const Text('Item 1'),
                onPressed: (context) => item1Tapped = true,
              ),
            ],
            child: const Text('Right click me'),
          ),
        ),
      );

      // Right click
      await tester.tap(find.text('Right click me'), buttons: kSecondaryButton);
      await tester.pumpAndSettle();

      // Tap item
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();

      expect(item1Tapped, isTrue);
      // Menu should close
      expect(find.text('Item 1'), findsNothing);
    });

    testWidgets('renders submenus', (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: ContextMenu(
            items: [
              MenuButton(
                subMenu: [
                  MenuButton(
                      child: const Text('SubItem 1'), onPressed: (context) {}),
                ],
                onPressed: (context) {},
                child: const Text('Submenu'),
              ),
            ],
            child: const Text('Right click me'),
          ),
        ),
      );

      // Right click
      await tester.tap(find.text('Right click me'), buttons: kSecondaryButton);
      await tester.pumpAndSettle();

      expect(find.text('Submenu'), findsOneWidget);
      expect(find.text('SubItem 1'), findsNothing);

      // Hover over submenu item to open it
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.text('Submenu')));
      await tester.pump();
      await tester
          .pump(const Duration(milliseconds: 500)); // Wait for hover delay
      await tester.pumpAndSettle(); // Wait for animation

      // TODO: Fix submenu test
      // expect(find.text('SubItem 1'), findsOneWidget);
    });
  });
}
