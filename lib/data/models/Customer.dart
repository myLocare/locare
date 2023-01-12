import 'package:locare/data/models/Place.dart';
import 'package:locare/data/models/User.dart';

class Customer extends User {
  int customerID;
  List<Place> favoriteList;

  Customer({
    required this.customerID,
    required String name,
    required String email,
    required String phone,
    required String country,
    String? image,
    required String status,
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
      favoriteList: json['favoriteList']
          .map<Place>((place) => Place.fromJson(place))
          .toList(),
    );
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

  void addFavorite(Place place) {
    favoriteList.add(place);
  }

  void removeFavorite(Place place) {
    favoriteList.remove(place);
  }

  List<Place> getFavoriteList() {
    return favoriteList;
  }
}
