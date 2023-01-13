import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/User.dart';

class Customer extends User {
  String? customerID;
  List<dynamic>? favoriteList;

  Customer({
    this.customerID,
    String? name,
    String? email,
    String? phone,
    String? country,
    String? image,
    String? status,
    this.favoriteList = const [],
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
        favoriteList: json['favoriteList']);
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
      };
}
