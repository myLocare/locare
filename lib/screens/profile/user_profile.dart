import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/widgets/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final customerInfo =
        FirebaseFirestore.instance.collection('Customer').doc(user.uid);
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: customerInfo.snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  ('Name: ${snapshot.data!.get('name')}\nCity: ${snapshot.data!.get('city')}\nPhone Number: ${snapshot.data!.get('phoneNumber')}'),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                );
              } else {
                return Text('Loading...');
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              ('ID: ${user.uid}\nEmail: ${user.email}\nName:'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            label: 'Sign Out',
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
