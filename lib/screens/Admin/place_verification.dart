// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/models/Place.dart';

class VerifyPlaces extends StatelessWidget {
  const VerifyPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Verify Places",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.add_reaction_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("place").snapshots(),
              builder: ((context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      Place place =
                          Place.fromJson(snapshot.data!.docs[index].data());
                      if (!place.isVerified) {
                        return Card(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(place.name),
                              Text(place.ownerID),
                              IconButton(
                                  onPressed: () {
                                    snapshot.data!.docs[index].reference
                                        .update({"isVerified": true});
                                    print("Verified");
                                  },
                                  icon: Icon(Icons.approval))
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
