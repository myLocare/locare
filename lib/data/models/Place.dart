import 'package:locare/data/models/Facility.dart';
import 'package:locare/data/models/Review.dart';

class Place {
  String name;
  String description;
  List<String> images;
  String address;
  bool isVerified;
  int placeID;
  int ownerID;
  late List<Review> reviews;
  List<Facility> facilities;
  int area;
  int price;
  String type;
  double rating = 0.0;

  Place({
    required this.name,
    required this.description,
    required this.images,
    required this.address,
    required this.isVerified,
    required this.placeID,
    required this.ownerID,
    List<Review>? reviews,
    required this.facilities,
    required this.area,
    required this.price,
    required this.type,
    this.rating = 0.0,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      description: json['description'],
      images: json['images'].cast<String>(),
      address: json['address'],
      isVerified: json['isVerified'],
      placeID: json['placeID'],
      ownerID: json['ownerID'],
      reviews: json['reviews']
          .map<Review>((review) => Review.fromJson(review))
          .toList(),
      facilities: json['facilities']
          .map<Facility>((facility) => Facility.fromJson(facility))
          .toList(),
      area: json['area'],
      price: json['price'],
      type: json['type'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'name': name,
        'description': description,
        'images': images,
        'address': address,
        'isVerified': isVerified,
        'placeID': placeID,
        'ownerID': ownerID,
        'reviews': reviews,
        'facilities': facilities,
        'area': area,
        'price': price,
        'type': type,
        'rating': rating,
      };
}
