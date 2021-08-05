import 'package:flutter/services.dart';

class AppValidation {
  static String? currentPasswordValidator(String? text) {
    if (text == null) {
      return 'Please enter password';
    } else if (text.trim().isEmpty) {
      return 'Please enter password';
    } else if (text.trim().length < 8) {
      return 'Must be at least 8 character.';
    } else {
      return null;
    }
  }

  static String? newPasswordValidator(String? text) {
    if (text == null) {
      return 'Please enter new password';
    } else if (text.trim().isEmpty) {
      return 'Please enter new password';
    } else if (text.trim().length < 8) {
      return 'Must be at least 8 character.';
    } else {
      return null;
    }
  }

  static String? checkEmailValidation(String? text) {
    if (text == null) {
      return 'Please enter your email';
    } else if (text.isEmpty || text.trim().isEmpty) {
      return 'Please enter your email';
    } else {
      return null;
    }
  }


  static List<TextInputFormatter> get nameFormatters {
    return [
      FilteringTextInputFormatter.allow(
        RegExp("[a-zA-Z ]"),
      ),
    ];
  }

}
