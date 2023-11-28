import 'package:flutter/material.dart';

import '../model/fb_user.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key, required this.onClick, required this.user});
  final FbUser user;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffd91377),
            Color(0xff157496),
            Color(0xff1a2a94),
          ]
        ),
        shape: BoxShape.circle
      ),
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          foregroundImage: NetworkImage(user?.image ?? ""),
        ),
      ),
    );
  }
}
