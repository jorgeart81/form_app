import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? errorText;
  final String? hintText;
  final String? label;
  final bool obscureText;

  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.errorText,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    final errorColor = Colors.red.shade800;

    return TextFormField(
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusColor: colors.primary,
        errorText: errorText,
        errorStyle: TextStyle(color: errorColor),
        errorBorder: border.copyWith(borderSide: BorderSide(color: errorColor)),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: errorColor),
        ),

        //   Icons.supervised_user_circle_outlined,
        //   color: colors.primary,
        // ),
      ),
      obscureText: obscureText,
    );
  }
}
