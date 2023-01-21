import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference customer =
      FirebaseFirestore.instance.collection('Customer');
  Future updateUserData(String name, String city, String phoneNumber) async {
    return await customer
        .doc(uid)
        .set({
          'name': name,
          'city': city,
          'phoneNumber': phoneNumber,
        })
        .then((_) => print("User Added"))
        .catchError((error) => print('Add failed: $error'));
  }
}
