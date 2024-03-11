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
      body: Center(child: Text("User Profile Page")),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15.0, bottom: 60),
        child: FloatingActionButton(
          onPressed: (() => signout()),
          child: Icon(Icons.login_rounded),
        ),
      ),
    );
  }
}
