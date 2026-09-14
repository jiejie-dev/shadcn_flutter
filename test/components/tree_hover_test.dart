import 'dart:ui' show PointerDeviceKind;
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import '../test_helper.dart';

void main() {
  for (final selected in [false, true]) {
    testWidgets(
      'Tree default hover preserves selection and resets on exit selected=$selected',
      (tester) async {
        final strategy = FocusManager.instance.highlightStrategy;
        FocusManager.instance.highlightStrategy =
            FocusHighlightStrategy.alwaysTraditional;
        addTearDown(() => FocusManager.instance.highlightStrategy = strategy);
        await tester.pumpWidget(
          SimpleApp(
            child: Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: TreeView<String>(
                  nodes: [
                    TreeItem(data: 'Node', selected: selected),
                    TreeItem(data: 'Disabled'),
                  ],
                  builder: (_, node) => TreeItemView(
                    onPressed: node.data == 'Disabled' ? null : () {},
                    child: Text(node.data),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final row = find
            .ancestor(of: find.text('Node'), matching: find.byType(Clickable))
            .first;
        Color color(Finder row) =>
            (tester
                        .widget<OverflowDecoratedBox>(
                          find
                              .descendant(
                                of: row,
                                matching: find.byType(OverflowDecoratedBox),
                              )
                              .first,
                        )
                        .decoration
                    as BoxDecoration)
                .color!;
        final idle = color(row);
        final rect = tester.getRect(row);
        final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await mouse.addPointer(location: Offset.zero);
        await mouse.moveTo(rect.center);
        await tester.pumpAndSettle();
        expect(color(row).a, greaterThan(idle.a));
        expect(tester.getRect(row), rect);
        await mouse.moveTo(Offset.zero);
        await tester.pumpAndSettle();
        expect(color(row), idle);
        final disabled = find
            .ancestor(
              of: find.text('Disabled'),
              matching: find.byType(Clickable),
            )
            .first;
        final disabledColor = color(disabled);
        await mouse.moveTo(tester.getCenter(disabled));
        await tester.pumpAndSettle();
        expect(color(disabled), disabledColor);
        await mouse.removePointer();
        expect(tester.takeException(), isNull);
      },
    );
  }
}
