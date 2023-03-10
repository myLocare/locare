// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Place.dart';

final db = FirebaseFirestore.instance;
final CollectionReference customer = db.collection('Customer');
final CollectionReference place = db.collection('place');

//get a list from an array from a document in customer collection
Future<List<String>> getFavListIdsByCustomerID(String uid) async {
  List<String> favIdList = [];
  await customer.doc(uid).get().then((value) {
    favIdList = List.from(value['favoriteList']);
  });
  return favIdList;
}

Future<List<Place>> getPlaceObjectList(String uid) async {
  List<String> favList = await getFavListIdsByCustomerID(uid);
  List<Place> favPlaceList = [];
  favList.forEach((element) async {
    DocumentSnapshot placeDoc = await place.doc(element).get();
    if (placeDoc.exists) {
      favPlaceList.add(Place.fromJson(placeDoc.data() as Map<String, dynamic>));
    }
  });
  return favPlaceList;
}

// add a place to the favorite list of a customer
Future<void> addPlaceToFavList(String uid, String placeId) async {
  await customer.doc(uid).update({
    'favoriteList': FieldValue.arrayUnion([placeId])
  });
  print("added");
  List<String> favList = [];
  customer.doc(uid).get().then((value) {
    favList = List.from(value['favoriteList']);
    // print(favList);
  });
}

// remove a place from the favorite list of a customer
Future<void> removePlaceFromFavList(String uid, String placeId) async {
  await customer.doc(uid).update({
    'favoriteList': FieldValue.arrayRemove([placeId])
  });
  print("removed");
  List<String> favList = [];
  customer.doc(uid).get().then((value) {
    favList = List.from(value['favoriteList']);
    // print(favList);
  });
}

// check if a place is in the favorite list of a customer without future
bool isPlaceInFavListSync(String uid, String placeId) {
  List<String> favList = [];
  customer.doc(uid).get().then((value) {
    favList = List.from(value['favoriteList']);
    print(favList);
  });
  if (favList.contains(placeId)) {
    print("true");
  } else {
    print("false");
  }
  return favList.contains(placeId);
}
