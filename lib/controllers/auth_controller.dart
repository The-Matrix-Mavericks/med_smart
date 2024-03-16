import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_samples/controllers/user_data_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class AuthController extends GetxController {
  UserCredential? userCredential;
  var userNameController = TextEditingController();
  var userAgeController = TextEditingController();
  var userAddressController = TextEditingController();
  var userAboutController = TextEditingController();
  var userHeightController = TextEditingController();
  var userWeightController = TextEditingController();
  var userGenderController = TextEditingController();
  var userPhoneController = TextEditingController();
  var userProfessionController = TextEditingController();

  // // controllers for signup
  // var signup_emailController = TextEditingController();
  // var signup_passwordController = TextEditingController();

  // doctor signup controllers

  // loginUser(context) async {
  //   userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text, password: passwordController.text);
  //   if (userCredential != null) {
  //     VxToast.show(context, msg: "Login successful");
  //     Get.to(() => const Home());
  //   }
  // }

  // signupUser(bool isDoctor, context) async {
  //   userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: signup_emailController.text,
  //       password: signup_passwordController.text);
  //   if (userCredential != null) {
  //     await storeUserdata(userCredential!.user!.uid, fullnameController.text,
  //         signup_emailController.text, isDoctor);
  //     if (userCredential != null) {
  //       Get.to(() => RiveAppHome());
  //       // VxToast.show(context, msg: "Signup successful");
  //     }
  //   }
  // }

  storeUserdata(
      context,
      String uid,
      String userName,
      String userAbout,
      String userAddress,
      String userGender,
      int userPhone,
      int userAge,
      int userWeight,
      int userHeight,
      String userProfession) async {
    var store = FirebaseFirestore.instance.collection('user').doc(uid);

    // await store.set({
    //   'userName': userNameController.text,
    //   'userAbout': userAboutController.text,
    //   'userAddress': userAddressController.text,
    //   'userGender': userGenderController.text,
    //   'userPhone': userPhoneController.text,
    //   'userAge': userAgeController.text,
    //   'userWeight': userWeightController.text,
    //   'userHeight': userHeightController.text,
    //   'userID': FirebaseAuth.instance.currentUser?.uid,
    //   'userEmail': FirebaseAuth.instance.currentUser?.email
    // });

    await store.set({
      'userName': userName,
      'userAbout': userAbout,
      'userAddress': userAddress,
      'userGender': userGender,
      'userPhone': userPhone,
      'userAge': userAge,
      'userWeight': userWeight,
      'userProfession': userProfession,
      'userHeight': userHeight,
      'userID': FirebaseAuth.instance.currentUser?.uid,
      'userEmail': FirebaseAuth.instance.currentUser?.email
    });
    // if (!userName.isEmpty) {
    //   _showToast(context);
    // }
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Data Saved'),
        action: SnackBarAction(
            label: 'SAVED', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  // signout(context) async {
  //   await FirebaseAuth.instance.signOut();

  //   Get.offAll(() => LoginOrSignupScreen());
  // }
}
