import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/Place.dart';
import '../models/Review.dart';

class ReviewRepo {
  static Future<void> addReview(
      Place place, String placeID, String comment, int rating) async {
    int ll = 0;
    var reviewsCol = FirebaseFirestore.instance
        .collection("place")
        .doc(placeID)
        .collection("Reviews")
        .get()
        .then((value) => ll = value.size);

    Review review = Review(
      placeID: placeID,
      customerID: FirebaseAuth.instance.currentUser!.uid,
      comment: comment,
      rating: rating,
      date: DateTime.now(),
    );
    FirebaseFirestore.instance
        .collection("place")
        .doc(placeID)
        .collection("Reviews")
        .add(review.toJson());
    // update the place's rating
    place.rating = (place.rating + (rating / ll)) / 2;
    FirebaseFirestore.instance
        .collection("place")
        .doc(placeID)
        .update(place.toJSON());
  }
}
