import '../../models/Place.dart';

class SchedulesVm {
  static Place place = Place(
    name: "Ghadeer Resort",
    address: "Ghadeer, Riyadh",
    description: "A beautiful place",
    price: 100,
    rating: 4.5,
    images: ['assets/appartment.png'],
    isVerified: true,
    ownerID: "123",
    area: 1,
    type: "Resort",
    facilities: {"wifi": 2, "parking": 5},
  );
}
