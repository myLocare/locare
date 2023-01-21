import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class Wifi extends Facility {
  String? name = 'Wifi';
  Widget? icon = Icon(Icons.wifi, color: Colors.black);
  int numberOfItems;

  Wifi({
    this.numberOfItems = 0,
  }) : super(numberOfItems: numberOfItems);
}
