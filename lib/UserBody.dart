import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      // make border radius to 50 for container
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30, 30.0, 0.0),
        child: Container(
          // make border radius to 50 for container
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(children: [
            searchBar(height: height),
            SizedBox(
              height: height * 0,
            ),
            // searchBar(height: height),
            SizedBox(
              height: height * 0.0248,
            ),
            // HorizontalList(),
            // ResortList(),
          ]),
        ),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: -4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      // searchbar
      child: TextField(
        decoration: InputDecoration(
          //make shadow for textfield
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            // remove border
            borderSide: BorderSide.none,
          ),
          hintText: '  Where to?',
          helperStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),

          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: SizedBox(
                height: height * 0.03,
                child: SvgPicture.asset("assets/searchnormal1.svg"),
              ),
            ),
          ),
          suffixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: SizedBox(
                height: height * 0.03,
                child: SvgPicture.asset("assets/Group 4011.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
