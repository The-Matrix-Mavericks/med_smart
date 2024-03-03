import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _emailController = TextEditingController();

  reset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration:
                    authInputStyle(Icons.mail, "  Enter your email address"),
                controller: _emailController,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (() => reset()), child: Text("send link"))
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration authInputStyle(IconData icon, String hintText) {
    return InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
        contentPadding: const EdgeInsets.all(15),
        // prefixIcon: Padding(
        //     padding: const EdgeInsets.only(left: 4),
        //     child:
        //         Image.asset("assets/samples/ui/rive_app/images/$iconName.png")));
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }
}
