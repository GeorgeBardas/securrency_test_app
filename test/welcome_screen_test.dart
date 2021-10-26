import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:provider/provider.dart';
import 'package:securrency_test_app/main.dart';
import 'package:securrency_test_app/screens/register_screen/register_screen.dart';
import 'package:securrency_test_app/screens/register_screen/register_view_model.dart';
import 'package:securrency_test_app/screens/welcome_screen/welcome_screen.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:securrency_test_app/util/widgets/input_field.dart';

void main() {
  testWidgets("Register screen UI test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RegisterViewModel>(create: (context) => RegisterViewModel(),
          )
        ],
        child: RegisterScreen(),
      )
    );

    expect(find.byType(InputField), findsNWidgets(5));
  });
}
