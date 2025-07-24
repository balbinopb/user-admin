import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_admin/main.dart';
import 'package:user_admin/screens/admin_home_screen.dart';
import 'package:user_admin/screens/user_home_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final pwController = TextEditingController();

  final List<String> adminEmails = ['admin@gmail.com'];

  Future register() async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwController.text.trim(),
      );
      logger.d("Successs");
      // Get.snackbar('Success', 'User registered: ${credential}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      } else {
        Get.snackbar('Error', 'Authentication error: ${e.message}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future login() async {
    try {
      final credential= await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwController.text.trim(),
      );
      if (credential.user != null) {
        final email = credential.user!.email;

        if (adminEmails.contains(email)) {
          logger.d("enter to admin");
          Get.to(() => AdminHomeScreen());
        } else {
          logger.d("enter to USEr");//get this
          Get.to(() => UserHomeScreen());
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
