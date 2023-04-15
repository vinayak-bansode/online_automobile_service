import 'dart:convert';

import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'home_appbar.dart';

class Storeitem extends StatefulWidget {
  const Storeitem({super.key});

  @override
  State<Storeitem> createState() => _StoreitemState();
}

class _StoreitemState extends State<Storeitem> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          title: "Welcome to Store",
          onTap: () {},
        ),
        body: Container(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/data/store_items.json'),
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
                                  child:
                                      Image.network(newData[index]["imgurl"])),
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
                                    left: 50.0, bottom: 10, top: 10),
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
        ));
  }
}
