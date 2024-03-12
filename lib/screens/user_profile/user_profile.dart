import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            // const ListTile(
            //   leading: Icon(Icons.arrow_back),
            //   trailing: Icon(Icons.menu),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage("assets/images/man.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.webp"),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.webp"),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.webp"),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.webp"),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Thomas Shelby",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("@peakyBlinders")],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Master manipulator, deal-maker and\n                   entrepreneur",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: [
                  Card(
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const ListTile(
                      leading: Icon(
                        Icons.privacy_tip_sharp,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Privacy',
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
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
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
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
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
                    height: 10,
                  ),
                  Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
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
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
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
                      color: Colors.white70,
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
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
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
