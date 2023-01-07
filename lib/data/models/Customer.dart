import 'package:locare/data/models/User.dart';

class Customer extends User {
  int customerID;

  Customer({
    required this.customerID,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String country,
    String? image,
    required String status,
  }) : super(
          name: name,
          email: email,
          password: password,
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
      password: json['password'],
      phone: json['phone'],
      country: json['country'],
      image: json['image'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'customerID': customerID,
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'country': country,
        'image': image,
        'status': status,
      };
}
