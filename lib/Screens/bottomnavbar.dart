import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/help.dart';
import 'package:online_automobile_service/Screens/home_appbar.dart';
import 'package:online_automobile_service/Screens/Homepage.dart';
import 'package:online_automobile_service/Screens/profile.dart';
import 'package:online_automobile_service/styles/colors.dart';

class MainScreen extends StatefulWidget {
  final bool isRegister;
  const MainScreen({Key? key, this.isRegister = false}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _getCurrentPage() {
    if (_currentIndex == 0) {
      return const Iconclass();
    } else if (_currentIndex == 1) {
      return const Help();
    } else if (_currentIndex == 2) {
      return const Profile();
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onWillPop() async {
    if (_currentIndex == 0) {
      return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("YES"),
                    onPressed: () {
                      //SystemNavigator.pop();
                      exit(0);
                    },
                  ),
                  TextButton(
                    child: const Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  )
                ],
              );
            },
          ) ??
          false;
    } else {
      setState(() {
        _currentIndex = 0;
      });
      return false;
    }
  }

  Widget getAppBar() {
    if (_currentIndex == 0) {
      return HomeAppBar(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        title: "Home",
      );
    } else if (_currentIndex == 1) {
      return HomeAppBar(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        title: "Help",
      );
    } else if (_currentIndex == 2) {
      return HomeAppBar(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        title: "Profile",
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Container(
      child: Stack(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: WillPopScope(
                  onWillPop: onWillPop,
                  child: Scaffold(
                    key: _scaffoldKey,
                    body: Stack(
                      children: [
                        Column(
                          children: [
                            getAppBar(),
                            Expanded(child: _getCurrentPage()),
                          ],
                        ),
                      ],
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      selectedItemColor: yellow,
                      unselectedItemColor: black,
                      backgroundColor: Color(0xFF2B3467),
                      type: BottomNavigationBarType.fixed,
                      enableFeedback: true,
                      items: const [
                        BottomNavigationBarItem(
                          label: 'Home',
                          icon: Icon(Icons.home),
                        ),
                        BottomNavigationBarItem(
                          label: 'Help',
                          icon: Icon(Icons.help),
                        ),
                        BottomNavigationBarItem(
                            label: 'Profile', icon: Icon(Icons.person)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
