class Validator {
  Validator._();
  static String? validateName(String? value) {
    final condition = RegExp(r"((\ *)[\wáéíóúñ]+(\ *)+)+");

    if (value != null && value.isEmpty) {
      return "This field cannot be empty!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Invalid name! Please enter a valid name.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (value != null && value.isEmpty) {
      return "This field cannot be empty!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Invalid email! Please enter a valid email.";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition = RegExp(
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
    );

    if (value != null && value.isEmpty) {
      return "This field cannot be empty!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Invalid password! Please enter a valid password.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return "The passwords are different. Please check the passwords.";
    }
    return null;
  }
}
