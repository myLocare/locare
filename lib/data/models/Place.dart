import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locare/data/models/Facility.dart';
import 'package:locare/data/models/Review.dart';

class Place {
  String? name;
  String? description;
  List<String>? images;
  String? address;
  bool? isVerified;
  String? placeID;
  String? ownerID;
  List<Review>? reviews;
  List<Facility>? facilities;
  double? area;
  double? price;
  String? type;
  double? rating = 0.0;

  Place({
    this.name,
    this.description,
    this.images,
    this.address,
    this.isVerified,
    this.placeID,
    this.ownerID,
    List<Review>? reviews,
    this.facilities,
    this.area,
    this.price,
    this.type,
    this.rating = 0.0,
  });

  List<String> getImages() {
    List<String> images = [];
    return images;
  }

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

  Future<List<Place>> getAllData() async {
    print("Active Users");
    var val = await FirebaseFirestore.instance.collection("place").get();
    var documents = val.docs;
    print("Documents ${documents.length}");
    if (documents.length > 0) {
      try {
        print("Active ${documents.length}");
        return documents.map((document) {
          Place place =
              Place.fromJson(Map<String, dynamic>.from(document.data()));

          return place;
        }).toList();
      } catch (e) {
        print("Exception $e");
        return [];
      }
    }
    return [];
  }

  // Future<Place> getPlace(int placeID) async {
  //   var val = await FirebaseFirestore.instance
  //       .collection("place")
  //       .where("placeID", isEqualTo: placeID)
  //       .get();
  //   var documents = val.docs;
  //   if (documents.length > 0) {
  //     try {
  //       return Place.fromJson(Map<String, dynamic>.from(documents[0].data()));
  //     } catch (e) {
  //       print("Exception $e");
  //       return Place(
  //         name: "",
  //         description: "",
  //         images: [],
  //         address: "",
  //         isVerified: false,
  //         placeID: 0,
  //         ownerID: "0",
  //         reviews: [],
  //         facilities: [],
  //         area: 0,
  //         price: 0,
  //         type: "",
  //         rating: 0.0,
  //       );
  //     }
  //   }
  //   return Place(
  //     name: "",
  //     description: "",
  //     images: [],
  //     address: "",
  //     isVerified: false,
  //     placeID: 0,
  //     ownerID: "0",
  //     reviews: [],
  //     facilities: [],
  //     area: 0,
  //     price: 0,
  //     type: "",
  //     rating: 0.0,
  //   );
  // }

  Future<List<Place>> getPlaceByOwner(int ownerID) async {
    var val = await FirebaseFirestore.instance
        .collection("place")
        .where("ownerID", isEqualTo: ownerID)
        .get();
    var documents = val.docs;
    if (documents.length > 0) {
      try {
        return documents.map((document) {
          Place place =
              Place.fromJson(Map<String, dynamic>.from(document.data()));

          return place;
        }).toList();
      } catch (e) {
        print("Exception $e");
        return [];
      }
    }
    return [];
  }
}
