// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locare/data/view_models/owner/available_places.dart';
import 'package:locare/screens/home/place_info.dart';
import 'package:locare/screens/owner_app/add_place.dart';
import 'package:locare/widgets/owner/place_card.dart';

import '../../data/models/Place.dart';

class AvailablePlaces extends StatefulWidget {
  const AvailablePlaces({super.key});

  @override
  State<AvailablePlaces> createState() => _AvailablePlacesState();
}

class _AvailablePlacesState extends State<AvailablePlaces> {
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
          padding: EdgeInsets.fromLTRB(0, height * 0.03, 0, height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Places',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OwnerAddPlace()),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  )),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding:
                EdgeInsets.fromLTRB(width * 0.0, 0, width * 0.0, height * 0.02),
            scrollDirection: Axis.vertical,
            children: [
              OwnerPlaceCard(place: AvailablePlacesVm.place),
              OwnerPlaceCard(place: AvailablePlacesVm.place),
              OwnerPlaceCard(place: AvailablePlacesVm.place),
              OwnerPlaceCard(place: AvailablePlacesVm.place),
            ],
          ),
        ),
      ]),
    );
  }
}
