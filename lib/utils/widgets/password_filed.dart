import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({
    super.key,
    required this.text,
    this.controller,
  });
  final String text;
  final TextEditingController? controller;

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.75,
      height: context.height * 0.07,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: widget.text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            suffixIcon: InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                    !obscureText ? Icons.visibility_off : Icons.visibility))),
      ),
    );
  }
}
