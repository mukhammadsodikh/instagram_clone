import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';
import 'package:instagram_clone/screen/login_screen.dart';
import 'package:instagram_clone/screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final _manager = FirebaseManager();

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 350,),
            Image.asset('assets/logo.png'
              ,
              width: 100,
              height: 100,),
            const SizedBox(height: 250),
            Text(
              'from',
              style: TextStyle(color: Colors.grey),
            ),
            Image.asset('assets/meta.jpg'
              ,width: 100,
              height: 100,),
          ],
        ),
      ),
    );
  }
}