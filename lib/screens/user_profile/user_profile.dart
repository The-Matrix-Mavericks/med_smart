import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/controllers/setting_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/onboarding/onboarding_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    // const ListTile(
                    //   leading: Icon(Icons.arrow_back),
                    //   trailing: Icon(Icons.menu),
                    // ),
                    CircleAvatar(
                      maxRadius: 65,
                      backgroundImage: AssetImage("assets/images/man.png"),
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     CircleAvatar(
                    //       backgroundImage: AssetImage("assets/images/avatar.webp"),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     CircleAvatar(
                    //       backgroundImage: AssetImage("assets/images/avatar.webp"),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     CircleAvatar(
                    //       backgroundImage: AssetImage("assets/images/avatar.webp"),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     CircleAvatar(
                    //       backgroundImage: AssetImage("assets/images/avatar.webp"),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.userName.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          fontFamily: "Inter"),
                    ),
                    Text(
                      "${controller.userProfession.value.toUpperCase()} | ${controller.userGender.value.toUpperCase()} | ${controller.userAge}",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(controller.userEmail.value),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 30),
                      child: Row(
                        children: [
                          Icon(Icons.notes_outlined),
                          SizedBox(width: 10),
                          Text(controller.userAbout.value),
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
                            onTap: () => Get.to(() => UserProfileEditPage()),
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 35, right: 35, bottom: 10),
                              color: Colors.grey[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: const ListTile(
                                leading: Icon(
                                  Icons.edit,
                                  color: Colors.black54,
                                ),
                                title: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: const ListTile(
                              leading: Icon(
                                Icons.history,
                                color: Colors.black54,
                              ),
                              title: Text(
                                'Purchase History',
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
                            height: 10,
                          ),
                          Card(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: const ListTile(
                              leading: Icon(Icons.help_outline,
                                  color: Colors.black54),
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
                            height: 10,
                          ),
                          Card(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, bottom: 10),
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
                            height: 10,
                          ),
                          Card(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, bottom: 10),
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
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              signout();
                            },
                            child: Card(
                              color: Colors.grey[100],
                              margin: const EdgeInsets.only(
                                  left: 35, right: 35, bottom: 10),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing:
                                    Icon(Icons.arrow_forward_ios_outlined),
                              ),
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                ),
        ),
      ),
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
