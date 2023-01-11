import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Place.dart';

class PlaceService {
  FirebaseFirestore? _firestore;

  List<Place> _place = [];

  List<Place> _getPlace() {
    return _place;
  }

  Future<void> getPlaceDocFromFirebase() async {
    _firestore = FirebaseFirestore.instance;
    await _firestore!.collection('place').get().then((value) {
      value.docs.forEach((element) {
        _place.add(Place.fromJson(element.data()));
      });
    });
    print(_place.toList());
  }
}
