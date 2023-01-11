// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locare/pages/screens/placeInfo.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: searchBar(height: height),
          ),
          categoriesList(height: height, width: width),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              scrollDirection: Axis.vertical,
              children: [
                listCard(context, 'assets/380569812.jpg', 'Albayat Resort',
                    '1200', 4.5, 12, 45),
                listCard(context, 'assets/380569812.jpg', 'Albayat Resort',
                    '1200', 4.5, 12, 45),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  InkWell listCard(BuildContext context, String img, String name, String price,
      double rating, int reviews, int desFromYou) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlaceInfo(),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            width: width * 0.9,
            height: height * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "$desFromYou kilometers away",
                style: TextStyle(fontSize: 17, color: Colors.grey),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(price.toString() + " SAR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
        ],
      ),
    );
  }
}

class categoriesList extends StatelessWidget {
  const categoriesList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // horizontally scrollable list
      height: height * 0.077,
      // shadow for sizedbox
      child: Container(
        //ignore margin
        margin: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              spreadRadius: -14,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                SizedBox(
                  width: width * 0.3,
                ),
                Image.asset('assets/5448204.png',
                    height: height * 0.042, width: width * 0.15),
                Container(
                  // make border radius to 50 for container
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Resorts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                Image.asset('assets/2972209.png',
                    height: height * 0.042, width: width * 0.15),
                Container(
                  // make border radius to 50 for container
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Camping',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Image.asset('assets/1047490-200.png',
                    height: height * 0.042, width: width * 0.15),
                Container(
                  // make border radius to 50 for container
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Diwaniya',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Image.asset('assets/appartment.png',
                    height: height * 0.042, width: width * 0.15),
                Container(
                  // make border radius to 50 for container
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Appartments',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Image.asset(
                    'assets/nature-icon-ecology-symbol-line-260nw-1316726654.jpg.png',
                    height: 40,
                    width: 40),
                Container(
                  // make border radius to 50 for container
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Nature',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: -4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      // searchbar
      child: TextField(
        decoration: InputDecoration(
          //make shadow for textfield
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            // remove border
            borderSide: BorderSide.none,
          ),
          hintText: '  Where to?',
          helperStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),

          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: SizedBox(
                height: height * 0.03,
                child: SvgPicture.asset("assets/searchnormal1.svg"),
              ),
            ),
          ),
          suffixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: SizedBox(
                height: height * 0.03,
                child: SvgPicture.asset("assets/Group 4011.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
