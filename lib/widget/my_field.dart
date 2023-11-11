import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          fillColor: CupertinoColors.white,
          filled: true
        ),
        maxLines: 1,
      ),
    );
  }
}
