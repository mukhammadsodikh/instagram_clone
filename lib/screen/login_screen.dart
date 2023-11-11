import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/widget/my_field.dart';
import 'package:instagram_clone/widget/password_field.dart';

import '../widget/my_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Instagram",
                      style: GoogleFonts.dancingScript(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 30,),
                    MyTextField(controller: _nameController, hint: 'Username'),
                    const SizedBox(height: 15,),
                    MyPasswordField(controller: _passwordController, hint: 'Password'),
                    const SizedBox(height: 30,),
                    MyButton(
                      text: 'Log in',
                      onClick: (){

                      },
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network('https://cdn-icons-png.flaticon.com/512/1000/1000777.pngc', height: 40,width: 40,),
                        const SizedBox(width: 10),
                        TextButton(onPressed: (){}, child: Text('Login In with Google'),)
                      ],
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: TextButton(onPressed: (){},child: Text("Don't have an account"),))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
