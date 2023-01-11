class Review {
  int reviewID;
  int placeID;
  int userID;
  int rating;
  String comment;
  String date;

  Review({
    required this.reviewID,
    required this.placeID,
    required this.userID,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewID: json['reviewID'],
      placeID: json['placeID'],
      userID: json['userID'],
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'reviewID': reviewID,
        'placeID': placeID,
        'userID': userID,
        'rating': rating,
        'comment': comment,
        'date': date,
      };
}
