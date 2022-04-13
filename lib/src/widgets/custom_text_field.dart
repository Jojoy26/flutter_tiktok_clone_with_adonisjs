import 'package:flutter/material.dart';

import 'package:flutter_tik_tok/src/utils/input_types.dart';
import 'package:flutter_tik_tok/src/utils/input_validators.dart';

class CustomTextField extends StatelessWidget {

  final String label;
  final IconData prefixIcon;
  final InputTypes type;
  final void Function(String? text) onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.type,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: InputValidator.getValidator(type),
      onSaved: onSaved,
      obscureText: type == InputTypes.password,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(
            color: Color(0xFFDDDDDD),
            fontSize: 17
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC)
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC)
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC)
          )
        ),
      ),
    );
  }
}
