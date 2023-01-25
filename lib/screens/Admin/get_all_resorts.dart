// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'place_verification.dart';

class GetAllPlaces extends StatefulWidget {
  GetAllPlaces({super.key});

  @override
  State<GetAllPlaces> createState() => _GetAllPlacesState();
}

class _GetAllPlacesState extends State<GetAllPlaces> {
  final _getSearch = TextEditingController();
  int _lastLength = 0;

  @override
  void dispose() {
    _getSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("All Places", style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // icon
          IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyPlaces()),
                );
              }),
              icon: Icon(Icons.arrow_back, color: Colors.black))
        ],
      ),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: searchBar(height),
            ),
            Expanded(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('place').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (_getSearch.text.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) =>
                          listCard(
                        context,
                        snapshot.data!.docs[index]['images'][0],
                        snapshot.data!.docs[index]['name'],
                        snapshot.data!.docs[index]['price'].toDouble(),
                        snapshot.data!.docs[index]['rating'].toDouble(),
                        12,
                        50,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.data!.docs[index]['name']
                            .toString()
                            .toLowerCase()
                            .contains(_getSearch.text.toLowerCase())) {
                          return listCard(
                            context,
                            snapshot.data!.docs[index]['images'][0],
                            snapshot.data!.docs[index]['name'],
                            snapshot.data!.docs[index]['price'].toDouble(),
                            snapshot.data!.docs[index]['rating'].toDouble(),
                            12,
                            50,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  );
                }
              },
            )),
          ]),
        ),
      ),
    );
  }

  Container searchBar(double height) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: -4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      // searchbar
      child: TextField(
          controller: _getSearch,
          decoration: InputDecoration(
            //make shadow for textfield
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              // remove border
              borderSide: BorderSide.none,
            ),
            hintText: '  Find',
            helperStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),

            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: SizedBox(
                  height: height * 0.03,
                  child: SvgPicture.asset("assets/searchnormal1.svg"),
                ),
              ),
            ),
          ),
          // onChanged: (val) {
          //   setState(() {
          //     _getSearch.text = val;
          //   });
          // },
          onChanged: (val) {
            setState(() {
              if (_lastLength < val.length) {
                var chr = val[0];
                val = val.substring(1) + chr;
                _getSearch.text = val;
              } else {
                val = utf8.decode(val.codeUnits.reversed.toList());
              }
              _lastLength = val.length;
              _getSearch.selection = TextSelection.fromPosition(
                  TextPosition(offset: _getSearch.text.length));
            });
          }),
    );
  }

  InkWell listCard(BuildContext context, String img, String name, double price,
      double rating, int reviews, int desFromYou) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width * 0.3,
              height: height * 0.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  child: Image.network(
                    img,
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
                  name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    Text(
                      "$rating",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
                Text(
                  "$desFromYou kilometers away",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
                Text("$price SAR",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
