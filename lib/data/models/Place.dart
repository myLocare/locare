import 'package:locare/screens/owner_app/reservations.dart';

class Place {
  String name;
  String description;
  List<String> images;
  String address;
  bool isVerified;
  String ownerID;
  List<dynamic>? reviews = [];
  List<dynamic>? facilities = [];
  double area;
  double price;
  String type;
  double rating = 0.0;
  List<String>? reservationList = [];

  Place({
    required this.name,
    required this.description,
    required this.images,
    required this.address,
    required this.isVerified,
    required this.ownerID,
    this.reviews,
    this.facilities,
    required this.area,
    required this.price,
    required this.type,
    required this.rating,
    this.reservationList,
  });

  Place.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        images = List<String>.from(json['images']),
        address = json['address'],
        isVerified = json['isVerified'],
        ownerID = json['ownerID'],
        reviews = List<String>.from(json['reviews']),
        facilities = json['facilities'],
        area = json['area'].toDouble(),
        price = json['price'].toDouble(),
        type = json['type'],
        reservationList = List<String>.from(json['reservationList']),
        rating = json['rating'].toDouble();

  Map<String, dynamic> toJSON() => {
        'name': name,
        'description': description,
        'images': images,
        'address': address,
        'isVerified': isVerified,
        'ownerID': ownerID,
        'reviews': reviews,
        'facilities': facilities,
        'area': area,
        'price': price,
        'type': type,
        'reservationList': reservationList,
        'rating': rating,
      };
}
