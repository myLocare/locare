// // customer cubit

// import 'package:bloc/bloc.dart';
// import 'package:locare/data/models/Customer.dart';
// import 'package:locare/data/models/User.dart';
// import 'package:locare/services/database.dart';
// import 'package:meta/meta.dart';

// part 'customer_state.dart';

// class CustomerCubit extends Cubit<CustomerState> {
//   CustomerCubit() : super(CustomerInitial());
//   late Customer customer;
//   late User user;
//   late DatabaseService databaseService;
//   void updateUserData(
//       String email, String name, String city, String phoneNumber) async {
//     customer = Customer(
//         customerID: user.uid,
//         name: name,
//         email: email,
//         phone: phoneNumber,
//         country: city,
//         image: '',
//         status: 'Active',
//         favoriteList: [],
//         reservationList: []);
//     await databaseService.customerCollection
//         .doc(user.uid)
//         .set(customer.toJson());
//   }
// }
