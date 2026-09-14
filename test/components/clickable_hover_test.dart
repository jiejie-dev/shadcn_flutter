import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  for (final surface in [const Color(0xfff8f4e8), const Color(0xff181818)]) {
    testWidgets(
      'transparent hover fade stays between endpoint colors $surface',
      (tester) async {
        final states = WidgetStatesController();
        addTearDown(states.dispose);
        final hovered = Color.lerp(surface, Colors.white, 0.08)!;
        await tester.pumpWidget(
          ShadcnApp(
            home: Scaffold(
              child: Center(
                child: Clickable(
                  statesController: states,
                  onPressed: () {},
                  decoration: WidgetStateProperty.resolveWith(
                    (value) => BoxDecoration(
                      color: value.contains(WidgetState.hovered)
                          ? hovered
                          : Colors.transparent,
                    ),
                  ),
                  child: const SizedBox(width: 280, height: 60),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        Color paintedColor() {
          final box = tester.widget<OverflowDecoratedBox>(
            find
                .descendant(
                  of: find.byType(Clickable),
                  matching: find.byType(OverflowDecoratedBox),
                )
                .first,
          );
          return Color.alphaBlend(
            (box.decoration as BoxDecoration).color!,
            surface,
          );
        }

        void expectBetweenEndpoints() {
          final actual = paintedColor();
          for (final channels in [
            (actual.r, surface.r, hovered.r),
            (actual.g, surface.g, hovered.g),
            (actual.b, surface.b, hovered.b),
          ]) {
            expect(
              channels.$1,
              inInclusiveRange(channels.$2 - 0.005, channels.$3 + 0.005),
            );
          }
        }

        for (final hover in [true, false, true, false]) {
          states.update(WidgetState.hovered, hover);
          await tester.pump();
          for (var frame = 0; frame < 16; frame++) {
            await tester.pump(const Duration(milliseconds: 16));
            expectBetweenEndpoints();
          }
        }
      },
    );
  }
  for (final animated in [true, false]) {
    testWidgets('hover remains stable across row edges animated=$animated', (
      tester,
    ) async {
      final previous = FocusManager.instance.highlightStrategy;
      FocusManager.instance.highlightStrategy =
          FocusHighlightStrategy.alwaysTraditional;
      addTearDown(() => FocusManager.instance.highlightStrategy = previous);
      final events = <bool>[];
      final states = WidgetStatesController();
      addTearDown(states.dispose);
      await tester.pumpWidget(
        ShadcnApp(
          theme: const ThemeData(platform: TargetPlatform.windows),
          home: Scaffold(
            child: Center(
              child: SizedBox(
                width: 280,
                child: Clickable(
                  statesController: states,
                  disableTransition: !animated,
                  onHover: events.add,
                  onPressed: () {},
                  behavior: HitTestBehavior.opaque,
                  margin: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 3),
                  ),
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                  decoration: WidgetStateProperty.resolveWith(
                    (states) => BoxDecoration(
                      color: states.contains(WidgetState.hovered)
                          ? Colors.gray
                          : Colors.transparent,
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Chapter'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final row = find.byType(Clickable);
      final originalBounds = tester.getRect(row);
      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      for (final point in [
        originalBounds.center,
        originalBounds.topLeft + const Offset(2, 4),
        originalBounds.bottomRight - const Offset(2, 4),
      ]) {
        events.clear();
        await mouse.moveTo(point);
        for (var i = 0; i < 30; i++) {
          await tester.pump(const Duration(milliseconds: 16));
          expect(tester.getRect(row), originalBounds);
          expect(
            states.value.contains(WidgetState.hovered),
            isTrue,
            reason: 'frame $i at $point; events=$events',
          );
        }
        expect(events, [true]);
        events.clear();
        await mouse.moveTo(Offset.zero);
        await tester.pumpAndSettle(
          const Duration(milliseconds: 16),
          EnginePhase.sendSemanticsUpdate,
          const Duration(seconds: 2),
        );
        expect(events, [false]);
      }
      await mouse.removePointer();
    });
  }
}
