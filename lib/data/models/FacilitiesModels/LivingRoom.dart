import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class LivingRoom extends Facility {
  String? name = 'Living Room';
  Widget? icon = Icon(Icons.tv, color: Colors.black);
  int numberOfItems;

  LivingRoom({
    required this.numberOfItems,
  }) : super(numberOfItems: numberOfItems);
}
