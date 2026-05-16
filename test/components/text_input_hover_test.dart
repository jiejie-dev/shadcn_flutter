import 'dart:ui' show PointerDeviceKind;

import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../test_helper.dart';

BoxDecoration _inputDecoration(WidgetTester tester, Finder inputFinder) {
  final containers = tester.widgetList<Container>(
    find.descendant(
      of: inputFinder,
      matching: find.byType(Container),
    ),
  );
  return containers.cast<Container>().firstWhere((container) {
    final decoration = container.decoration;
    return decoration is BoxDecoration && decoration.border is Border;
  }).decoration! as BoxDecoration;
}

Color _inputBorderColor(WidgetTester tester, Finder inputFinder) {
  final border = _inputDecoration(tester, inputFinder).border! as Border;
  return border.top.color;
}

void main() {
  group('Text input hover borders', () {
    testWidgets('TextField hover border is weaker than focused border',
        (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        SimpleApp(
          child: Center(
            child: SizedBox(
              width: 220,
              child: TextField(
                focusNode: focusNode,
                placeholder: const Text('Name'),
              ),
            ),
          ),
        ),
      );

      final finder = find.byType(TextField);
      final context = tester.element(finder);
      final normalColor = Theme.of(context).colorScheme.border;
      final hoverColor = Theme.of(context).colorScheme.primary.scaleAlpha(0.5);
      final focusedColor = Theme.of(context).colorScheme.primary;

      expect(_inputBorderColor(tester, finder), normalColor);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(finder));
      await tester.pumpAndSettle();

      expect(_inputBorderColor(tester, finder), hoverColor);

      focusNode.requestFocus();
      await tester.pumpAndSettle();

      expect(_inputBorderColor(tester, finder), focusedColor);
      expect(hoverColor.a, lessThan(focusedColor.a));
    });

    testWidgets('TextArea hover border is weaker than focused border',
        (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        SimpleApp(
          child: Center(
            child: SizedBox(
              width: 220,
              child: TextArea(
                focusNode: focusNode,
                placeholder: const Text('Message'),
              ),
            ),
          ),
        ),
      );

      final finder = find.byType(TextArea);
      final context = tester.element(finder);
      final normalColor = Theme.of(context).colorScheme.border;
      final hoverColor = Theme.of(context).colorScheme.primary.scaleAlpha(0.5);
      final focusedColor = Theme.of(context).colorScheme.primary;

      expect(_inputBorderColor(tester, finder), normalColor);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(finder));
      await tester.pumpAndSettle();

      expect(_inputBorderColor(tester, finder), hoverColor);

      focusNode.requestFocus();
      await tester.pumpAndSettle();

      expect(_inputBorderColor(tester, finder), focusedColor);
      expect(hoverColor.a, lessThan(focusedColor.a));
    });
  });
}
