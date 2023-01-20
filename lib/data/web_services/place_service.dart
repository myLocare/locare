import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Place.dart';

final db = FirebaseFirestore.instance;
List<Place> _place = [];

List<Place> _getPlace() {
  return _place;
}
