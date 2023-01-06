// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:locare/pages/screens/SelectDate.dart';
import 'package:locare/pages/screens/favPage.dart';
import 'package:locare/pages/screens/UserBody.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlaceInfo extends StatefulWidget {
  const PlaceInfo({super.key});

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  height: height * 0.45, child: placeImages(width, height)),
              AppBar(
                backgroundColor: Color(0xFF345EA8),
                elevation: 0,
                toolbarHeight: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: placeContent(height, width),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12.0,
              spreadRadius: -5.0,
              offset: Offset(0.0, -3.0),
            )
          ],
        ),
        height: height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //make button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectDate()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF345EA8),
                minimumSize: const Size(190, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(fontSize: 20),
              ),
            ),

            //price
            const Text(
              '1200 SAR/Period',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  ListView placeImages(double width, double height) {
    return ListView(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height * 0.4,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            Image(
              image: const AssetImage('assets/380569812.jpg'),
              fit: BoxFit.cover,
            ),
            Image(
              image: const AssetImage('assets/380569812.jpg'),
              fit: BoxFit.cover,
            ),
            Image(
              image: const AssetImage('assets/380569812.jpg'),
              fit: BoxFit.cover,
            ),
          ],
        )
      ],
    );
  }

  ListView placeContent(double height, double width) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      scrollDirection: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Albayat Resort',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Row(
              children: const [
                Text('4.5'),
                Icon(Icons.star, color: Colors.yellow),
                Text(
                  '12 reviews',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('45 kilometers away ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.left),
            Icon(Icons.share, color: Colors.grey),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.black54),
                  Text(' Hai Alshati, Dammam',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.left),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.space_bar, color: Colors.black54),
                  Text(' 1000m2',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.left),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.people, color: Colors.black54),
                  Text(' Families and Singles',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.left),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.05,
          indent: 20,
          endIndent: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Facilities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: const [
                      Icon(Icons.pool, color: Colors.black),
                      Text('2  Pool',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                    Row(children: const [
                      Icon(Icons.restaurant, color: Colors.black),
                      Text('1  Kitchen',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                    Row(children: const [
                      Icon(Icons.wifi, color: Colors.black),
                      Text(' Free Wifi',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: const [
                      Icon(Icons.tv, color: Colors.black),
                      Text('3  Living Room',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                    Row(children: const [
                      Icon(Icons.sports_soccer, color: Colors.black),
                      Text('2  Play Ground',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                    Row(children: const [
                      Icon(Icons.local_fire_department, color: Colors.black),
                      Text('2  Barbeque Area',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left),
                    ]),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'Resort Map',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Open in Map',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Icon(Icons.share, color: Colors.grey),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          height: height * 0.3,
          width: width * 0.9,
          child: Image.asset('assets/map.jpg', fit: BoxFit.fill),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'About',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        const Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          style: TextStyle(fontSize: 18),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
