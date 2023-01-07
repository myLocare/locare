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
  Review review;
  List<Facility> facilities;
  int area;
  int price;
  String type;

  Place({
    required this.name,
    required this.description,
    required this.images,
    required this.address,
    required this.isVerified,
    required this.placeID,
    required this.ownerID,
    required this.review,
    required this.facilities,
    required this.area,
    required this.price,
    required this.type,
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
      review: Review.fromJson(json['review']),
      facilities: json['facilities']
          .map<Facility>((facility) => Facility.fromJson(facility))
          .toList(),
      area: json['area'],
      price: json['price'],
      type: json['type'],
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
        'review': review,
        'facilities': facilities,
        'area': area,
        'price': price,
        'type': type,
      };
}
