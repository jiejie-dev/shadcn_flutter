import 'package:flutter/material.dart' as material;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

const _locale = Locale.fromSubtags(
  languageCode: 'zh',
  scriptCode: 'Hans',
  countryCode: 'CN',
);

Typography _typography(String family) => const Typography.geist().copyWith(
  sans: () => TextStyle(
    fontFamily: family,
    fontFamilyFallback: const ['Arial'],
    locale: _locale,
  ),
);

Widget _button() => Center(
  child: material.ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.add),
    label: const Text('添加终端'),
  ),
);

TextStyle _buttonStyle(WidgetTester tester) => tester
    .widget<RichText>(
      find.descendant(of: find.text('添加终端'), matching: find.byType(RichText)),
    )
    .text
    .style!;

Iterable<TextStyle?> _roles(material.TextTheme text) => [
  text.displayLarge,
  text.displayMedium,
  text.displaySmall,
  text.headlineLarge,
  text.headlineMedium,
  text.headlineSmall,
  text.titleLarge,
  text.titleMedium,
  text.titleSmall,
  text.bodyLarge,
  text.bodyMedium,
  text.bodySmall,
  text.labelLarge,
  text.labelMedium,
  text.labelSmall,
];

void main() {
  testWidgets(
    'Windows Material 按钮继承系统字体和中文语言且保留按钮字重',
    (tester) async {
      await tester.pumpWidget(
        ShadcnApp(
          locale: const Locale('zh'),
          supportedLocales: const [Locale('en'), Locale('zh')],
          localizationsDelegates: const [
            _TestShadcnLocaleDelegate(),
            ...GlobalMaterialLocalizations.delegates,
          ],
          theme: ThemeData(typography: _typography('Microsoft YaHei')),
          home: _button(),
        ),
      );
      final style = _buttonStyle(tester);
      expect(style.fontFamily, 'Microsoft YaHei');
      expect(style.fontFamilyFallback, ['Arial']);
      expect(style.locale, _locale);
      expect(style.fontWeight, FontWeight.w500);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
  );

  testWidgets(
    '所有 Material 文本角色都继承系统字体',
    (tester) async {
      late material.ThemeData actual;
      await tester.pumpWidget(
        ShadcnApp(
          theme: ThemeData(typography: _typography('Microsoft YaHei')),
          builder: (context, child) {
            actual = material.Theme.of(context);
            return child!;
          },
          home: _button(),
        ),
      );
      for (final style in [
        ..._roles(actual.textTheme),
        ..._roles(actual.primaryTextTheme),
      ]) {
        expect(style!.fontFamily, 'Microsoft YaHei');
        expect(style.fontFamilyFallback, ['Arial']);
        expect(style.locale, _locale);
      }
    },
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
  );

  testWidgets(
    'Material 桥接跟随已解析的深浅主题切换',
    (tester) async {
      late material.ThemeData actual;
      for (final mode in [ThemeMode.light, ThemeMode.dark, ThemeMode.light]) {
        await tester.pumpWidget(
          ShadcnApp(
            theme: ThemeData(typography: _typography('Microsoft YaHei')),
            darkTheme: ThemeData.dark(
              typography: _typography('Microsoft YaHei UI'),
            ),
            themeMode: mode,
            builder: (context, child) {
              actual = material.Theme.of(context);
              return child!;
            },
            home: _button(),
          ),
        );
        await tester.pumpAndSettle();
        expect(
          actual.brightness,
          mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
        );
        expect(
          _buttonStyle(tester).fontFamily,
          mode == ThemeMode.dark ? 'Microsoft YaHei UI' : 'Microsoft YaHei',
        );
        expect(_buttonStyle(tester).locale, _locale);
      }
    },
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
  );

  testWidgets(
    '显式 Material 主题仍优先于自动字体桥接',
    (tester) async {
      await tester.pumpWidget(
        ShadcnApp(
          theme: ThemeData(typography: _typography('Microsoft YaHei')),
          materialTheme: material.ThemeData(fontFamily: 'Consolas'),
          home: _button(),
        ),
      );
      expect(_buttonStyle(tester).fontFamily, 'Consolas');
    },
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
  );
}

class _TestShadcnLocaleDelegate
    extends LocalizationsDelegate<ShadcnLocalizations> {
  const _TestShadcnLocaleDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<ShadcnLocalizations> load(Locale locale) =>
      ShadcnLocalizations.delegate.load(const Locale('en'));

  @override
  bool shouldReload(_TestShadcnLocaleDelegate old) => false;
}
