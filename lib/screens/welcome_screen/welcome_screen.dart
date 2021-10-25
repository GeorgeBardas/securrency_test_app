import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/util/app_dimensions.dart";
import "package:securrency_test_app/util/images.dart";
import "package:securrency_test_app/util/widgets/primary_button.dart";
import "package:securrency_test_app/util/widgets/secondary_button.dart";

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, general, child) {
      return Scaffold(
        body: Stack(
          children: [
            Images.welcomeScreenBackground,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: general.getTheme.primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
                          child: SecondaryButton(
                            title: AppLocalizations.of(context)!.welcome_screen_login_button,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
                          child: PrimaryButton(
                            title: AppLocalizations.of(context)!.welcome_screen_register_button,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },);
  }
}
