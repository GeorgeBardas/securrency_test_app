import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/screens/welcome_screen/welcome_screen.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:securrency_test_app/util/widgets/primary_button.dart";
import "package:securrency_test_app/util/widgets/secondary_button.dart";

void main() {
  testWidgets("Welcome screen UI test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale("en", ""),
        localizationsDelegates: const [
          AppLocalizations.delegate,
        ],
        home: ChangeNotifierProvider<GeneralProvider>(
          create: (context) => GeneralProvider(),
        child: WelcomeScreen(),),
      ),
    );

    final BuildContext context = tester.element(find.byType(WelcomeScreen));

    expect(find.byType(PrimaryButton), findsOneWidget);
    expect(find.byType(SecondaryButton), findsOneWidget);
    expect(find.text(AppLocalizations.of(context)!.welcome_screen_login_button), findsOneWidget);
    expect(find.text(AppLocalizations.of(context)!.welcome_screen_register_button), findsOneWidget);
  });
}
