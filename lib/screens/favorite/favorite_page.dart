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
  FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  String customerID = FirebaseAuth.instance.currentUser!.uid;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('place').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        placeSnapshot) {
                  if (placeSnapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (placeSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (placeSnapshot.hasData) {
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Customer')
                          .doc(customerID)
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              customerSnapshot) {
                        if (customerSnapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (customerSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (customerSnapshot.hasData) {
                          Customer customer =
                              Customer.fromJson(customerSnapshot.data!.data()!);
                          List<dynamic> favList = customer.favoriteList;
                          return ListView.builder(
                            itemCount: placeSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Place place = Place.fromJson(
                                  placeSnapshot.data!.docs[index].data());
                              String placeID =
                                  placeSnapshot.data!.docs[index].id;
                              if (favList.contains(placeID) &&
                                  place.isVerified) {
                                return FavCard(
                                  place: place,
                                  placeID: placeID,
                                  favList: favList,
                                  isFav: false,
                                );
                              } else {
                                return Container();
                              }
                            },
                          );
                        }
                        return Text('Something went wrong');
                      },
                    );
                  }
                  return Text('Something went wrong');
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
