import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/main.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/screens/register_screen/register_view_model.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

void main() {
  testWidgets("Register screen UI test", (WidgetTester tester) async {
    await tester.pumpWidget(
       MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => GeneralProvider()),
            ChangeNotifierProvider(create: (_) => RegisterViewModel()),
          ],
        child: MaterialApp(
          locale: const Locale("en", ""),
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: MyApp(),
        )
        ,),
    );

    await tester.tap(find.text("REGISTER"));

    expect(find.text("REGISTER"), findsOneWidget);
  //  TODO: test for rest of the screen(fields, validations)
  });
}
