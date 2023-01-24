// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:locare/screens/payment/payment_page.dart';

import '../../data/models/Reservation.dart';

class ReservationDetails extends StatefulWidget {
  ReservationDetails({super.key, required this.reservation});
  final Reservation reservation;

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  @override
  bool selected = false;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      //appbar with back button
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: height * 0.045,
        title: Text(
          'Reservation Details',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Place Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 12.0,
                      spreadRadius: -5.0,
                      offset:
                          Offset(0.0, -3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: ListView(
                      children: [
                        //reservation details
                        Text(
                          'place ID: ${widget.reservation.placeID}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Check in: ${widget.reservation.dateOfCheckIn}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Check out: ${widget.reservation.dateOfCheckOut}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Date of reservation: ${widget.reservation.dateOfReservation}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Payment method: ${widget.reservation.paymentMethod}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Price: ${widget.reservation.amountPaid}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Status: ${widget.reservation.status}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey,
      //         blurRadius: 12.0,
      //         spreadRadius: -5.0,
      //         offset: Offset(0.0, -3.0), // shadow direction: bottom right
      //       )
      //     ],
      //   ),
      //   height: height * 0.1,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       //make button
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const PaymentPage()),
      //           );
      //         },
      //         style: ElevatedButton.styleFrom(
      //           foregroundColor: Colors.white,
      //           backgroundColor: const Color(0xFF345EA8),
      //           minimumSize: const Size(190, 50),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(12.0),
      //           ),
      //         ),
      //         child: const Text(
      //           'Confirm',
      //           style: TextStyle(fontSize: 20),
      //         ),
      //       ),

      //       //price
      //     ],
      //   ),
      // ),
    );
  }
}
