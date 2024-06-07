import 'package:flutter/material.dart';

class CusttomTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final Widget? suffix;
  final Function(String? value)? onChanged;
  final TextInputType? keyboardType;

  const CusttomTextField({
    super.key,
    this.controller,
    this.suffix,
    this.onChanged,
    this.keyboardType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      autocorrect: false,
      style: const TextStyle(fontSize: 18),
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: suffix,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        contentPadding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 11, top: 11),
        labelText: text,
        errorStyle: const TextStyle(fontSize: 10, height: 0.1),
        labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w300),
      ),
      controller: controller,
      onChanged: (value) {
        if (onChanged != null) {
          // ignore: void_checks
          return onChanged!(value);
        } else {
          return;
        }
      },
    );
  }
}
