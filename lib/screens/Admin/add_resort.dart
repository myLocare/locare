// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:locare/data/models/Admin.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/screens/Admin/get_all_resorts.dart';

class AddResort extends StatelessWidget {
  AddResort({super.key});
  final _name = TextEditingController();
  final _ownerID = TextEditingController();
  final _image = TextEditingController();
  final _description = TextEditingController();
  final _address = TextEditingController();
  final _area = TextEditingController();
  final _type = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _ownerID.dispose();
    _image.dispose();
    _description.dispose();
    _address.dispose();
    _area.dispose();
    _type.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            "Add Resort",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetAllPlaces()),
                );
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SizedBox(
            width: width,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Place Name',
                  ),
                  controller: _name,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'OwnerID',
                  ),
                  controller: _ownerID,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image',
                  ),
                  controller: _image,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  controller: _description,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  controller: _address,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Area',
                  ),
                  controller: _area,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type',
                  ),
                  controller: _type,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ElevatedButton(
                    onPressed: () async {
                      Place tempPlace = Place(
                        name: _name.text,
                        ownerID: _ownerID.text,
                        description: _description.text,
                        address: _address.text,
                        area: double.parse(_area.text),
                        type: _type.text,
                        facilities: {},
                        images: [_image.text],
                        isVerified: true,
                        price: 0,
                        rating: 0,
                        reservationList: [""],
                      );
                      Admin.admin.addPlace(tempPlace);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )),
      ),
    );
  }
}
