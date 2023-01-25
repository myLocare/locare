// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/widgets/list_card.dart';
import 'package:locare/constants/colors.dart';
import '../../data/models/Place.dart';

class ClickOnCategory extends StatefulWidget {
  ClickOnCategory({super.key, required this.type});
  String type;
  @override
  State<ClickOnCategory> createState() => _ClickOnCategoryState();
}

class _ClickOnCategoryState extends State<ClickOnCategory> {
  int categoryIndex = 0;

  void checkOption(int index) {
    setState(() {
      this.categoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.type, style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 40,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 12,
                ),
                // a button to show top rated places
                topButton(
                    "Top Rated ",
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ), () {
                  checkOption(0);
                }, categoryIndex == 0),
                topButton("Most Visited", null, () {
                  checkOption(1);
                }, categoryIndex == 1),
                topButton(
                    "Sort by price ", Icon(Icons.arrow_drop_up_sharp, size: 30),
                    () {
                  checkOption(2);
                }, categoryIndex == 2),
                topButton("Sort by price ",
                    Icon(Icons.arrow_drop_down_sharp, size: 30), () {
                  checkOption(3);
                }, categoryIndex == 3),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          StreamBuilder(
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
                if (snapshot.hasData) {
                  // make a list of places
                  List<Place> places = [];
                  // get all places from snapshot
                  snapshot.data!.docs.forEach((element) {
                    places.add(Place.fromJson(element.data()));
                  });

                  if (categoryIndex == 0) {
                    places.sort((a, b) => b.rating.compareTo(a.rating));
                  }
                  if (categoryIndex == 1) {
                    // sort the places by number of reservations by taking the length of the reservations list
                    places.sort((a, b) => b.reservationList!.length
                        .compareTo(a.reservationList!.length));
                  }
                  if (categoryIndex == 2) {
                    places.sort((a, b) => a.price.compareTo(b.price));
                  }
                  if (categoryIndex == 3) {
                    places.sort((a, b) => b.price.compareTo(a.price));
                  }

                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (places[index].type == widget.type &&
                            places[index].isVerified == true) {
                          return listCard1(
                            context: context,
                            place: places[index],
                            placeID: snapshot.data!.docs[index].id,
                          );
                        }
                        return Container();
                      },
                    ),
                  );
                }
                return Container();
              })
        ],
      ),
    );
  }

  Padding topButton(
      String txt, Icon? icon, Function()? onTap, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? myColors.myBlue : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: Row(
                children: [
                  Text(txt,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black)),
                  icon ?? Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
