// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'homeBody.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color(0xFF345EA8),
        // background color
        scaffoldBackgroundColor: const Color(0xFF345EA8),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeBody(),
    );
  }
}
