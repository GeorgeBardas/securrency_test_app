import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/networking/models/country.dart";
import "package:securrency_test_app/screens/register_screen/register_view_model.dart";
import "package:securrency_test_app/util/app_dimensions.dart";
import "package:securrency_test_app/util/base_screen_state.dart";
import "package:securrency_test_app/util/widgets/field_validators.dart";
import "package:securrency_test_app/util/widgets/input_field.dart";
import "package:securrency_test_app/util/widgets/primary_button.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseScreenState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final countries = await Provider.of<RegisterViewModel>(context, listen: false).getCountries();
    if (countries == null) {
      Navigator.of(context).pop(true);
    }
  }

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
                  AppLocalizations.of(context)!.register_screen_title,
                  style: const TextStyle(
                    fontSize: AppDimensions.titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.largePadding,),
              Expanded(
                child: viewModel.isLoading ? loadingWidget() : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppDimensions.defaultPadding,
                        right: AppDimensions.defaultPadding,
                      ),
                      child: Column(
                        children: [
                          InputField(
                            fieldController: _emailController,
                            label: AppLocalizations.of(context)!.register_screen_email_label,
                            mandatory: true,
                            validators: [
                              RequiredValidator(errorText: AppLocalizations.of(context)!.mandatory_field),
                              EmailValidator(errorText: AppLocalizations.of(context)!.register_screen_email_error)
                            ],
                          ),
                          InputField(
                            fieldController: _passwordController,
                            label: AppLocalizations.of(context)!.register_screen_password_label,
                            isObscured: true,
                            canToggleObscure: true,
                            mandatory: true,
                            validators: [
                              RequiredValidator(errorText: AppLocalizations.of(context)!.mandatory_field),
                              PasswordValidator(errorText: AppLocalizations.of(context)!.register_screen_password_error),
                            ],
                          ),
                          InputField(
                            fieldController: _confirmPasswordController,
                            label: AppLocalizations.of(context)!.register_screen_confirm_password_label,
                            isObscured: true,
                            canToggleObscure: true,
                            mandatory: true,
                            validators: [
                              RequiredValidator(errorText: AppLocalizations.of(context)!.mandatory_field),
                            ],
                          ),
                          InputField(
                            fieldController: _dateController,
                            label: AppLocalizations.of(context)!.register_screen_birth_date_label,
                            readOnly: true,
                            mandatory: true,
                            onTap: () => Platform.isIOS ? _showCupertinoDatePicker(viewModel) : _showMaterialDatePicker(viewModel),
                            validators: [
                              RequiredValidator(errorText: AppLocalizations.of(context)!.mandatory_field)
                            ],
                          ),
                          InputField(
                            fieldController: _countryController,
                            label: AppLocalizations.of(context)!.register_screen_country_label,
                            readOnly: true,
                            mandatory: true,
                            onTap: () => Platform.isIOS ? _showCupertinoPicker(viewModel.countries) : _showMaterialPicker(viewModel.countries),
                            validators: [
                              RequiredValidator(errorText: AppLocalizations.of(context)!.mandatory_field)
                            ],
                          ),
                          PrimaryButton(
                            title: AppLocalizations.of(context)!.register_screen_next_button,
                            onPressed: () => _onNextPressed(viewModel),
                          ),
                          const SizedBox(height: AppDimensions.largePadding,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
  
  void _onNextPressed(RegisterViewModel viewModel) {
    if (_formKey.currentState?.validate() == true) {
      if (!viewModel.isValidDate()) {
        showErrorToast(AppLocalizations.of(context)!.register_screen_birth_date_error);
      } else if (!viewModel.matchPasswords(_passwordController.text, _confirmPasswordController.text)) {
        showErrorToast(AppLocalizations.of(context)!.register_screen_confirm_password_error);
      } else {
        var user = viewModel.getUser(
            _emailController.text,
            _passwordController.text,
            _countryController.text,
        );
        print(user.password);
      }
    }
  }

  void _showCupertinoDatePicker(RegisterViewModel viewModel) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CupertinoButton(
                child: Text(AppLocalizations.of(context)!.ok),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: CupertinoDatePicker(
                  maximumDate: DateTime.now().add(const Duration(days: 1)),
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: viewModel.selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (selectedDate) {
                    _dateController.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(selectedDate);
                    viewModel.setSelectedDate(selectedDate);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> _showMaterialDatePicker(RegisterViewModel viewModel) async {
    final DateTime? selectedDate = await showDatePicker(
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: viewModel.selectedDate ?? DateTime.now(),
      context: context,
    );

    if (selectedDate != null) {
      _dateController.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(selectedDate);
      viewModel.setSelectedDate(selectedDate);
    }
  }

  void _showCupertinoPicker(List<Country>? countries) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CupertinoButton(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: CupertinoPicker(
                itemExtent: 30,
                children: countries?.map((country) => Text(country.name ?? "")).toList() ?? [],
                onSelectedItemChanged: (position) {
                  _countryController.text = countries?[position].name ?? "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMaterialPicker(List<Country>? countries) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          margin: const EdgeInsets.only(top: 20),
          child: Material(
            child: ListView.builder(
              itemCount: countries?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _countryController.text = countries?[index].name ?? "";
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: ListTile(
                      title: Text(countries?[index].name ?? ""),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
