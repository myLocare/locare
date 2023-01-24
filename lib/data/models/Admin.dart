import 'package:cloud_firestore/cloud_firestore.dart';
import 'Place.dart';

class Admin {
  final db = FirebaseFirestore.instance;
  static Admin admin = Admin();

  void addPlace(Place place) async {
    await db.collection('place').add(place.toJSON());
    print("The place has been added");
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
