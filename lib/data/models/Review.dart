class Review {
  String placeID;
  String userID;
  int rating;
  String comment;
  DateTime date;

  Review({
    required this.placeID,
    required this.userID,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      placeID: json['placeID'],
      userID: json['userID'],
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'].toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        'placeID': placeID,
        'userID': userID,
        'rating': rating,
        'comment': comment,
        'date': date,
      };
}
