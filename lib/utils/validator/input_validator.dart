class InputValidator {
  static String? emptyValidator(String? value) {
    return value!.trim().isEmpty ? 'Field cannot be empty' : null;
  }

  static String? emailValidator(String? value) {
    final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value!);
    return !emailValid ? 'Enter a valid email address' : null;
  }

  static String? passwordValidator(String? value) {
    return value!.length < 6
        ? 'Password must be at least 6 characters'
        : null;
  }

  static String? retypePasswordValidator(String? value, String password) {
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return value != password ? 'Password does not match' : null;
  }
}
