// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locare/data/models/Customer.dart';
import 'package:locare/data/models/FacilitiesModels/BarbequeArea.dart';
import 'package:locare/data/models/FacilitiesModels/LivingRoom.dart';
import 'package:locare/data/models/FacilitiesModels/PlayGround.dart';
import 'package:locare/data/models/FacilitiesModels/Kitchen.dart';
import 'package:locare/data/models/FacilitiesModels/Pool.dart';
import 'package:locare/data/models/FacilitiesModels/wifi.dart';
import 'package:locare/data/models/Facility.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/screens/home/select_date.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../data/models/Review.dart';
import '../../data/repository/customer_rep.dart';
import '../../widgets/review_card.dart';

class PlaceInfo extends StatefulWidget {
  PlaceInfo({
    super.key,
    required this.place,
    required this.placeID,
    // required this.isFav,
  });
  // String customerID = "ZykNyT0EtoA8M3ZNKT9L";

  final Place place;
  final String placeID;

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<dynamic> favList11 = [];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    favList11 = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String customerID = FirebaseAuth.instance.currentUser!.uid;
    bool isFav = false;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  height: height * 0.45, child: placeImages(width, height)),
              AppBar(
                backgroundColor: Color(0xFF345EA8),
                elevation: 0,
                toolbarHeight: 0,
              ),
              onPressed: () {
                // setState(() {
                //   widget.place. = !widget.place.isFavorite;
                // });
              },
            ),
          ),
        ],
      ),
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                placeImages(width, height),
              ],
            ),
          ),
          Expanded(child: placeContent(height, width))
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12.0,
              spreadRadius: -5.0,
              offset: Offset(0.0, -3.0),
            )
          ],
        ),
        height: height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //make button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectDate()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF345EA8),
                minimumSize: const Size(190, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(fontSize: 20),
              ),
            ),

            //price
            Text(
              '${widget.place.price} SAR/Period',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider placeImages(double width, double height) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.35,
        aspectRatio: 1,
        viewportFraction: 1,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        for (var i = 0; i < widget.place.images.length; i++)
          Container(
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${widget.place.images[i]}"),
              ),
            ),
          ),
      ],
    );
  }

  ListView placeContent(double height, double width) {
    var keys = widget.place.facilities!.keys;
    return ListView(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      scrollDirection: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.place.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Text(
                  widget.place.rating.toString(),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                widget.place.rating >= 1
                    ? const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    : const Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
              ],
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.place.type,
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.left),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${widget.place.reviews!.length.toString()} reviews",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.black54),
                      Text(" " + widget.place.address,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.left),
                    ],
                  ),
                  Icon(Icons.share, color: Colors.grey),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.space_bar, color: Colors.black54),
                  Text(' ${widget.place.area} m²',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.left),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.people, color: Colors.black54),
                  Text(' Families and Singles',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.left),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.05,
          indent: 20,
          endIndent: 20,
        ),
        // Facilities section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Facilities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GridView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                childAspectRatio: 5,
              ),
              children: <Widget>[
                if (keys.contains("Pool"))
                  getFacilityCard(Pool(
                      numberOfItems: widget.place.facilities!["Pool"] ?? 0)),
                if (keys.contains("LivingRoom"))
                  getFacilityCard(LivingRoom(
                      numberOfItems:
                          widget.place.facilities!["LivingRoom"] ?? 0)),
                if (keys.contains("Kitchen"))
                  getFacilityCard(Kitchen(
                      numberOfItems: widget.place.facilities!["Kitchen"] ?? 0)),
                if (keys.contains("Wifi"))
                  getFacilityCard(Wifi(
                      numberOfItems: widget.place.facilities!["Wifi"] ?? 0)),
                if (keys.contains("BarbequeArea"))
                  getFacilityCard(BarbequeArea(
                      numberOfItems:
                          widget.place.facilities!["BarbequeArea"] ?? 0)),
                if (keys.contains("PlayGround"))
                  getFacilityCard(PlayGround(
                      numberOfItems:
                          widget.place.facilities!["PlayGround"] ?? 0))
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'Resort Map',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Open in Map',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Icon(Icons.share, color: Colors.grey),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          height: height * 0.3,
          width: width * 0.9,
          child: Image.asset('assets/map.jpg', fit: BoxFit.fill),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'About',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        Text(
          widget.place.description,
          style: TextStyle(fontSize: 18),
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.03,
          indent: 20,
          endIndent: 20,
        ),
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.left,
        ),
        // Column(
        //   children: [
        //     for (var review in widget.place.reviews!)
        //       ReviewCard(
        //         review: review,
        //       ),
        //   ],
        // ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("place")
                .doc(widget.placeID)
                .collection("Reviews")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Review review =
                        Review.fromJson(snapshot.data!.docs[index].data());
                    return ReviewCard(
                      review: review,
                    );
                  },
                );
              } else {
                return Text('No reviews yet');
              }
            }),
        ReviewCard(
          review: Review(
            placeID: widget.placeID,
            userID: FirebaseAuth.instance.currentUser!.uid,
            rating: 5,
            comment: 'This is a comment',
            date: DateTime.now(),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => null,
            //   ),
            // );
          },
          child: Container(
            height: height * 0.07,
            width: width * 0.9,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Text(
                  'Add a review',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
      ],
    );
  }
}

Container getFacilityCard(Facility facility) {
  return Container(
    child: Row(
      children: [
        facility.icon ?? const Icon(Icons.error),
        Text(" " + facility.numberOfItems.toString() + " ",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text(
          facility.name ?? 'Error',
          style: const TextStyle(fontSize: 14),
        )
      ],
    ),
  );
}
