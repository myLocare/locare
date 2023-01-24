import 'package:flutter/material.dart';
import '../data/models/Place.dart';
import '../screens/home/place_info.dart';
import '../screens/home_base.dart';

class listCard1 extends StatelessWidget {
  const listCard1({
    Key? key,
    required this.context,
    required this.place,
    required this.placeID,
  }) : super(key: key);

  final BuildContext context;
  final Place place;
  final String placeID;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PlaceInfo(place: place, placeID: placeID, favList: favList),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            width: width * 0.9,
            height: height * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                place.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                place.name,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Text(
                    "${place.rating}",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${place.address}",
                style: TextStyle(fontSize: 17, color: Colors.grey),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.007,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("${place.price} SAR",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
        ],
      ),
    );
  }
}
