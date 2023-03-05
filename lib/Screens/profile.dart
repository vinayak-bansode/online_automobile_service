import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_automobile_service/styles/colors.dart';

import '../services/services.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 160,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                  child: Column(
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
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await AuthService().signOut();
                      exit(0);
                    },
                    child: const Text("Log Out"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0, left: 80),
            child: SizedBox(
                height: 260,
                width: 200,
                child: Column(
                  children: [
                    Image.asset('assets/images/117819-thank-you-animaiton.gif'),
                    const SizedBox(height: 20),
                    const Text(
                      "Thank You ",
                      style: blackstyle,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
