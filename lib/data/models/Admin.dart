import 'package:cloud_firestore/cloud_firestore.dart';
import 'Place.dart';
import 'Review.dart';

class Admin {
  final db = FirebaseFirestore.instance;
  static Admin admin = Admin();

  Future addPlace(Place place) async {
    var docID;
    var dd = await db.collection('place').add(place.toJSON()).then((value) {
      docID = value.id;
      print(docID);
    } // success toast here
        );
    Review review = Review(
      placeID: place.name,
      rating: 0,
      customerID: "empty",
      comment: "empty",
      date: DateTime.now(),
    );
    await db
        .collection("place")
        .doc(docID)
        .collection("Reviews")
        .doc()
        .set(review.toJson() // add review to the place
            );
  }

  Future<List<Place>> getPlace() async {
    var val = await db.collection("place").get();
    var documents = val.docs;
    if (documents.length > 0) {
      try {
        return documents
            .map((e) => Place.fromJson(Map<String, dynamic>.from(e.data())))
            .toList();
      } catch (e) {
        print("Exception $e");
        return [];
      }
    }
    return [];
  }
}
