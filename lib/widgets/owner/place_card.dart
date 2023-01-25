// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:locare/data/models/Place.dart';
import 'package:locare/screens/home/place_info.dart';

class OwnerPlaceCard extends StatelessWidget {
  const OwnerPlaceCard({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceInfo(
                      placeID: "2Jf6wIAJu1fCkaIac0Jy",
                      place: place,
                    ),
                  ),
                );
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
                    place.name,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceInfo(
                      placeID: "2Jf6wIAJu1fCkaIac0Jy",
                      place: place,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
