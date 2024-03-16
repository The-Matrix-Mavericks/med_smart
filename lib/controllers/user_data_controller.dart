import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {
  @override
  void onInit() {
    getData = getUserData();
    super.onInit();
  }

  var isLoading = false
      .obs; // when this variable is updaeted, it will automatically setState for the same
  var currentUser = FirebaseAuth.instance.currentUser;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;
  var userAddress = ''.obs;
  var userHeight = ''.obs;
  var userWeight = ''.obs;
  var userAge = ''.obs;
  var userProfession = ''.obs;
  var userGender = ''.obs;
  var userAbout = ''.obs;
  Future? getData;

  getUserData() async {
    isLoading(true);
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();
    var userData = user.data();
    userName.value = user!['userName'] ?? "";
    userAbout.value = user!['userAbout'] ?? "";
    userEmail.value = currentUser!.email ?? "";
    userAge.value = user!['userAge'] ?? "";
    userAddress.value = user!['userAddress'] ?? "";
    userPhone.value = user!['userPhone'] ?? "";
    userGender.value = user!['userGender'] ?? "";
    userProfession.value = user!['userProfession'] ?? "";
    userHeight.value = user!['userHeight'] ?? "";
    userWeight.value = user!['userWeight'] ?? "";
    isLoading(false);
  }
}
