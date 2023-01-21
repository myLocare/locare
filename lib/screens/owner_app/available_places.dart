// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locare/screens/home/place_info.dart';

class Available_places extends StatefulWidget {
  const Available_places({super.key});

  @override
  State<Available_places> createState() => _Available_placesState();
}

class _Available_placesState extends State<Available_places> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
          padding: EdgeInsets.fromLTRB(0, height * 0.04, 0, height * 0.02),
          child: Text(
            'Available Places',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding:
                EdgeInsets.fromLTRB(width * 0.0, 0, width * 0.0, height * 0.02),
            scrollDirection: Axis.vertical,
            children: [
              availablePlaces(context, "The Ghadeer Resort"),
              availablePlaces(context, "The Ghadeer Resort"),
              availablePlaces(context, "Place 3"),
              availablePlaces(context, "Place 4"),
              availablePlaces(context, "Place 5"),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.2, height * 0.01, width * 0.2, height * 0.01),
                child: FloatingActionButton(
                  heroTag: null,
                  elevation: 0,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const PlaceInfo()),
                    // );
                  },
                  backgroundColor: Color(0xF5F5F5F5),
                  child: const Icon(Icons.add, color: Color(0xD9D9D9D9)),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Container availablePlaces(
  BuildContext context,
  String PlaceName,
) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          // ignore: unnecessary_new
          child: new InkWell(
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
                color: Color(0xF5F5F5F5),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.055, 0, width * 0.055, height * 0),
                child: Center(
                    child: Text(
                  "$PlaceName",
                  overflow: TextOverflow.fade,
                )),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.05,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xffF5F5F5),
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PlaceInfo()),
              // );
            },
          ),
        ),
      ],
    ),
  );
}
