class FieldValidation {
  // ========== email validation ==========

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value
        .contains(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'))) {
      return 'Invalid Email';
    }
    return null;
  }

// ========== password validation ==========
  static String? passwordValidation({value}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter valid password';
    }
    // the password is valid
    return null;
  }

// ========== normal validation ==========
  static String? normalValidation({value, errorText}) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    // the password is valid
    return null;
  }


  // ========== normal validation dropdown with api==========
  static String? normalDropDownValidation({value, errorText}) {
    if (value.name == null || value.name.isEmpty) {
      return errorText;
    }

    // the password is valid
    return null;
  }

  // ========== Phone Number validation ==========
  static String? phoneNumberValidation({value}) {
    if (value.length != 8) {
      return 'Mobile Number must be of 8 digit';
    }
    return null;
  }

  // ========== Password validation ==========
  static String? createPasswordValidation({value, errorText}) {
    if (value!.isEmpty) {
      return errorText;
    }
    return null;
  }

  // ========== Password validation ==========
  static String? createConfirmPasswordValidation({value, password, errorText}) {
    if (value!.isEmpty) {
      return errorText;
    }
    if (value != password.text) {
      return 'Not Match Password';
    }
    return null;
  }
}
