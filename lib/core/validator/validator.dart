// import 'package:flutter/material.dart';
// import 'package:matchup/core/widgets/snackbar.dart';
// import 'package:matchup/features/auth/data/models/user_data.dart';

// class Validator {
//   static bool validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return false;
//     }
//     final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegExp.hasMatch(value)) {
//       return false;
//     }
//     return true;
//   }

//   static String? validateText(String? value, String? label) {
//     if (value == null || value.isEmpty) {
//       return 'Your $label cannot be empty';
//     } else if (value.length < 3) {
//       return "Your $label is too short";
//     }
//     return null;
//   }

//   static String? validateAddress(String? value, String? label) {
//     if (value == null || value.isEmpty) {
//       return '$label cannot be empty';
//     } else if (value.length < 10) {
//       return "This address seems to be too short";
//     }
//     return null;
//   }

//   static String? validatePhoneNumber(String value) {
//     String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//     RegExp regExp = RegExp(pattern);
//     if (value.isEmpty) {
//       return 'Please enter mobile number';
//     } else if (!regExp.hasMatch(value)) {
//       return 'Please enter valid mobile number';
//     } else if (value.length < 11) {
//       return 'Please enter valid mobile number';
//     }
//     return null;
//   }

//   static String? validateConfirmPassword(
//       {String? value, required String firstPassword}) {
//     if (value != null && value != firstPassword) {
//       return "Password doesn't match!";
//     } else {
//       return null;
//     }
//   }

//   static bool validatePassword(String? password) {
//     if (password == null) return false;

//     if (password.length < 8) {
//       return false;
//     }
//     return true;
//   }

//   static bool validateForm(UserData user, BuildContext context) {
//     if (user.confirmPassword != null) {
//       if (user.password != user.confirmPassword) {
//         InfoSnackBar.showErrorSnackBar(
//             context, "Please confirm your password correctly");
//         return false;
//       }
//     }

//     if (user.countryCode == "234" && user.phoneNumber!.length < 11) {
//       InfoSnackBar.showErrorSnackBar(context, "Invalid Phone Number");
//       return false;
//     }
//     final emailIsValid = Validator.validateEmail(user.email);
//     final passwordIsValid = Validator.validatePassword(user.password);
//     if (!emailIsValid) {
//       InfoSnackBar.showErrorSnackBar(context, "Invalid Email");
//       return false;
//     }
//     if (!passwordIsValid) {
//       InfoSnackBar.showErrorSnackBar(
//           context, "Passord must be 8 characters or more");
//       return false;
//     }
//     return true;
//   }
// }

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateText(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return '$label cannot be empty';
    } else if (value.length < 3) {
      return "Your name is too short";
    } else if (value.contains(" ")) {
      return "$label cannot contain spaces";
    }
    return null;
  }

  static String? validateAddress(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return '$label cannot be empty';
    } else if (value.length < 10) {
      return "This address seems to be too short";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    } else if (value.length < 11) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? validateConfirmPassword(
      {String? value, required String firstPassword}) {
    if (value != null && value != firstPassword) {
      return "Password doesn't match!";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password == null) return 'Password cannot be empty';

    // Check for at least one uppercase letter
    final upperRegex = RegExp('[A-Z]');
    if (!upperRegex.hasMatch(password)) {
      return 'Your password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    final lowerRegex = RegExp('[a-z]');
    if (!lowerRegex.hasMatch(password)) {
      return 'Your password must contain at least one lowercase letter';
    }

    // Check for at least one special character
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(password)) {
      return 'Your password must contain a special character';
    }

    // Check length
    if (password.length < 8) {
      return 'Your password must be at least 8 characters';
    }
    return null;
  }
}
