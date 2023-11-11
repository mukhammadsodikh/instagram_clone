import 'package:flutter/material.dart';
class MyPasswordField extends StatefulWidget {
  const MyPasswordField({super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;
  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hint,
          suffixIcon: IconButton(
            onPressed: (){
              _isVisible =! _isVisible;
            },
            icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off))
        ),
        maxLines: 1,
      ),
    );
  }
}
