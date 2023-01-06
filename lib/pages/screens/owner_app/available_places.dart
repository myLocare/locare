import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/pages/screens/FavPage.dart';
import 'package:locare/pages/screens/placeInfo.dart';
import 'package:locare/pages/screens/userBody.dart';

class available_places extends StatefulWidget {
  const available_places({super.key});

  @override
  State<available_places> createState() => _available_placesState();
}

class _available_placesState extends State<available_places> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: height * 0.92,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, height * 0.05, width * 0.3, height * 0.02),
            child: Text(
              'Available Places',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(
                  width * 0.2, 0, width * 0.0, height * 0.02),
              scrollDirection: Axis.vertical,
              children: [
                availablePlaces(context, "Placetttttttttttttttttttttttt 1"),
                availablePlaces(context, "Place 2"),
                availablePlaces(context, "Place 3"),
                availablePlaces(context, "Place 4"),
                availablePlaces(context, "Place 5"),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.01, height * 0.01, width * 0.2, height * 0.01),
                  child: FloatingActionButton(
                    heroTag: null,
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlaceInfo()),
                      );
                    },
                    backgroundColor: Color(0xF5F5F5F5),
                    child: const Icon(Icons.add, color: Color(0xD9D9D9D9)),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ]);
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
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlaceInfo()),
              );
            },
            child: Container(
              width: width * 0.5,
              height: height * 0.06,
              //change container radius
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xF5F5F5F5),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.055, 0, width * 0.055, height * 0),
                child: Center(child: Text("$PlaceName")),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: (() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlaceInfo()),
              )),
          icon: const Icon(Icons.edit),
        )
      ],
    ),
  );
}
