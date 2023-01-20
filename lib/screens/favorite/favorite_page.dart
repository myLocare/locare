// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:locare/data/repository/customer_rep.dart';
import 'package:locare/widgets/fav_list_card.dart';

import '../../data/models/Place.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  String customerID = "ZykNyT0EtoA8M3ZNKT9L";
  late Future<List<Place>> favPlaces;
  @override
  void initState() {
    super.initState();
    favPlaces = getPlaceObjectList(customerID);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30, 30.0, 0.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Favorite Places",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // refresh button
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    favPlaces = getPlaceObjectList(customerID);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: FutureBuilder<List<Place?>>(
                future: favPlaces,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return FavCard(
                            place: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("No Favorite Places"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
