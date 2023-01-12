import 'package:cloud_firestore/cloud_firestore.dart';
import 'Place.dart';

class Admin {
  final db = FirebaseFirestore.instance;
  static Admin admin = Admin();

  void addPlace(Place place) async {
    await db.collection('place').add({
      'name': place.name,
      'description': place.description,
      'images': place.images,
      'address': place.address,
      'isVerified': place.isVerified,
      'placeID': place.placeID,
      'ownerID': place.ownerID,
      'reviews': place.reviews,
      'facilities': place.facilities,
      'area': place.area,
      'price': place.price,
      'type': place.type,
      'rating': place.rating,
    });
    print("DONE");
  }
}
