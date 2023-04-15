import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_automobile_service/Screens/home_appbar.dart';
import 'package:online_automobile_service/services/googlemap.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List data;
  @override
  void _launchMapsUrl(String address) async {
    final encodedAddress = Uri.encodeQueryComponent(address);
    final url =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    try {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: false,
          universalLinksOnly: false,
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: 'Auto Garrages',
        onTap: () {},
      ),
      body: Container(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/garages.json'),
            builder: (context, snapshot) {
              // Decode the json
              var newData = json.decode(snapshot.data.toString());

              return (newData == null)
                  ? const CircularProgressIndicator()
                  : ListView.builder(
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
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.deepOrangeAccent
                                              .withOpacity(0.5),
                                          spreadRadius: 1.0,
                                          blurRadius: 1,
                                          offset: const Offset(0, 1),
                                        ),
                                      ]),
                                  child:
                                      Image.network(newData[index]["imgurl"]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 8.0, left: 8),
                                        child: Text("Number :" "",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: Text(
                                          " ${newData[index]["number"]}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _launchMapsUrl(newData[index]["address"]);
                                    });
                                  },
                                  child: Row(
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
            }),
      ),
    );
  }
}
