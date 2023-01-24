import '../../models/Reservation.dart';

class ReservationsVm {
  static Reservation reservation = Reservation(
    placeID: '1',
    customerID: '12',
    dateOfReservation: DateTime.now(),
    dateOfCheckIn: DateTime.now(),
    dateOfCheckOut: DateTime.now(),
    paymentMethod: 'card',
    status: 'pending',
    amountPaid: 1200,
  );
}
