// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPopup extends StatefulWidget {
  const ReviewPopup({super.key});

  @override
  State<ReviewPopup> createState() => _ReviewPopupState();
}

class _ReviewPopupState extends State<ReviewPopup> {
  @override
  Widget build(BuildContext context) {
    // media query
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        shrinkWrap: mounted,
        children: [
          // rating stars
          Text(
            "How was your experience?",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 7),
          Center(
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 40,
              glow: false,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          SizedBox(height: 14),
          // review text field
          Container(
            width: width * 0.8,
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your review here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          // anonymous checkbox
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.06, 0, 0, 0),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text("Post anonymously"),
              ],
            ),
          ),
          // submit button
          // ignore overflow error
          InkWell(
            onTap: () {},
            child: Container(
              width: width * 0.8,
              height: height * 0.05,
              // border radius of 10
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF9A826),
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
