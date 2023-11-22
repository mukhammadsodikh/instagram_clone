import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/manager/firebase_manager.dart';
import 'package:instagram_clone/model/fb_user.dart';
import 'package:instagram_clone/screen/full_sceen.dart';
import 'package:instagram_clone/screen/login_screen.dart';
import 'package:instagram_clone/widget/loading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _manager = FirebaseManager();

  void _logOut() {
    showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
      title: const Text('Do you want to log out?'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(child: const Text('No'), onPressed: () {
                Navigator.of(context).pop();
              }),
              CupertinoButton(child: const Text('Yes',style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    _manager.logOut().then((value) {
                      Navigator.of(context)
                          .pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const LoginScreen()),
                              (route) => false);
                    });
                  })
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _manager.getCurrentUser(),
      builder: (context, snapshot) {
        print(snapshot.data?.image);
        print(snapshot.data?.username);
        print('@@@@');
        if(snapshot.hasData) {
          final user = snapshot.data;
          return _buildProfile(user);
        } else if(snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: Loading(color: Colors.red));
        }
      },
    );
  }
  Widget _buildProfile(FbUser? user) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Text(user?.username ?? "",style: GoogleFonts.roboto(
                  fontSize: 22
              ),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),

          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.add_circled)),
          Badge.count(
            count: 4,
            child: const Icon(CupertinoIcons.list_bullet),
          ),
          IconButton(onPressed: _logOut, icon: const Icon(CupertinoIcons.power,color: Colors.red))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) => FullScreen(image: user?.image ??""))
                        );
                      },
                      child: Hero(
                        tag: 'profile_image',

                        child: CircleAvatar(
                          radius: 40,
                          foregroundImage: NetworkImage(
                              user?.image ?? ""
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(user?.nickname ?? "")
                  ],
                ),
                _buildTwoText('7','posts'),
                _buildTwoText('9575','followers'),
                _buildTwoText('56','following'),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildTwoText(String title, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: GoogleFonts.roboto(fontSize: 18,color: Colors.black)),
        const SizedBox(height: 3),
        Text(label)
      ],
    );
  }
}