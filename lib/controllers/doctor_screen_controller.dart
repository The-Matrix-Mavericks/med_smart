// to get the info of all the doctors from the firebase to display on the Home()

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DoctorScreenController extends GetxController {
  var searchQueryController = TextEditingController();
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var doctors = FirebaseFirestore.instance.collection('doctor').get();
    return doctors;
  }
}
