import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Place.dart';

final db = FirebaseFirestore.instance;
List<Place> _place = [];

List<Place> _getPlace() {
  return _place;
}

Future<Place> getPlace(String placeID) async {
  var val = await FirebaseFirestore.instance
      .collection("place")
      .where(placeID.toString(), isEqualTo: placeID)
      .get();
  var documents = val.docs;
  if (documents.length > 0) {
    try {
      return Place.fromJson(Map<String, dynamic>.from(documents[0].data()));
    } catch (e) {
      print("Exception $e");
      return Place(
        name: "",
        description: "",
        images: [],
        address: "",
        isVerified: false,
        placeID: "0",
        ownerID: "0",
        reviews: [],
        facilities: [],
        area: 0,
        price: 0,
        type: "",
        rating: 0.0,
      );
    }
  }
  return Place(
    name: "",
    description: "",
    images: [],
    address: "",
    isVerified: false,
    placeID: "0",
    ownerID: "0",
    reviews: [],
    facilities: [],
    area: 0,
    price: 0,
    type: "",
    rating: 0.0,
  );
}
