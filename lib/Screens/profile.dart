// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/login.dart';
import 'package:online_automobile_service/styles/colors.dart';

import '../services/services.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user!.photoURL!)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        user.displayName!,
                        style: const TextStyle(
                          color: black,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        user.email!,
                        style: blackstyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('No order found'),
                                actions: [
                                  Image.asset(
                                      'assets/images/thank-you-animaiton.gif'),
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.history),
                            Text(
                              "Order History",
                              style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 208,
              ),
              InkWell(
                onTap: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
