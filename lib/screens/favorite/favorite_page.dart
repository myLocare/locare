// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/widgets/fav_list_card.dart';

import '../../data/models/Place.dart';
import '../../data/web_services/customer_service.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
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
        padding: const EdgeInsets.fromLTRB(30.0, 30, 30.0, 0.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(children: [
            Text("Favorite Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) => FavCard(
                    place: Place(
                      placeID: snapshot.data!.docs[index].id,
                      name: snapshot.data!.docs[index]['name'].cast,
                      description: snapshot.data!.docs[index]['description'],
                      images:
                          snapshot.data!.docs[index]['images'].cast<String>(),
                      rating: snapshot.data!.docs[index]['rating'],
                      type: snapshot.data!.docs[index]['type'],
                      price: snapshot.data!.docs[index]['price'].toDouble(),
                      area: snapshot.data!.docs[index]['area'].toDouble(),
                    ),
                  ),
                );
              },
            )),
          ]),
        ),
      ),
    );
  }
}
