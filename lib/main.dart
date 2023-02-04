// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locare/firebase_options.dart';
import 'package:locare/screens/login/user/user_login_view.dart';
import 'package:locare/screens/owner_app/owner_home_body.dart';
import 'package:locare/screens/signup/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/home_base.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'locare',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final isCustomer = ValueNotifier<bool>(true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final CollectionReference customerCollection =
              FirebaseFirestore.instance.collection('Customer');
          final CollectionReference ownerCollection =
              FirebaseFirestore.instance.collection('Owner');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            customerCollection
                .doc(snapshot.data!.uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                print('Document data: ${documentSnapshot.data()}');
                // return const HomeBody();
                // make a golbal variable and set it to true
                bool isCustomer = true;
              } else {
                // print('Document does not exist on the database');
                // return const OwnerHomeBody();
                bool isCustomer = false;
              }
            });
            if (isCustomer) {
              return const HomeBody();
            } else {
              return const OwnerHomeBody();
            }
            // print(snapshot.data!.uid);
            // ownerCollection
            //     .doc(snapshot.data!.uid)
            //     .get()
            //     .then((DocumentSnapshot documentSnapshot) {
            //   if (documentSnapshot.exists) {
            //     print('Document data: ${documentSnapshot.data()}');
            //     return const OwnerHomeBody();
            //   } else {
            //     // print('Document does not exist on the database');
            //     return const HomeBody();
            //   }
            // });

            // return const HomeBody();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
