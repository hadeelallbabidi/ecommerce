import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeres/constants/constants.dart';
import 'package:ecommeres/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseException catch (error) {
      Navigator.of(context).pop();
      ShowMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> singUp(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          id: userCredential.user!.uid, name: name, email: email, image: null);
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      return true;
    } on FirebaseException catch (error) {
      Navigator.of(context).pop();
      ShowMessage(error.code.toString());
      return false;
    }
  }

  void singOut() async {
    await _auth.signOut();
  }

  Future<bool> ChanngePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      _auth.currentUser!.updatePassword(password);
      Navigator.of(context, rootNavigator: true).pop();
      ShowMessage("Password Changed");
      Navigator.of(context).pop();
      return true;
    }  on FirebaseAuthException catch (error) {
      Navigator.of(context,rootNavigator: true).pop();
      ShowMessage(error.code.toString());
      return false;
    }
  }
}
