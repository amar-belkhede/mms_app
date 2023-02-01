import 'package:flutter/services.dart';
import '../common_import.dart';

import 'custom_form_field.dart';

class SignupFormfield extends StatelessWidget {
  const SignupFormfield({
    super.key,
    this.hintText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.bottomPadding = 10.0,
  });

  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: CustomFormField(
        obscureText: obscureText,
        hintText: hintText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
      ),
    );
  }
}
