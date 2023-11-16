import 'package:flutter/material.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _manager = FirebaseManage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ,
      ),
    );
  }
}
