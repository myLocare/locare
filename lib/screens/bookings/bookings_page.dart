// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/Reservation.dart';
import 'package:locare/data/web_services/place_service.dart';
import 'package:locare/widgets/booking_card.dart';

class BookingsPage extends StatefulWidget {
  BookingsPage({super.key});
  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  String customerID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      // make border radius to 50 for container
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30, 30.0, 0.0),
        child: Container(
          // make border radius to 50 for container
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(children: [
            Text("Bookings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.02),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Reservation')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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
                    itemBuilder: (BuildContext context, int index) {
                      Reservation reservation = Reservation.fromJson(
                          snapshot.data!.docs[index].data());
                      if (reservation.customerID == customerID) {
                        return BookingCard(
                          reservation: Reservation.fromJson(
                              snapshot.data!.docs[index].data()),
                          reservationID: snapshot.data!.docs[index].id,
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
