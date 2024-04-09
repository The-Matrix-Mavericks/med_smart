import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/controllers/user_data_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/onboarding/onboarding_view.dart';
import 'package:flutter_samples/screens/user_profile/medical_form.dart';
import 'package:flutter_samples/screens/user_profile/medical_status.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../diseases/disease_home.dart';
import './avatar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'user_profile_edit_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => OnBoardingView()));
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  // getUserDataFromStreamBuilder(String field, TextStyle style, String before, String after) {
  //   StreamBuilder(
  //       stream: FirebaseFirestore.instance
  //           .collection('user')
  //           .doc(FirebaseAuth.instance.currentUser?.uid)
  //           .snapshots(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           DocumentSnapshot userData = snapshot.data!;
  //           return Text(
  //             userData[field],
  //             style: style
  //           );
  //         } else if (snapshot.hasError) {
  //           print(Error); //just for checking
  //         }
  //         return const CircularProgressIndicator(); // loading progress indicate
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserDataController());
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
            // Obx(
            //   () => controller.isLoading.value
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            //       :
            Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => NewPage())),
              child: FluttermojiCircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 60,
              ),
            ),
            // Container(
            //   height: 35,
            //   child: IconButton(
            //     icon: const Icon(Icons.edit),
            //     onPressed: () => Navigator.push(context,
            //         new MaterialPageRoute(builder: (context) => NewPage())),
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    DocumentSnapshot userData = snapshot.data!;
                    return Text(
                      userData["userName"],
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          fontFamily: "Inter"),
                    );
                  } else if (snapshot.hasError) {
                    print(Error); //just for checking
                  }
                  return const CircularProgressIndicator(); // loading progress indicate
                }),
            // Text(
            //   controller.userName.value.toString(),
            //   style: TextStyle(
            //       fontWeight: FontWeight.w900,
            //       fontSize: 24,
            //       fontFamily: "Inter"),
            // ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    DocumentSnapshot userData = snapshot.data!;
                    return Text(
                      "${userData['userProfession'].toUpperCase()} | ${userData['userGender'].toUpperCase()} | ${userData['userAge']}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    );
                  } else if (snapshot.hasError) {
                    print(Error); //just for checking
                  }
                  return const CircularProgressIndicator(); // loading progress indicate
                }),
            // Text(
            //   "${controller.userProfession.value.toUpperCase()} | ${controller.userGender.value.toUpperCase()} | ${controller.userAge}",
            //   style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            // ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.alternate_email, color: kTextColor),
                  10.widthBox,
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          DocumentSnapshot userData = snapshot.data!;
                          return Text(userData["userEmail"],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]));
                        } else if (snapshot.hasError) {
                          print(Error); //just for checking
                        }
                        return const CircularProgressIndicator(); // loading progress indicate
                      }),
                  // Text(controller.userEmail.value,
                  //     style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: kTextColor),
                  SizedBox(width: 10),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          DocumentSnapshot userData = snapshot.data!;
                          return Text("${userData['userPhone']}   | ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]));
                        } else if (snapshot.hasError) {
                          print(Error); //just for checking
                        }
                        return const CircularProgressIndicator(); // loading progress indicate
                      }),
                  // Text("${controller.userPhone.value}   | ",
                  //     style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                  Icon(Icons.location_on, color: kTextColor),
                  SizedBox(width: 10),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          DocumentSnapshot userData = snapshot.data!;
                          return Text("${userData['userAddress']}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]));
                        } else if (snapshot.hasError) {
                          print(Error); //just for checking
                        }
                        return const CircularProgressIndicator(); // loading progress indicate
                      }),
                  // Text("${controller.userAddress.value}",
                  //     style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ],
              ),
            ),

            // const SizedBox(
            //   height: 15,
            // ),
            Container(
              child: Expanded(
                  child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                      color: Colors.cyan[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: const ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Your Profile',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalRecordsScreen()));
                    },
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                      color: Colors.indigo[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: const ListTile(
                        leading: Icon(
                          Icons.notes,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Medical Records',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseHomePage(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue[50],
                      margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: const ListTile(
                        leading: Icon(
                          FontAwesomeIcons.kitMedical,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Common Diseases',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.yellow[50]!,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.black54),
                      title: Text(
                        'Help & Support',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.orange[50],
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.privacy_tip_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.green[50],
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.add_reaction_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Invite a Friend',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      signout();
                    },
                    child: Card(
                      color: Colors.red[50],
                      margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: const ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                  20.heightBox
                ],
              )),
            )
          ],
        ),
      ),
      // ),
    );
    // Scaffold(
    //   body:
    //   Center(child: Text("User Profile Page")),
    //   floatingActionButton: Padding(
    //     padding: const EdgeInsets.only(right: 15.0, bottom: 60),
    //     child: FloatingActionButton(
    //       onPressed: (() => signout()),
    //       child: Icon(Icons.login_rounded),
    //     ),
    //   ),
    // );
  }
}
