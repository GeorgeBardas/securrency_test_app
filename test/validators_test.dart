import "package:flutter_test/flutter_test.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:securrency_test_app/util/widgets/field_validators.dart";

void main() {
  test("valid email test", () {
    final bool isValid = EmailValidator(errorText: "").isValid("email@gmail.com");
    expect(isValid, true);
  });

  test("empty email test", () {
    final bool isValid = EmailValidator(errorText: "").isValid("");
    expect(isValid, false);
  });

  test("wrong email test", () {
    final bool isValid = EmailValidator(errorText: "").isValid("test");
    expect(isValid, false);
  });

  test("valid password", () {
    final bool isValid = PasswordValidator(errorText: "").isValid("password1!");
    expect(isValid, true);
  });

  test("invalid password", () {
    final bool isValid = PasswordValidator(errorText: "").isValid("password");
    expect(isValid, false);
  });
}
