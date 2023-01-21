// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../screens/owner_app/schedules/edit_period.dart';

class CustomPeriodCard extends StatelessWidget {
  const CustomPeriodCard(
      {Key? key,
      required this.PlaceName,
      required this.day,
      required this.period1_from,
      required this.period1_to,
      s})
      : super(key: key);
  final String day;
  final String PlaceName;
  final String period1_from;
  final String period1_to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        MediaQuery.of(context).size.width * 0.01,
        0,
        MediaQuery.of(context).size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPeriod(
                day: day,
                PlaceName: PlaceName,
                // period1_from: period1_from,
                // period1_to: period1_to,
                // period2_from: period2_from,
                // period2_to: period2_to,
              ),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.82,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // spreadRadius: 5,
                blurRadius: 4.5,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    MediaQuery.of(context).size.height * 0.01,
                    0,
                    MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  day,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, MediaQuery.of(context).size.height * 0.025),
                child: RichText(
                  text: TextSpan(
                    text: 'From ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.024,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: period1_from,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.024,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' to ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.024,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: period1_to,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.024,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
