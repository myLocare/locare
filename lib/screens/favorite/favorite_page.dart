// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:locare/data/web_services/customer_service.dart';
import 'package:locare/widgets/fav_list_card.dart';
import '../../data/models/Customer.dart';
import '../../data/models/Place.dart';
import '../home_base.dart';

class FavPage extends StatefulWidget {
  FavPage({super.key, required this.favList});

  List<dynamic> favList;
  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  String customerID = FirebaseAuth.instance.currentUser!.uid;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    // List<String> favIdList = [
    //   "OHXJc9n25USnypvcLSuI",
    //   "P7YkTqphPXcmJ1RyFdJm",
    //   "hdwv6M8yVOByiKXWcUat",
    //   "HNHuFt1DvrBX8HroOrmX",
    //   "sxWTY7Oa274dPz05rILI",
    // ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30, 0.0, 0.0),
        child: Column(children: [
          // reffresh button

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Favorite Places",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: height * 0.02),
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
                if (snapshot.hasData) {}

                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        Place place =
                            Place.fromJson(snapshot.data!.docs[index].data());
                        if (favList.contains(snapshot.data!.docs[index].id)) {
                          return FavCard(
                            place: place,
                            favList: favList,
                            placeID: snapshot.data!.docs[index].id,
                          );
                        }
                        return const SizedBox();
                      }),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
