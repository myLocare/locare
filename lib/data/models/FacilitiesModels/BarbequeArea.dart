import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class BarbequeArea extends Facility {
  String? name = 'Barbeque Area';
  Widget? icon = Icon(Icons.local_fire_department, color: Colors.black);
  int numberOfItems;

  BarbequeArea({
    required this.numberOfItems,
  }) : super(numberOfItems: numberOfItems);
}
