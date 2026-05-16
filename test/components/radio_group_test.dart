import 'dart:ui' show PointerDeviceKind;

import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../test_helper.dart';

BoxDecoration _radioDecoration(WidgetTester tester) {
  final containers = tester.widgetList<AnimatedContainer>(
    find.descendant(
      of: find.byType(Radio),
      matching: find.byType(AnimatedContainer),
    ),
  );
  return containers.cast<AnimatedContainer>().firstWhere((container) {
    final decoration = container.decoration;
    return decoration is BoxDecoration && decoration.border is Border;
  }).decoration! as BoxDecoration;
}

Color _radioBorderColor(WidgetTester tester) {
  final border = _radioDecoration(tester).border! as Border;
  return border.top.color;
}

Card _radioCard(WidgetTester tester) {
  return tester.widget<Card>(find.byType(Card));
}

void main() {
  group('RadioGroup interactions', () {
    testWidgets('RadioItem highlights border while hovered on desktop',
        (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: Center(
            child: RadioGroup<String>(
              value: null,
              onChanged: (value) {},
              child: RadioItem<String>(
                value: 'a',
                trailing: const Text('Option A'),
              ),
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.text('Option A')));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(Radio));
      expect(_radioBorderColor(tester), Theme.of(context).colorScheme.primary);
    });

    testWidgets('RadioItem delays mobile selection until feedback finishes',
        (tester) async {
      String? selected;
      await tester.pumpWidget(
        ShadcnApp(
          theme: const ThemeData(platform: TargetPlatform.iOS),
          home: Scaffold(
            child: RadioGroup<String>(
              value: selected,
              onChanged: (value) => selected = value,
              child: RadioItem<String>(
                value: 'a',
                trailing: const Text('Option A'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Option A'));

      expect(selected, isNull);

      await tester.pump(kDefaultDuration - const Duration(milliseconds: 1));
      expect(selected, isNull);

      await tester.pump(const Duration(milliseconds: 1));
      expect(selected, 'a');
    });

    testWidgets('RadioCard uses default hover highlight on desktop',
        (tester) async {
      await tester.pumpWidget(
        SimpleApp(
          child: Center(
            child: RadioGroup<String>(
              value: null,
              onChanged: (value) {},
              child: RadioCard<String>(
                value: 'a',
                child: const Text('Option A'),
              ),
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.text('Option A')));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(RadioCard<String>));
      expect(
          _radioCard(tester).fillColor, Theme.of(context).colorScheme.accent);
    });

    testWidgets('RadioCard delays mobile selection until feedback finishes',
        (tester) async {
      String? selected;
      await tester.pumpWidget(
        ShadcnApp(
          theme: const ThemeData(platform: TargetPlatform.iOS),
          home: Scaffold(
            child: RadioGroup<String>(
              value: selected,
              onChanged: (value) => selected = value,
              child: RadioCard<String>(
                value: 'a',
                child: const Text('Option A'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Option A'));

      expect(selected, isNull);

      await tester.pump(kDefaultDuration - const Duration(milliseconds: 1));
      expect(selected, isNull);

      await tester.pump(const Duration(milliseconds: 1));
      expect(selected, 'a');
    });
  });
}
