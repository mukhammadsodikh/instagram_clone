import 'package:flutter/material.dart';

class AddSCreen extends StatefulWidget {
  const AddSCreen({super.key});

  @override
  State<AddSCreen> createState() => _AddSCreenState();
}

class _AddSCreenState extends State<AddSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add Screen"),
      ),
    );
  }
}
