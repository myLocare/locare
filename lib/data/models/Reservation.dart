class Reservation {
  String placeID;
  String customerID;
  DateTime dateOfReservation;
  DateTime dateOfCheckIn;
  DateTime dateOfCheckOut;
  String paymentMethod;
  String status;
  double amountPaid;

  Reservation({
    required this.placeID,
    required this.customerID,
    required this.dateOfReservation,
    required this.dateOfCheckIn,
    required this.dateOfCheckOut,
    required this.paymentMethod,
    required this.status,
    required this.amountPaid,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      placeID: json['placeID'],
      customerID: json['customerID'],
      dateOfReservation: DateTime.fromMillisecondsSinceEpoch(
          json['dateOfReservation'].millisecondsSinceEpoch),
      dateOfCheckIn: DateTime.fromMillisecondsSinceEpoch(
          json['dateOfCheckIn'].millisecondsSinceEpoch),
      dateOfCheckOut: DateTime.fromMillisecondsSinceEpoch(
          json['dateOfCheckOut'].millisecondsSinceEpoch),
      paymentMethod: json['paymentMethod'],
      status: json['status'],
      amountPaid: json['amountPaid'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'placeID': placeID,
        'customerID': customerID,
        'dateOfReservation': dateOfReservation,
        'dateOfCheckIn': dateOfCheckIn,
        'dateOfCheckOut': dateOfCheckOut,
        'paymentMethod': paymentMethod,
        'status': status,
        'amountPaid': amountPaid,
      };
}
