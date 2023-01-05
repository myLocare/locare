// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locare',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Locare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF345EA8),
      appBar: AppBar(
        backgroundColor: Color(0xFF345EA8),
        elevation: 0,
        title: Text(widget.title),
      ),
    );
  }
}
