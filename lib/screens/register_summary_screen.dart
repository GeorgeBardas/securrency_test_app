import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/networking/models/country.dart";
import 'package:securrency_test_app/networking/models/user.dart';
import "package:securrency_test_app/screens/register_screen/register_view_model.dart";
import "package:securrency_test_app/util/app_dimensions.dart";
import "package:securrency_test_app/util/base_screen_state.dart";
import 'package:securrency_test_app/util/routes.dart';
import "package:securrency_test_app/util/widgets/field_validators.dart";
import "package:securrency_test_app/util/widgets/input_field.dart";
import 'package:securrency_test_app/util/widgets/photo_widget.dart';
import "package:securrency_test_app/util/widgets/primary_button.dart";

class RegisterSummaryScreen extends StatefulWidget {
  const RegisterSummaryScreen({Key? key, required this.userData}) : super(key: key);

  final User? userData;

  @override
  _RegisterSummaryScreenState createState() => _RegisterSummaryScreenState();
}

class _RegisterSummaryScreenState extends BaseScreenState<RegisterSummaryScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.largePadding,),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppDimensions.defaultPadding,
                ),
                child: Text(
                  AppLocalizations.of(context)!.register_summary_screen_title,
                  style: const TextStyle(
                    fontSize: AppDimensions.titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.largePadding,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppDimensions.defaultPadding,
                      right: AppDimensions.defaultPadding
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: PhotoWidget(photo: widget.userData!.photo!)),
                        const SizedBox(height: AppDimensions.largePadding,),
                        Text(AppLocalizations.of(context)!.register_summary_email),
                        Text(
                          widget.userData?.email ?? "",
                          style: const TextStyle(fontSize: 18,),
                        ),
                        const SizedBox(height: AppDimensions.defaultPadding,),
                        Text(AppLocalizations.of(context)!.register_summary_birth_date),
                        Text(
                          DateFormat(DateFormat.YEAR_MONTH_DAY).format(widget.userData!.birthDate),
                          style: const TextStyle(fontSize: 18,),
                        ),
                        const SizedBox(height: AppDimensions.defaultPadding,),
                        Text(AppLocalizations.of(context)!.register_summary_country),
                        Text(
                          widget.userData?.country ?? "",
                          style: const TextStyle(fontSize: 18,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppDimensions.defaultPadding,
                  right: AppDimensions.defaultPadding
                ),
                child: PrimaryButton(
                  title: AppLocalizations.of(context)!.register_summary_screen_button,
                  onPressed: () {
                  },
                ),
              ),
              const SizedBox(height: AppDimensions.defaultPadding,)
            ],
          ),
        ),
      );
    },);
  }
}
