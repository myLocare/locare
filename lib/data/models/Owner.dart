import 'package:locare/data/models/User.dart';
import 'package:locare/data/models/Place.dart';

class Owner extends User {
  // int ownerID;
  late List<Place> ownedPlaces;
  String? ownerID;

  Owner(
      {this.ownerID,
      required String name,
      required String email,
      required String phone,
      required String country,
      String? image,
      required String status,
      List<Place>? ownedPlaces})
      : super(
          name: name,
          email: email,
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
      phone: json['phone'],
      country: json['country'],
      image: json['image'],
      status: json['status'],
      ownedPlaces: json['ownedPlaces']
          .map<Place>((place) => Place.fromJson(place))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'ownerID': ownerID,
        'name': name,
        'email': email,
        'phone': phone,
        'country': country,
        'image': image,
        'status': status,
        'ownedPlaces': ownedPlaces,
      };
}
