// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locare/data/models/Admin.dart';
import 'package:locare/data/models/FacilitiesModels/BarbequeArea.dart';
import 'package:locare/data/models/FacilitiesModels/Kitchen.dart';
import 'package:locare/data/models/FacilitiesModels/LivingRoom.dart';
import 'package:locare/data/models/FacilitiesModels/PlayGround.dart';
import 'package:locare/data/models/FacilitiesModels/Pool.dart';
import 'package:locare/data/models/FacilitiesModels/wifi.dart';
import 'package:locare/data/models/Place.dart';
import 'package:locare/data/view_models/owner/add_place_vm.dart';
import 'package:locare/screens/payment/payment_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:locare/widgets/owner/facility_card.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../data/models/Facility.dart';

class OwnerAddPlace extends StatefulWidget {
  OwnerAddPlace({super.key});
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _area = TextEditingController();
  final _type = TextEditingController();
  final _price = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _price.dispose();

    _area.dispose();
    _type.dispose();
  }

  @override
  State<OwnerAddPlace> createState() => _OwnerAddPlaceState();
}

class _OwnerAddPlaceState extends State<OwnerAddPlace> {
  final _formKey = GlobalKey<FormState>();

  // ImagePicker _picker = ImagePicker();
  // List<XFile> _imageFileList = [];
  int selectedImagesFilesLength = 0;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<String> imgURL = [];

  Future getImage() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages == null) return;
    List selectedImagesFiles = selectedImages.map((e) {
      return File(e.path);
    }).toList();

    selectedImages.map((e) async {
      await saveImage(e, selectedImages);
    }).toList();
    setState(() {
      selectedImagesFilesLength += selectedImagesFiles.length;
    });
  }

  Future saveImage(XFile imageFile, List selectedImages) async {
    // final directory = await getApplicationDocumentsDirectory();
    File file = File(imageFile.path);
    String name = basename(imageFile.path);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("images");
    Reference referenceImageToUpload = referenceDirImages.child(name);

    try {
      await referenceImageToUpload.putFile(file);
      imgURL.add(await referenceImageToUpload.getDownloadURL());
      print(imgURL);
    } catch (e) {
      print(e);
    }
  }

  final List<String> items = [
    'Resort',
    'Dewaniyah',
    'Apartment',
    'Camping',
  ];
  String selectedValue = 'Resort';
  void incrementNumberOfItems(int index) {
    setState(() {
      AddPlaceVm.incrementNumberOfItems(index);
    });
  }

  void decrementNumberOfItems(int index) {
    setState(() {
      AddPlaceVm.decrementNumberOfItems(index);
    });
  }

  //create a map

  @override
  Widget build(BuildContext context) {
    Map<String, int> facilitiesMap = {
      'Pool': AddPlaceVm.facilities[0].numberOfItems,
      'Wifi': AddPlaceVm.facilities[1].numberOfItems,
      'Kitchen': AddPlaceVm.facilities[2].numberOfItems,
      'LivingRoom': AddPlaceVm.facilities[3].numberOfItems,
      'PlayGround': AddPlaceVm.facilities[4].numberOfItems,
      'BarbequeArea': AddPlaceVm.facilities[5].numberOfItems,
    };

    facilitiesMap.removeWhere((key, value) => value == 0);
    print(facilitiesMap);

    // print(selectedValue);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: height * 0.045,
          title: Text(
            'Add a place',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Tell us about your place !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 12.0,
                            spreadRadius: -5.0,
                            offset: Offset(
                                0.0, -3.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: ListView(
                                children: [
                                  const Text(
                                    'Place name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  TextFormField(
                                    controller: widget._name,
                                    decoration: const InputDecoration(
                                      hintText: 'What is your place called?',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'حط اسم يا جرار';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Place type',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  DropdownButtonFormField2(
                                    dropdownMaxHeight: height * 0.3,
                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(0.0,
                                              3.0), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    hint: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty';
                                      }
                                      return null;
                                    },
                                    // value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    },
                                    buttonWidth: 140,
                                    itemHeight: 40,
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Place area',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: widget._area,
                                    decoration: const InputDecoration(
                                      hintText: 'How many square meters?',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty';
                                      }
                                      return null;
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Place price',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: widget._price,
                                    decoration: const InputDecoration(
                                      hintText: 'How much is your place?',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Place description',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  SizedBox(height: 10),

                                  TextFormField(
                                    // keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    controller: widget._description,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Describe your place',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Facilities',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ),

                                  //horizontal list
                                  SizedBox(
                                    height: 100,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[0],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(0);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(0);
                                            }),
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[1],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(1);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(1);
                                            }),
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[2],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(2);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(2);
                                            }),
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[3],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(3);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(3);
                                            }),
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[4],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(4);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(4);
                                            }),
                                        FacilityCard(
                                            facility: AddPlaceVm.facilities[5],
                                            onTapIncreament: () {
                                              incrementNumberOfItems(5);
                                            },
                                            onTapDecreament: () {
                                              decrementNumberOfItems(5);
                                            }),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Place Images',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      // Text(
                                      //   '${selectedImagesFilesLength}',
                                      //   style: TextStyle(
                                      //       fontSize: 16,
                                      //       color: Colors.blue,
                                      //       fontWeight: FontWeight.w100),
                                      // ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        elevation: 0,
                                        mini: true,
                                        onPressed: getImage,
                                        backgroundColor: Color(0xF5F5F5F5),
                                        child: const Icon(Icons.photo,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Where is your place?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        elevation: 0,
                                        mini: true,
                                        onPressed: () {
                                          print("انا في موت");
                                        },
                                        backgroundColor: Color(0xF5F5F5F5),
                                        child: const Icon(Icons.location_on,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )))),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12.0,
                spreadRadius: -5.0,
                offset: Offset(0.0, -3.0), // shadow direction: bottom right
              )
            ],
          ),
          height: height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //make button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Place ownerPlace = Place(
                      name: widget._name.text,
                      ownerID: '69',
                      description: widget._description.text,
                      address: 'Dammam',
                      area: double.parse(widget._area.text),
                      type: selectedValue,
                      facilities: facilitiesMap,
                      images: imgURL,
                      isVerified: false,
                      price: double.parse(widget._price.text),
                      rating: 0,
                      reservationList: [],
                    );
                    Admin.admin.addPlace(ownerPlace);
                  }
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
                  'Confirm',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              //price
            ],
          ),
        ),
      ),
    );
  }
}
