import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/home/add_screen.dart';
import 'package:instagram_clone/home/home_screen.dart';
import 'package:instagram_clone/home/profile_screen.dart';
import 'package:instagram_clone/home/reels_screen.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _manager = FirebaseManager();
  final List<Widget>  _screens = const [
    HomeScreen(),
    SearchBar(),
    AddSCreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(CupertinoIcons.home)
          ),BottomNavigationBarItem(
            label: '',
            icon: Icon(CupertinoIcons.search)
          ),BottomNavigationBarItem(
            label: '',
            icon: Icon(CupertinoIcons.add)
          ),BottomNavigationBarItem(
            label: '',
            icon: Icon(CupertinoIcons.video_camera)
          ),BottomNavigationBarItem(
            label: '',
            icon: Icon(CupertinoIcons.profile_circled)
          ),

        ],
      ),
    );
  }
}
