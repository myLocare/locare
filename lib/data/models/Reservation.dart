class Reservation {
  int reservationID;
  int placeID;
  int customerID;
  DateTime date;
  String paymentMethod;
  String status;

  Reservation({
    required this.reservationID,
    required this.placeID,
    required this.customerID,
    required this.date,
    required this.paymentMethod,
    required this.status,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationID: json['reservationID'],
      placeID: json['placeID'],
      customerID: json['customerID'],
      date: DateTime.parse(json['date']),
      paymentMethod: json['paymentMethod'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'reservationID': reservationID,
        'placeID': placeID,
        'customerID': customerID,
        'date': date.toIso8601String(),
        'paymentMethod': paymentMethod,
        'status': status,
      };
}
