// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.labelText,
    this.validator,
    this.controller,
    this.hintText,
    this.obscureText,
  }) : super(key: key);

  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
