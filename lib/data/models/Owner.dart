import 'package:locare/data/models/User.dart';

class Owner extends User {
  int ownerID;

  Owner({
    required this.ownerID,
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

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      ownerID: json['ownerID'],
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
        'ownerID': ownerID,
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'country': country,
        'image': image,
        'status': status,
      };
}
