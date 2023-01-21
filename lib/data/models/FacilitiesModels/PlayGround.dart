import 'package:flutter/material.dart';
import 'package:locare/data/models/Facility.dart';

class PlayGround extends Facility {
  String? name = 'Play Ground';
  Widget? icon = Icon(Icons.sports_soccer, color: Colors.black);
  int numberOfItems;

  PlayGround({
    required this.numberOfItems,
  }) : super(numberOfItems: numberOfItems);
}
