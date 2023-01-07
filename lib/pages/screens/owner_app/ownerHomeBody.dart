// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:locare/pages/screens/owner_app/available_places.dart';
import 'package:locare/pages/screens/owner_app/reservations.dart';
import 'package:locare/pages/screens/owner_app/schedules.dart';

class OwnerHomeBody extends StatefulWidget {
  const OwnerHomeBody({super.key});

  @override
  State<OwnerHomeBody> createState() => _OwnerHomeBodyState();
}

int _Index = 0;

final List<Widget> _pages = [available_places(), reservations(), schedules()];

class _OwnerHomeBodyState extends State<OwnerHomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Locare"),
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
              gap: 5,
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
                    print("Home");
                    // print the device's width and height
                    print("Width: $width");
                    print("Height: $height");
                  },
                ),
                GButton(
                  icon: Icons.monetization_on_outlined,
                  text: 'Reservations',
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Schedules',
                ),
                GButton(
                  icon: Icons.attach_money,
                  text: 'Payments',
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
              onPressed: () {},
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
