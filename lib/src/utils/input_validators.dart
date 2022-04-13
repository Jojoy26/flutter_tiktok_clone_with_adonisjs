import 'package:email_validator/email_validator.dart';
import 'package:flutter_tik_tok/src/utils/input_types.dart';

class InputValidator {

  static String? Function(String? text) getValidator(InputTypes type) {
    switch(type) {
      case InputTypes.email:
        return (String? text) {
          if (!EmailValidator.validate(text as String)) {
            return 'Type a valid email';
          }
        };

      case InputTypes.password:
        return (String? text) {
          if (text!.length < 6) {
            return 'Password must contain at least 6 characters';
          }
        };

      case InputTypes.username:
        return (String? text) {
          if (text!.length < 2) {
            return 'Username must contain at least 2 characters';
          }
        };
    }
  }

}