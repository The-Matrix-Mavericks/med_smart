import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/controllers/auth_controller.dart';
import 'package:flutter_samples/controllers/user_data_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/hcard.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/vcard.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/courses.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<CourseModel> _courses = CourseModel.courses;
  final List<CourseModel> _courseSections = CourseModel.courseSections;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController specialistContact = TextEditingController();

  bool showPopup = false;
  @override
  void initState() {
    super.initState();

    getUserDetails();
    Future.delayed(Duration.zero, () {
      if (showPopup) {
        showAlert(context, showPopup);
      } else {
        print("Now do not need to show the popup view ");
      }
    });
  }

  getUserDetails() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    showPopup = sp.getBool('isRegistered') ?? false;
    print("Show popup is :  ${showPopup}");
  }

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(;
    // Future.delayed(Duration.zero, () {
    //   if (showPopup) {
    //     showAlert(context, showPopup);
    //   }
    // });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: RiveAppTheme.background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 60,
              bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 8),
                child: Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 22, fontFamily: "Poppins"),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _courses
                      .map(
                        (course) => Padding(
                          key: course.id,
                          padding: const EdgeInsets.all(10),
                          child: VCard(course: course),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Utilities",
                  style: TextStyle(fontSize: 22, fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  children: List.generate(
                    _courseSections.length,
                    (index) => Container(
                      key: _courseSections[index].id,
                      width: MediaQuery.of(context).size.width > 992
                          ? ((MediaQuery.of(context).size.width - 20) / 2)
                          : MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      child: HCard(section: _courseSections[index]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context, bool showPopup) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return showDialog(
          // useSafeArea: true,
          anchorPoint: Offset(2, 2),
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return WillPopScope(
                // canPop: true,
                onWillPop: () async {
                  return true;
                },
                // onPopInvoked: null,
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  content: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "Please Fill the Details",
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFieldComponent(
                            controller: userNameController,
                            hintText: "Enter your name",
                            FieldName: "Name",
                            type: TextInputType.text,
                            icon: Icon(Icons.person),
                            value: UserDataController().userName.value,
                          ),
                          TextFieldComponent(
                            controller: userAboutController,
                            hintText: "Tell us a bit about you",
                            FieldName: "About",
                            type: TextInputType.text,
                            icon: Icon(Icons.edit_document),
                            value: UserDataController().userAbout.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userPhoneController,
                            hintText: "Enter your Contact No",
                            FieldName: "Phone no.",
                            type: TextInputType.number,
                            icon: Icon(Icons.phone),
                            value: UserDataController().userPhone.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userAddressController,
                            hintText: "Enter your Address",
                            FieldName: "Address",
                            type: TextInputType.text,
                            icon: Icon(Icons.location_on),
                            value: UserDataController().userAddress.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userAgeController,
                            hintText: "Enter your Age(in years)",
                            FieldName: "Age",
                            type: TextInputType.number,
                            icon: Icon(Icons.numbers),
                            value: UserDataController().userAge.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userWeightController,
                            hintText: "Enter Weight (in kg)",
                            FieldName: "Weight",
                            type: TextInputType.number,
                            icon: Icon(Icons.monitor_weight_outlined),
                            value: UserDataController().userWeight.value,
                          ),
                          SizedBox(height: 5),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userHeightController,
                            hintText: "Enter your Height(in cm)",
                            FieldName: "Height",
                            type: TextInputType.number,
                            icon: Icon(Icons.height),
                            value: UserDataController().userHeight.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userGenderController,
                            hintText: "Select your Gender",
                            FieldName: "Gender",
                            type: TextInputType.text,
                            icon: Icon(FontAwesomeIcons.genderless),
                            value: UserDataController().userGender.value,
                          ),
                          SizedBox(height: 5),
                          TextFieldComponent(
                            controller: userProfessionController,
                            hintText: "Enter your Profession",
                            FieldName: "Profession",
                            type: TextInputType.text,
                            icon: Icon(FontAwesomeIcons.userDoctor),
                            value: UserDataController().userProfession.value,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 150,
                            child: Card(
                              color: kTextColor,
                              child: TextButton(
                                onPressed: () async {
                                  SharedPreferences sp =
                                      await SharedPreferences.getInstance();
                                  showPopup =
                                      await sp.setBool("isRegistered", false);
                                  setState(() {});
                                  storeUserdata(
                                      context,
                                      FirebaseAuth.instance.currentUser!.uid,
                                      userNameController.text,
                                      userAboutController.text,
                                      userAddressController.text,
                                      userGenderController.text,
                                      userPhoneController.text,
                                      userAgeController.text,
                                      userWeightController.text,
                                      userHeightController.text,
                                      userProfessionController.text);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          });
    });
  }

  var userNameController = TextEditingController();
  var userAgeController = TextEditingController();
  var userAddressController = TextEditingController();
  var userAboutController = TextEditingController();
  var userHeightController = TextEditingController();
  var userWeightController = TextEditingController();
  var userGenderController = TextEditingController();
  var userPhoneController = TextEditingController();
  var userProfessionController = TextEditingController();

  storeUserdata(
      context,
      String uid,
      String userName,
      String userAbout,
      String userAddress,
      String userGender,
      String userPhone,
      String userAge,
      String userWeight,
      String userHeight,
      String userProfession) async {
    var store = FirebaseFirestore.instance.collection('user').doc(uid);
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
    if (!userName.isEmpty) {
      _showToast(context);
    }

    print("data stored");
    print(userName);
    print(userAge);
    print(userAddress);
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
}

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  TextFieldComponent({
    Key? key,
    required this.controller,
    required this.type,
    required this.icon,
    required this.hintText,
    required this.FieldName,
    required this.value,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final String FieldName;
  final Icon icon;
  String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0, bottom: 2),
          child: Text(
            FieldName,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'Inter'),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey[300]!,
            ),
          ),
          child: TextField(
            keyboardType: type,
            controller: controller,
            decoration: kTextInputDecoration.copyWith(
                hintText: hintText, hintStyle: hintStyle, icon: icon),
            autofocus: false,
            style: TextStyle(fontSize: 15, color: Colors.black),
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }

  TextStyle hintStyle = TextStyle(
      color: Colors.grey[500], fontWeight: FontWeight.w400, fontSize: 16);
}
