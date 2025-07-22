class AppRegex {
  static bool isEmailValid(String email) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    const pattern = r'^\+?[0-9]{10,15}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }

  static bool isPasswordValid(String password) {
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  static bool isNameValid(String name) {
    const pattern = r'^[a-zA-Z\s]+$';
    final regex = RegExp(pattern);
    return regex.hasMatch(name);
  }

  static bool isUsernameValid(String username) {
    const pattern = r'^[a-zA-Z0-9_]{3,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(username);
  }

  static bool isUrlValid(String url) {
    const pattern =
        r'^(https?:\/\/)?(www\.)?[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}([\/\w \.-]*)*\/?$';
    final regex = RegExp(pattern);
    return regex.hasMatch(url);
  }
  static bool isLowerCase (String input) {
    const pattern = r'^(?=.*[a-z])';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
  static bool isUpperCase (String input) {
    const pattern = r'^(?=.*[A-Z])';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
  static bool isSpecialChar (String input) {
    const pattern = r'^(?=.*[@$!%*?&])';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
  static bool isNumber (String input) {
    const pattern = r'^(?=.*\d)';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
  static bool isMinLength (String input) {
    const pattern = r'^(?=.{8,})';
    final regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
  static bool isValidDate(String date) {
    const pattern = r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(date);
  }
}