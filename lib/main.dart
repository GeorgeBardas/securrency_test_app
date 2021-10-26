import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";
import "package:provider/single_child_widget.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/screens/register_photo_screen/register_photo_view_model.dart";
import "package:securrency_test_app/screens/register_screen/register_view_model.dart";
import "package:securrency_test_app/screens/welcome_screen/welcome_screen.dart";
import "package:securrency_test_app/util/app_themes.dart";
import "package:securrency_test_app/util/routes.dart";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, generalProvider, child) {
      return MaterialApp(
        onGenerateTitle: (context) {
          return AppLocalizations.of(context)!.app_title;
        },
        supportedLocales: const [
          Locale("en", ""),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        themeMode: generalProvider.getThemeMode,
        theme: light,
        darkTheme: dark,
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: kDebugMode,
        routes: Routes.getRoutes(),
      );
    },);
  }
}

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => GeneralProvider()),
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
    ChangeNotifierProvider(create: (_) => RegisterPhotoViewModel()),
  ];
}
