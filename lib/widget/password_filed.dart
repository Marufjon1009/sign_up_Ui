import 'package:flutter/material.dart';
import 'package:flutter_lesson_3/widget/login_filed.dart';

class PasswordField extends StatelessWidget {
  final String? hintText;
  final TextEditingController _passwordController;
  final Validator validator;
  const PasswordField(
      {super.key,
      required TextEditingController passwordController,
      required this.hintText,
      this.validator})
      : _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        prefixIcon: const Icon(Icons.lock),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(
              30,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(
              30,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(
              30,
            )),
        filled: true,
        fillColor: const Color(0xFFEEEEEE),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
