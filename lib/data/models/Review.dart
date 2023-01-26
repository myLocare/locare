class Review {
  String placeID;
  String customerID;
  int rating;
  String comment;
  DateTime date;

  Review({
    required this.placeID,
    required this.customerID,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      placeID: json['placeID'],
      customerID: json['customerID'],
      rating: json['rating'].toInt(),
      comment: json['comment'],
      date: json['date'].toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        'placeID': placeID,
        'customerID': customerID,
        'rating': rating,
        'comment': comment,
        'date': date,
      };
}
