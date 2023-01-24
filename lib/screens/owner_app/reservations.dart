// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locare/data/models/Reservation.dart';
import 'package:locare/data/view_models/owner/reservation.dart';
import 'package:locare/widgets/owner/reservation_card.dart';

class OwnerReservations extends StatefulWidget {
  const OwnerReservations({super.key});

  @override
  State<OwnerReservations> createState() => _OwnerReservationsState();
}

class _OwnerReservationsState extends State<OwnerReservations> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      height: height * 0.92,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, height * 0.04, 0, height * 0.02),
          child: Text(
            'Up coming reservations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(
                width * 0.05, 0, width * 0.0, height * 0.02),
            scrollDirection: Axis.vertical,
            children: [
              OwnerReservationCard(
                reservation: ReservationsVm.reservation,
              )
            ],
          ),
        ),
        const Divider(
          color: Color(0xF5F5F5F5),
          height: 25,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, height * 0.01, 0.0, height * 0.02),
          child: Text(
            'Past reservations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(
                width * 0.05, 0, width * 0.0, height * 0.02),
            scrollDirection: Axis.vertical,
            children: [
              OwnerReservationCard(
                reservation: ReservationsVm.reservation,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
