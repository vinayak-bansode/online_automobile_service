import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/dashboard.dart';
import 'package:online_automobile_service/Screens/help.dart';

import '../styles/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onTap;
  final String title;
  const HomeAppBar({required this.onTap, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF2B3467),
      elevation: 0,
      toolbarHeight: kToolbarHeight,
      iconTheme: const IconThemeData(color: white),
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
