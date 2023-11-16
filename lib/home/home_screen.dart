import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Instagram",style: GoogleFonts.dancingScript(
          fontSize: 25,
          color: Colors.black
        ),),
        actions: [
          Badge.count(
            count: 2,
            child: IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.chat_bubble_fill),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
