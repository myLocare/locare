import 'Review.dart';

class Place {
  String name;
  String description;
  List<String> images;
  String address;
  bool isVerified = false;
  String ownerID;
  Map<String, int>? facilities;
  double area;
  double price;
  String type;
  double rating = 0.0;
  List<String>? reservationList = [];

  // Map<String, dynamic> review = Review(
  //         placeID: " ",
  //         customerID: " ",
  //         rating: 1,
  //         comment: " ",
  //         date: DateTime.now())
  //     .toJson();

  Place({
    required this.name,
    required this.description,
    required this.images,
    required this.address,
    required this.isVerified,
    required this.ownerID,
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
        facilities = Map<String, int>.from(json['facilities']),
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
        'facilities': facilities,
        'area': area,
        'price': price,
        'type': type,
        'reservationList': reservationList,
        'rating': rating,
      };
}
