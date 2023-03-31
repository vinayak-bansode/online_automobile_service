import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/home_appbar.dart';
import '../styles/colors.dart';

class Garrageitem extends StatefulWidget {
  const Garrageitem({super.key});

  @override
  State<Garrageitem> createState() => _GarrageitemState();
}

class _GarrageitemState extends State<Garrageitem> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          title: 'Auto Garrages',
          onTap: () {},
        ),
        body: Container(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/data/items.json'),
              builder: (context, snapshot) {
                // Decode the json
                var newData = json.decode(snapshot.data.toString());

                return (newData == null)
                    ? const CircularProgressIndicator()
                    : GridView.builder(
                        itemCount: newData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.5),
                                      spreadRadius: 1.0,
                                      blurRadius: 1,
                                      offset: const Offset(0, 1),
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      newData[index]["Name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 200,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child:
                                        Image.network(newData[index]["imgurl"]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, left: 8),
                                          child: Text("Price:" "",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8),
                                          child: Text(
                                            " ${newData[index]["price"]}",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8, bottom: 8),
                                        child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/images/google-maps.png')),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8, bottom: 8),
                                          child: Text(
                                            "${newData[index]["address"]}",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8, bottom: 8),
                                          child: Text(
                                            "${newData[index]["length"]}",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                      );
              }),
        ));
  }
}
