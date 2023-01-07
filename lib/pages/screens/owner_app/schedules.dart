import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/pages/screens/FavPage.dart';
import 'package:locare/pages/screens/placeInfo.dart';
import 'package:locare/pages/screens/userBody.dart';

class schedules extends StatefulWidget {
  const schedules({super.key});

  @override
  State<schedules> createState() => _schedulesState();
}

class _schedulesState extends State<schedules> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
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
              'Choose a place',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                placeScheduleCard(context, "The Ghadeer Resort"),
                placeScheduleCard(context, "Dewaniyah Fartah"),
                placeScheduleCard(context, "November moon"),
              ],
            ),
          ),
        ]),
      ),
    ]);
  }
}

Padding placeScheduleCard(
  BuildContext context,
  String PlaceName,
) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: new InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlaceInfo()),
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
          child: Center(
              child: Text(
            "$PlaceName",
            overflow: TextOverflow.fade,
          )),
        ),
      ),
    ),
  );
}
