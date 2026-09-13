import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../test_helper.dart';

void main() {
  group('TabPane', () {
    testWidgets('keeps inactive outline visible with a softer fill', (
      tester,
    ) async {
      const inactive = Color(0xffdddddd);
      const outline = BorderSide(color: Color(0xffaaaaaa));
      await _pumpTabPane(
        tester,
        child: TabPane<String>(
          items: const [TabPaneData('First'), TabPaneData('Second')],
          focused: 0,
          onFocused: (_) {},
          backgroundColor: const Color(0xffffffff),
          inactiveBackgroundColor: inactive,
          inactiveBorder: outline,
          itemBuilder: (_, item, _) => TabItem(child: Text(item.data)),
          child: const Text('Content'),
        ),
      );
      dynamic painter(String label) => tester
          .widget<CustomPaint>(
            find
                .ancestor(
                  of: find.text(label),
                  matching: find.byType(CustomPaint),
                )
                .first,
          )
          .painter;
      expect(painter('Second').isFocused, isTrue);
      expect(painter('Second').backgroundColor, inactive);
      expect(painter('Second').borderColor, outline.color);
      expect(painter('First').backgroundColor, const Color(0xffffffff));
      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      await mouse.moveTo(tester.getCenter(find.text('Second')));
      await tester.pump();
      expect(
        painter('Second').backgroundColor,
        Color.lerp(inactive, const Color(0xffffffff), .5),
      );
      await mouse.moveTo(Offset.zero);
      await tester.pump();
      expect(painter('Second').backgroundColor, inactive);
      await mouse.removePointer();
    });
    testWidgets('highlights an unfocused tab while hovered on desktop', (
      tester,
    ) async {
      await _pumpTabPane(tester);

      expect(_tabPaintsAsFocused(tester, 'Second'), isFalse);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      addTearDown(gesture.removePointer);
      await gesture.addPointer(location: Offset.zero);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.text('Second')));
      await tester.pump();

      expect(_tabPaintsAsFocused(tester, 'Second'), isTrue);
    });

    testWidgets('highlights an unfocused tab while pressed on mobile', (
      tester,
    ) async {
      await _pumpTabPane(
        tester,
        theme: const ThemeData(platform: TargetPlatform.android),
      );

      expect(_tabPaintsAsFocused(tester, 'Second'), isFalse);

      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Second')),
      );
      await tester.pump();

      expect(_tabPaintsAsFocused(tester, 'Second'), isTrue);

      await gesture.up();
      await tester.pump();
    });

    testWidgets('preserves ambient text style for tab labels', (tester) async {
      await _pumpTabPane(
        tester,
        child: DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 18),
          child: _buildTabPane(),
        ),
      );

      expect(_defaultTextStyleOf(tester, 'First').fontSize, 18);
      expect(_defaultTextStyleOf(tester, 'Second').fontSize, 18);
    });
  });
}

Future<void> _pumpTabPane(
  WidgetTester tester, {
  ThemeData theme = const ThemeData(platform: TargetPlatform.macOS),
  Widget? child,
}) {
  return tester.pumpWidget(
    SimpleApp(
      theme: theme,
      child: SizedBox(width: 360, height: 180, child: child ?? _buildTabPane()),
    ),
  );
}

Widget _buildTabPane() {
  return TabPane<String>(
    items: const [TabPaneData('First'), TabPaneData('Second')],
    focused: 0,
    onFocused: (_) {},
    itemBuilder: (context, item, index) {
      return TabItem(child: Text(item.data));
    },
    child: const Center(child: Text('Content')),
  );
}

bool _tabPaintsAsFocused(WidgetTester tester, String label) {
  final customPaint = tester.widget<CustomPaint>(
    find
        .ancestor(of: find.text(label), matching: find.byType(CustomPaint))
        .first,
  );
  final dynamic painter = customPaint.painter;
  return painter.isFocused as bool;
}

TextStyle _defaultTextStyleOf(WidgetTester tester, String label) {
  return DefaultTextStyle.of(tester.element(find.text(label))).style;
}
