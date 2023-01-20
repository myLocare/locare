import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference place =
    FirebaseFirestore.instance.collection('place');

// get the list of images as stream
Stream<List<String>> getImages(String placeId) {
  return place.doc(placeId).snapshots().map((snapshot) {
    List<String> images = [];
    if (snapshot.exists) {
      images = List.from(snapshot['images']);
    }
    return images;
  });
}
