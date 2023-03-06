import 'package:flutter/material.dart';
import 'package:online_automobile_service/styles/colors.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Image.asset("assets/images/help.gif"),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: const [
                    Text("Admin Contact info ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    SizedBox(height: 10),
                    Text("Sumit Chandra", style: blackstyle),
                    SizedBox(height: 10),
                    Text("sumitchandra478@gmail.com", style: blackstyle),
                    SizedBox(height: 20),
                    Text("8271801781", style: blackstyle),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
