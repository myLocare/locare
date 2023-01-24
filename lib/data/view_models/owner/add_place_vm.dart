import 'package:locare/data/models/FacilitiesModels/BarbequeArea.dart';
import 'package:locare/data/models/FacilitiesModels/Kitchen.dart';
import 'package:locare/data/models/FacilitiesModels/LivingRoom.dart';
import 'package:locare/data/models/FacilitiesModels/PlayGround.dart';
import 'package:locare/data/models/FacilitiesModels/Pool.dart';
import 'package:locare/data/models/FacilitiesModels/wifi.dart';
import 'package:locare/data/models/Facility.dart';

class AddPlaceVm {
  //   Facility pool = Pool();
  // Facility wifi = Wifi();
  // Facility kitchen = Kitchen();
  // Facility livingRoom = LivingRoom();
  // Facility playGround = PlayGround();
  // Facility barbequeArea = BarbequeArea();
  static List<Facility> facilities = [
    Pool(),
    Wifi(),
    Kitchen(),
    LivingRoom(),
    PlayGround(),
    BarbequeArea(),
  ];
  static void incrementNumberOfItems(int index) {
    facilities[index].numberOfItems++;
  }

  static void decrementNumberOfItems(int index) {
    //decrement only if the number of items is greater than 0
    if (facilities[index].numberOfItems > 0) {
      facilities[index].numberOfItems--;
    }
  }
}
