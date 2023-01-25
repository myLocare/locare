import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/User.dart';

class Customer extends User {
  String? customerID;
  List<dynamic> favoriteList;
  List<dynamic> reservationList;

// make empty constructor

  Customer({
    this.customerID,
    required String name,
    required String email,
    String? phone,
    String? country,
    String? image,
    String? status,
    required this.favoriteList,
    required this.reservationList,
  }) : super(
          name: name,
          email: email,
          phone: phone,
          country: country,
          image: image,
          status: status,
        );

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        customerID: json['customerID'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        country: json['country'],
        image: json['image'],
        status: json['status'],
        favoriteList: List<dynamic>.from(json['favoriteList']),
        reservationList: List<dynamic>.from(json['reservationList']));
  }

  Map<String, dynamic> toJson() => {
        'customerID': customerID,
        'name': name,
        'email': email,
        'phone': phone,
        'country': country,
        'image': image,
        'status': status,
        'favoriteList': favoriteList,
        'reservationList': reservationList,
      };
}
