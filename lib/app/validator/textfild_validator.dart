class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    final phoneRegex = RegExp(r'^(?:\+91|91)?[789]\d{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'User Name cannot be empty';
    }
    return null;
  }

  static String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  static String? bioValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please write bio';
    }
    return null;
  }
  static String? confirmPasswordValidator(
      String newPassword,
      String? confirmPassword,
      ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirmed password cannot be empty';
    }
    if (newPassword != confirmPassword) {
      return 'Confirmed password does not match the new password';
    }
    return null;
  }

}
