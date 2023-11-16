import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';
import 'package:instagram_clone/screen/login_screen.dart';
import 'package:instagram_clone/screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final _manager = FirebaseManage();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
          _manager.getUser() == null ? LoginScreen() : MainScreen(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 380,),
          Image.asset('assets/logo.png'
          ,
          width: 80,
          height: 80,),
          const SizedBox(height: 180),
          Text(
            'from',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Image.asset('assets/meta.png'
          ,width: 70,
          height: 70,),
        ],
      ),
    );
  }
}