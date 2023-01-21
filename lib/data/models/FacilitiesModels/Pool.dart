import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class Pool extends Facility {
  String? name = 'Pool';
  Widget? icon = Icon(Icons.pool, color: Colors.black);
  int numberOfItems;

  Pool({
    required this.numberOfItems,
  }) : super(numberOfItems: numberOfItems);
}
