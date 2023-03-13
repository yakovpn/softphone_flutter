import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:softphone_flutter/generated/codegen_loader.g.dart';
import 'package:softphone_flutter/src/features/keypad/keypad_view.dart';
import 'package:softphone_flutter/src/util/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
//  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (lightTheme, darkTheme) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'SoftphoneApp',
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: <String, WidgetBuilder>{
          Keypad.routeName: (BuildContext context) => const Keypad(),
        },
        home: const Keypad(),
      ),
    );
  }
}
