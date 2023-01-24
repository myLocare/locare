import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class Kitchen extends Facility {
  String? name = 'Kitchen';
  Widget? icon = Icon(Icons.restaurant, color: Colors.black);
  int numberOfItems = 0;

  Kitchen({
    this.numberOfItems = 0,
  }) : super(numberOfItems: numberOfItems);
}
