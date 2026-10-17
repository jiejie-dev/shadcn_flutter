import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  testWidgets('nested inherited button styles resolve and remain interactive', (
    tester,
  ) async {
    var pressed = false;
    await tester.pumpWidget(
      ShadcnApp(
        home: Center(
          child: ButtonStyleOverride(
            padding: (_, _, value) =>
                value.add(const EdgeInsets.symmetric(horizontal: 4)),
            child: ButtonStyleOverride.inherit(
              padding: (_, _, value) =>
                  value.add(const EdgeInsets.symmetric(vertical: 4)),
              child: PrimaryButton(
                onPressed: () => pressed = true,
                child: const Text('Action'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('Action'));
    await tester.pumpAndSettle();
    expect(pressed, isTrue);
    expect(tester.takeException(), isNull);
  });
}
