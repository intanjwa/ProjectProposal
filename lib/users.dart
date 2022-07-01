import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalassessment/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  storeNewUser(user, context) async {
    var firebaseUser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .set({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login())))
        .catchError((e) {
          print(e);
        });
  }
}

  void newOrder(String _name, String _phone, String _selectedLocation) async {
    //var firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection("order")
        .add({
          'name': _name, 
          'phone': _phone,
          'selectedLocation': _selectedLocation,
          });
  }
