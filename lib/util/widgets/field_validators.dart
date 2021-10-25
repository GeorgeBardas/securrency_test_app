import "package:form_field_validator/form_field_validator.dart";

class PasswordValidator extends TextFieldValidator {
  PasswordValidator({required String errorText}) : super(errorText);

  static const String passwordRegex = r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";

  @override
  bool isValid(String? value) {
    return RegExp(passwordRegex).hasMatch(value ?? "");
  }
}
