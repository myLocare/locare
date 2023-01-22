import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Customer.dart';
import 'package:locare/data/models/Place.dart';

class CustomerService {
  final db = FirebaseFirestore.instance;

  String customerID = "ZykNyT0EtoA8M3ZNKT9L";
  Customer? customer;
  Future<Map<String, dynamic>?> getFavList() async {
    final DocumentSnapshot<Map<String, dynamic>> list =
        await db.collection('Customer').doc("ZykNyT0EtoA8M3ZNKT9L").get();
    customer = Customer.fromJson(getFavList() as Map<String, dynamic>);

    return list.data()!;
  }

  late List<String> favIdList = [];

// make a stream that returns favoriteList of a customer by his id
  Stream<List<String>> getFavListIdsByCustomerID(String uid) {
    return db.collection('Customer').doc(uid).snapshots().map((snapshot) {
      if (snapshot.exists) {
        favIdList = List.from(snapshot['favoriteList']);
      }
      return favIdList;
    });
  }
}
