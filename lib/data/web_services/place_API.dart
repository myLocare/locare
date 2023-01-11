// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlaceAPI extends StatefulWidget {
  PlaceAPI({super.key});

  @override
  State<PlaceAPI> createState() => _PlaceAPIState();
}

class _PlaceAPIState extends State<PlaceAPI> {
  final Stream<QuerySnapshot> place =
      FirebaseFirestore.instance.collection('place').snapshots();

  @override
  Widget build(BuildContext context) {
    CollectionReference place2 = FirebaseFirestore.instance.collection('place');
    // return SizedBox(
    //   child: StreamBuilder<QuerySnapshot>(
    //       stream: place,
    //       builder: (context, snapshot) {
    //         if (!snapshot.hasData) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         final data = snapshot.requireData;
    //         return Text('${data.docs[0]['name']}');
    //       }),
    // );

    return FutureBuilder<DocumentSnapshot>(
      future: place2.doc('sBccS6o2mM9jGenqjBcY').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}
