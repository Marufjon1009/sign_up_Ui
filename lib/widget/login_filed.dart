import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;
typedef OnChangeFunction = void Function(String?)?;

class LoginField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final TextEditingController _login;
  final Validator validator;
  final OnChangeFunction onChanged;
  const LoginField({
    super.key,
    required this.hintText,
    this.errorText,
    required TextEditingController login,
    this.validator,
    this.onChanged,
  }) : _login = login;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _login,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        isDense: true,
        errorText: errorText,
        prefixIcon: const Icon(Icons.mail),
        fillColor: const Color(0xFFEEEEEE),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
