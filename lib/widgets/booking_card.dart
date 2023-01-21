// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/Reservation.dart';

class BookingCard extends StatelessWidget {
  BookingCard(
      {super.key, required this.reservation, required this.reservationID});
  Reservation reservation;
  String reservationID;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: Container(
          width: width,
          height: height * 0.17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('place')
                            .doc(reservation.placeID)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Place place = Place.fromJson(
                                snapshot.data!.data() as Map<String, dynamic>);
                            return Text(
                              place.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Text('Loading...');
                          }
                        }),
                    const Spacer(),
                    Text(reservation.status,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text("Check in: ${reservation.dateOfCheckIn}"),
                Text("Check out: ${reservation.dateOfCheckOut}"),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Total: ${reservation.amountPaid} SAR",
                    )),
              ],
            ),
          )),
    );
  }
}
