// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/screens/home/click_on_category.dart';
import 'package:locare/screens/home/place_info.dart';
import 'package:locare/screens/home_base.dart';

import '../../widgets/list_card.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  // final String customerID = "ZykNyT0EtoA8M3ZNKT9L";
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
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
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('place').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        Place place =
                            Place.fromJson(snapshot.data!.docs[index].data());
                        if (place.isVerified) {
                          return listCard1(
                            context: context,
                            place: place,
                            placeID: snapshot.data!.docs[index].id,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                );
              },
            )),
          ]),
        ),
      ),
    );
  }
}

class categoriesList extends StatelessWidget {
  categoriesList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  List<String> myCategory = [
    "Resort",
    "Camping",
    "Diwaniya",
    "Apartment",
    "Nature",
  ];
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClickOnCategory(type: myCategory[0]),
                  ),
                );
              },
              child: Column(
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
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClickOnCategory(type: myCategory[1]),
                  ),
                );
              },
              child: Column(
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
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClickOnCategory(type: myCategory[2]),
                  ),
                );
              },
              child: Column(
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
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClickOnCategory(type: myCategory[3]),
                  ),
                );
              },
              child: Column(
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
                        'Apartments',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClickOnCategory(type: myCategory[4]),
                  ),
                );
              },
              child: Column(
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
