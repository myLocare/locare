// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/data/models/Place.dart';

class FavCard extends StatelessWidget {
  const FavCard({
    super.key,
    required this.place,
  });

  final Place? place;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.3,
                height: height * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    // topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(16),
                    // bottomRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    child: Image.network(
                      place!.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place!.name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      Text(
                        "${place!.rating.toDouble()}",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.right,
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  Text(
                    "${place!.area.toDouble()} m²",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  Text("${place!.price.toDouble()} SAR",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
