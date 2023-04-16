import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_automobile_service/Screens/bikestore.dart';
import 'package:online_automobile_service/Screens/carreparing.dart';
import 'package:online_automobile_service/Screens/storeitem.dart';
import 'package:online_automobile_service/Screens/washing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../services/methods.dart';
import '../styles/colors.dart';

class Iconclass extends StatefulWidget {
  const Iconclass({super.key});

  @override
  State<Iconclass> createState() => _IconclassState();
}

class _IconclassState extends State<Iconclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Banner(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1743/1743614.png'),
                    ),
                    const Text(
                      'Car Repairing',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimeSlotSelectionScreen(),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/9200/9200829.png'),
                    ),
                    const Text(
                      'Car Wash',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Storeitem()));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1835/1835942.png'),
                    ),
                    const Text(
                      'Autombl Store',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3418/3418144.png'),
                    ),
                    const Text(
                      'Bike Repairing',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimeSlotSelectionScreen(),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/5617/5617929.png'),
                    ),
                    const Text(
                      'Bike Wash',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bikestoreitem(),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1818/1818885.png'),
                    ),
                    const Text(
                      'Bike Store',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              CommonMethod.call(number: '108');
            });
          },
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1061/1061536.png'),
              ),
              const Text(
                'Emergency',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ],
          ),
        ),
      ],
    )));
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/creative-illustrated-car-background_52683-68256.jpg?w=1380&t=st=1677603080~exp=1677603680~hmac=70c06c8b5b5f33930ed847e699f4179d25f866e1573e8eb25bfc53ff5d5e4f87"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/car-wash-advertising-banner_1409-962.jpg?w=1380&t=st=1677603123~exp=1677603723~hmac=5704b7c19366806af4ff9a89a1c6eaa43f12636d128dc6db9d23523401ba4d52"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/flat-car-repair-shop-services-social-media-cover-template_23-2149585848.jpg?w=1380&t=st=1677603166~exp=1677603766~hmac=d6b0c98171e4cd85497220a16b68823c1cd03a0bc860924e59befbfe66242806"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        // aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
