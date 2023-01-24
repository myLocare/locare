// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/Reservation.dart';
import 'package:locare/screens/home/place_info.dart';
import 'package:locare/screens/owner_app/reservations_details.dart';

class OwnerReservationCard extends StatelessWidget {
  const OwnerReservationCard({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat.MMMd().format(reservation.dateOfReservation);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.15,
            height: height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xF5F5F5F5),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.02, 0, width * 0.02, height * 0),
              child: Center(
                  child: Text('$formattedDate', style: TextStyle(fontSize: 9))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReservationDetails(
                            reservation: reservation,
                          )),
                );
              },
              child: Container(
                width: width * 0.6,
                height: height * 0.05,
                //change container radius
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xF5F5F5F5),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.055, 0, width * 0.055, height * 0),
                  child: Center(child: Text("${reservation.placeID}")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
