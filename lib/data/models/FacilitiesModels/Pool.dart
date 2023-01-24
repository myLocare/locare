import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class Pool extends Facility {
  String? name = 'Pool';
  Widget? icon = Icon(Icons.pool, color: Colors.black);
  int numberOfItems = 0;

  Pool({
    this.numberOfItems = 0,
  }) : super(numberOfItems: numberOfItems);
}
