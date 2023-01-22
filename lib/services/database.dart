import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Customer.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  late Customer customer;
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('Customer');
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
}
