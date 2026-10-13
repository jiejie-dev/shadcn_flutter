import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

const chinese = Locale.fromSubtags(
  languageCode: 'zh',
  scriptCode: 'Hans',
  countryCode: 'CN',
);
ThemeData theme(String font, {bool dark = false}) => ThemeData(
  colorScheme: dark ? ColorSchemes.darkZinc : ColorSchemes.lightZinc,
  typography: const Typography.geist().copyWith(
    sans: () => TextStyle(
      fontFamily: font,
      fontFamilyFallback: const ['Arial'],
      locale: chinese,
    ),
  ),
);

TextStyle renderedStyle(WidgetTester tester, String text) => tester
    .widget<RichText>(
      find
          .descendant(of: find.text(text), matching: find.byType(RichText))
          .first,
    )
    .text
    .style!;

void main() {
  testWidgets(
    'resolved light/dark typography reaches Text and SelectableText',
    (tester) async {
      for (final mode in [ThemeMode.light, ThemeMode.dark, ThemeMode.light]) {
        await tester.pumpWidget(
          ShadcnApp(
            theme: theme('Microsoft YaHei'),
            darkTheme: theme('Microsoft YaHei UI', dark: true),
            themeMode: mode,
            home: const Column(
              children: [Text('添加终端'), SelectableText('请核实藏骨细节')],
            ),
          ),
        );
        await tester.pumpAndSettle();
        final family = mode == ThemeMode.dark
            ? 'Microsoft YaHei UI'
            : 'Microsoft YaHei';
        expect(renderedStyle(tester, '添加终端').fontFamily, family);
        final selectable = tester.widget<EditableText>(
          find.byType(EditableText),
        );
        expect(selectable.style.fontFamily, family);
        expect(selectable.style.locale, chinese);
      }
    },
  );

  testWidgets(
    'ShadcnUI partial text style and dialog preserve local typography',
    (tester) async {
      await tester.pumpWidget(
        ShadcnApp(
          theme: theme('Microsoft YaHei'),
          home: Theme(
            data: theme('Microsoft YaHei UI'),
            child: ShadcnUI(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              child: Builder(
                builder: (context) => Column(
                  children: [
                    const Text('局部字体'),
                    PrimaryButton(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: ShadcnUI(
                            textStyle: TextStyle(fontStyle: FontStyle.italic),
                            child: SelectableText('原文藏骨'),
                          ),
                        ),
                      ),
                      child: const Text('打开'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final style = renderedStyle(tester, '局部字体');
      expect(style.fontFamily, 'Microsoft YaHei UI');
      expect(style.locale, chinese);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.fontSize, 20);
      await tester.tap(find.text('打开'));
      await tester.pumpAndSettle();
      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.style.fontFamily, 'Microsoft YaHei UI');
      expect(editable.style.locale, chinese);
      expect(editable.style.fontStyle, FontStyle.italic);
      expect(editable.selectionEnabled, isTrue);
    },
  );

  testWidgets('ShadcnUI respects an explicit document font', (tester) async {
    await tester.pumpWidget(
      ShadcnApp(
        theme: theme('Microsoft YaHei'),
        home: const ShadcnUI(
          textStyle: TextStyle(fontFamily: 'Consolas'),
          child: Text('用户选择的正文字体'),
        ),
      ),
    );
    expect(renderedStyle(tester, '用户选择的正文字体').fontFamily, 'Consolas');
  });
}
