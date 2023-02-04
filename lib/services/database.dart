import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Customer.dart';
import 'package:locare/data/models/Owner.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  late Customer customer;
  late Owner owner;
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('Customer');
  final CollectionReference ownerCollection =
      FirebaseFirestore.instance.collection('Owner');
  Future updateUserData(
      String email, String name, String city, String phoneNumber) async {
    customer = Customer(
        customerID: uid,
        name: name,
        email: email,
        phone: phoneNumber,
        country: city,
        image: '',
        status: 'Active',
        favoriteList: [],
        reservationList: []);
    return await customerCollection.doc(uid).set(customer.toJson());
  }

  Future updateOwnerData(
      String email, String name, String city, String phoneNumber) async {
    owner = Owner(
      ownerID: uid,
      name: name,
      email: email,
      phone: phoneNumber,
      country: city,
      image: '',
      status: 'Active',
      ownedPlaces: [],
    );
    return await ownerCollection.doc(uid).set(customer.toJson());
  }
}
