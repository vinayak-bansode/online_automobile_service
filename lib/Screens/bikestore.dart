import 'dart:convert';

import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'home_appbar.dart';

class Bikestoreitem extends StatefulWidget {
  const Bikestoreitem({super.key});

  @override
  State<Bikestoreitem> createState() => _BikestoreitemState();
}

class _BikestoreitemState extends State<Bikestoreitem> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 213, 212, 212),
        appBar: HomeAppBar(
          title: "Welcome to Store",
          onTap: () {},
        ),
        body: Stack(
          children: [
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/bikes.json'),
                builder: (context, snapshot) {
                  // Decode the json
                  var newData = json.decode(snapshot.data.toString());

                  return (newData == null)
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                          itemCount: newData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                    height: 140,
                                    width: 140,
                                    child: Image.network(
                                        newData[index]["imgurl"])),
                                Expanded(
                                  child: Text(
                                    newData[index]["Name"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.red),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40.0, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      const Text("price " "₹",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        newData[index]["price"].toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        );
                }),
            const Padding(
              padding: EdgeInsets.only(top: 650, left: 120),
              child: Text(
                " Seller : A1 Motors",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 680, left: 100),
              child: Text(
                " Contact : 7276909090",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
