import 'package:flutter/material.dart';

class Facility {
  String? name = 'Facility';
  Widget? icon = Icon(Icons.home, color: Colors.black);
  int numberOfItems;

  Facility({
    this.name,
    required this.numberOfItems,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      name: json['name'],
      numberOfItems: json['numberOfItems'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'numberOfItems': numberOfItems,
      };
}
