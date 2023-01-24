// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:locare/data/models/Place.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const PlaceInfo()),
          // );
        },
        child: Container(
          width: width * 0.7,
          height: height * 0.05,
          //change container radius
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xF5F5F5F5),
          ),
          child: Center(
              child: Text(
            place.name,
          )),
        ),
      ),
    );
  }
}
