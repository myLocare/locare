import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class BarbequeArea extends Facility {
  String? name = 'Barbeque Area';
  Widget? icon = Icon(Icons.local_fire_department, color: Colors.black);
  int numberOfItems = 0;

  BarbequeArea({
    this.numberOfItems = 0,
  }) : super(numberOfItems: numberOfItems);
}
