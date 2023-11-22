import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';
import 'package:instagram_clone/screen/login_screen.dart';

import '../util/message.dart';
import '../widget/loading.dart';
import '../widget/my_button.dart';
import '../widget/my_field.dart';
import '../widget/password_field.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nicknameController = TextEditingController();
  bool _isloading = false;
  
  XFile? _xFile;
  final _manager = FirebaseManager();
  void _register() {
    setState(() {
      _isloading = true;
    });
    _manager.register(
        _usernameController.text,
        _emailController.text,
        _nicknameController.text,
        _passwordController.text ,
        File(_xFile?.path ?? "")
    ).then((value) {
      if(value == "Success") {
        showSuccessMessage(BuildContext,context, "Success");
        Navigator.of(context)
            .pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const MainScreen()), (route) => false);
      } else {
        showErrorMessage(BuildContext,context, value);
        setState(() {
          _isloading = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff11347a),
                  Color(0xffd52a92),
                  Color(0xffe5571e),
                ],
                begin: Alignment(0,0),
                end: Alignment(1,1)
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Instagram",
                    style: GoogleFonts.dancingScript(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  
                  _xFile == null? Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,width: 2)
                    ),
                    child: IconButton(onPressed: () async{
                      final picker = ImagePicker();
                      _xFile = await picker.pickImage(source: ImageSource.gallery);
                      setState(() {

                      });
                    }, icon: const Icon(CupertinoIcons.person,size: 60, color: Colors.white,)),
                  ) : CircleAvatar(
                    radius: 70,
                    foregroundImage: FileImage(File(_xFile?.path ??"")),
                  ),
                  const SizedBox(height: 30,),
                  MyTextField(controller: _nicknameController, hint: 'Nickname'),
                  const SizedBox(height: 15,),MyTextField(controller: _usernameController, hint: 'Username'),
                  const SizedBox(height: 15,),
                  MyTextField(controller: _emailController, hint: 'Email'),
                  const SizedBox(height: 15,),
                  PasswordField(controller: _passwordController, hint: 'Password'),
                  const SizedBox(height: 30,),
                  _isloading ?  Loading() : MyButton(
                    text: 'Register',
                    onClick: _register,
                  ),
                  const SizedBox(height: 30,),
                  GoogleAuthButton(
                      onPressed: (){

                      }
                  ),
                  const SizedBox(height: 30,),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: TextButton(onPressed: (){
                        Navigator.of(context).pop(CupertinoPageRoute(builder: (context)=> LoginScreen()),);
                      },
                        child: Text("Arleady have an account? Sign In",
                          style: TextStyle(color: Colors.white,fontSize: 15),),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
