import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/pages/screens/FavPage.dart';
import 'package:locare/pages/screens/placeInfo.dart';
import 'package:locare/pages/screens/userBody.dart';

class reservations extends StatefulWidget {
  const reservations({super.key});

  @override
  State<reservations> createState() => _reservationsState();
}

class _reservationsState extends State<reservations> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
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
                reservation_container(
                    context, "The summer resort - 26378", "Nov 20"),
                reservation_container(
                    context, "The summer resort - 26392", "Jan 23"),
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
            padding:
                EdgeInsets.fromLTRB(0.0, height * 0.01, 0.0, height * 0.02),
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
                reservation_container(
                    context, "The winter resort - 24378", "Nov 20"),
                reservation_container(
                    context, "The idk resort - 23485", "Jan 23"),
              ],
            ),
          ),
        ]),
      ),
    ]);
  }
}

Container reservation_container(
  BuildContext context,
  String reservationData,
  String reservationDate,
) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    child: Row(
      children: [
        Container(
          width: width * 0.15,
          height: height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xF5F5F5F5),
          ),
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.02, height * 0),
            child: Center(
                child: Text("$reservationDate", style: TextStyle(fontSize: 9))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),

          // ignore: unnecessary_new
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlaceInfo()),
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
                child: Center(child: Text("$reservationData")),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
