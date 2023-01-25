// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:locare/data/web_services/place_API.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:locare/data/repository/customer_rep.dart';
import 'package:locare/screens/Admin/add_resort.dart';
import 'package:locare/screens/bookings/bookings_page.dart';
import 'package:locare/screens/favorite/favorite_page.dart';
import 'package:locare/screens/home/user_home_view.dart';
import '../data/models/Customer.dart';
import 'profile/user_profile.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

int _Index = 0;
final List<Widget> _pages = [
  UserBody(),
  BookingsPage(),
  FavPage(),
  ProfileView()
];

// Future _getCustomer() async {
//   final user = FirebaseAuth.instance.currentUser!;
//   final customer = await FirebaseFirestore.instance
//       .collection('Customer')
//       .doc(user.uid)
//       .get();
//   return customer;
// }

// get customer by stream

class _HomeBodyState extends State<HomeBody> {
  @override
  // initState() {
  //   super.initState();
  //   _getCustomer().then((value) {
  //     setState(() {
  //       favList = value['favoriteList'];
  //     });
  //   });
  // }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    // user provider

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      // make a future builder to get the customer data
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: Text("Locare ${user.email}"),
          title: Text("Locare "),
          backgroundColor: const Color(0xFF345EA8),
          elevation: 0,
        ),
        body: IndexedStack(
          index: _Index,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          height: height * 0.08,
          color: Color(0xFF345EA8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: GNav(
              gap: 8,
              activeColor: Color(0xFF345EA8),
              backgroundColor: Color(0xFF345EA8),
              color: Color(0xFFFDFDFD),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Color(0xFFFDFDFD),
              selectedIndex: _Index,
              onTabChange: (index) {
                setState(() {
                  _Index = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  onPressed: () {
                    if (mounted) {
                      setState(() {});
                    }
                  },
                ),
                GButton(
                  icon: Icons.monetization_on_outlined,
                  text: 'Bookings',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 50),
          child: SizedBox(
            width: width * 0.18,
            height: height * 0.2,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF345EA8),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddResort(),
                  ),
                );
              },
              elevation: 0,
              child: CircleAvatar(
                radius: width * 0.2,
                backgroundColor: Color(0xFF345EA8),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF345EA8),
                  radius: width * 0.4,
                  child: Image.asset('assets/Ellipse 1.png'),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
