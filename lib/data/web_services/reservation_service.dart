import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Reservation.dart';

CollectionReference db = FirebaseFirestore.instance.collection('Customer');
// get reservation ids by customer id
Future<List<String>> getReservationIdsByCustomerID(String uid) async {
  List<String> reservationIdList = [];
  await db.doc(uid).get().then((value) {
    reservationIdList = List.from(value['reservationList']);
  });
  return reservationIdList;
}

// get reservation ids by customer id as reservation object list
Future<List<Reservation>> getReservationObjectList(String uid) async {
  List<String> reservationIdList = await getReservationIdsByCustomerID(uid);
  List<Reservation> reservationList = [];
  reservationIdList.forEach((element) async {
    DocumentSnapshot reservationDoc = await db.doc(element).get();
    if (reservationDoc.exists) {
      reservationList.add(
          Reservation.fromJson(reservationDoc.data() as Map<String, dynamic>));
    }
  });
  return reservationList;
}
