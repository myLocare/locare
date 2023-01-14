// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/custom_period_card.dart';

class SelectPeriod extends StatefulWidget {
  const SelectPeriod({required this.PlaceName, super.key});
  final String PlaceName;
  @override
  State<SelectPeriod> createState() => SelectPeriodState();
}

class SelectPeriodState extends State<SelectPeriod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locare"),
        backgroundColor: const Color(0xFF345EA8),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.075,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.width * 0.075,
          MediaQuery.of(context).size.width * 0.1,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  widget.PlaceName,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.bold),
                ),
                Text('select a period',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    )),
                CustomPeriodCard(
                  day: "Saturday",
                  PlaceName: widget.PlaceName,
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
                CustomPeriodCard(
                  day: "Sunday",
                  PlaceName: widget.PlaceName,
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
                CustomPeriodCard(
                  day: "Monday",
                  PlaceName: widget.PlaceName,
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
                CustomPeriodCard(
                  PlaceName: widget.PlaceName,
                  day: "Tuesday",
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
                CustomPeriodCard(
                  day: "Wednesday",
                  PlaceName: widget.PlaceName,
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
                CustomPeriodCard(
                  day: "Thursday",
                  PlaceName: widget.PlaceName,
                  period1_from: "10:00 AM",
                  period1_to: "12:00 PM",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
