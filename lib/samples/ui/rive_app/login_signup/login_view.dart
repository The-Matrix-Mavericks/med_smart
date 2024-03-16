import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/forgot.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/wrapper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../services/service.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  late SMITrigger _successAnim;
  late SMITrigger _errorAnim;
  late SMITrigger _confettiAnim;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onCheckRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _successAnim = controller.findInput<bool>("Check") as SMITrigger;
    _errorAnim = controller.findInput<bool>("Error") as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _confettiAnim =
        controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, password: _passController.text);
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', _emailController.text.toString());
    sp.setBool('isLogin', true);
    print("USER LOGIN---->true");
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (BuildContext context) => RiveAppHome()));
    Get.offAll(() => Wrapper());
  }

  void login() {
    setState(() {
      _isLoading = true;
    });

    bool isEmailValid = _emailController.text.trim().isNotEmpty;
    bool isPassValid = _passController.text.trim().isNotEmpty;
    bool isValid = isEmailValid && isPassValid;

    Future.delayed(const Duration(seconds: 1), () {
      isValid ? _successAnim.fire() : _errorAnim.fire();
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      if (isValid) _confettiAnim.fire();
    });

    if (isValid) {
      Future.delayed(const Duration(seconds: 4), () async {
        signIn();
        VxToast.show(context,
            msg: "Login Successful ✅",
            textSize: 18,
            bgColor: Colors.black,
            textColor: Colors.white);
        widget.closeModal!();
        _emailController.text = "";
        _passController.text = "";
      });
    }

    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => RiveAppHome()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.8), Colors.white10],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(29),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: RiveAppTheme.shadow.withOpacity(0.3),
                              offset: const Offset(0, 3),
                              blurRadius: 5),
                          BoxShadow(
                              color: RiveAppTheme.shadow.withOpacity(0.3),
                              offset: const Offset(0, 30),
                              blurRadius: 30)
                        ],
                        color: CupertinoColors.secondarySystemBackground,
                        // This kind of give the background iOS style "Frosted Glass" effect,
                        // it works for this particular color, might not for other
                        backgroundBlendMode: BlendMode.luminosity),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Login Now",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 30,
                              color: primaryColor),
                        ),
                        const SizedBox(height: 20),
                        const Text("Please login to continue using the app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: CupertinoColors.secondaryLabel,
                                fontFamily: "Inter",
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: authInputStyle(
                              Icons.mail, "  Enter your email address"),
                          controller: _emailController,
                        ),
                        const SizedBox(height: 15),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: CupertinoColors.secondaryLabel,
                                fontFamily: "Inter",
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: authInputStyle(
                              Icons.lock, "  Enter your password"),
                          controller: _passController,
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kTextColor.withOpacity(0.5),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(20),
                            color: kTextColor.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(Icons.arrow_forward_rounded),
                                // SizedBox(width: 4),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onPressed: () {
                              if (!_isLoading) login();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RiveAppHome()));
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext contex) =>
                                          Forgot())),
                              child: Text("Forgot Password")),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 15,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                        ),
                        const Text("Login with Email, Apple or Google",
                            style: TextStyle(
                                color: CupertinoColors.secondaryLabel,
                                fontFamily: "Inter",
                                fontSize: 15)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(app_assets.logoEmail),
                            Image.asset(app_assets.logoApple),
                            Image.asset(
                              app_assets.logoGoogle,
                              height: 70,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_isLoading)
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: RiveAnimation.asset(
                              app_assets.checkRiv,
                              onInit: _onCheckRiveInit,
                            ),
                          ),
                        Positioned.fill(
                          child: SizedBox(
                            width: 500,
                            height: 500,
                            child: Transform.scale(
                              scale: 3,
                              child: RiveAnimation.asset(
                                app_assets.confettiRiv,
                                onInit: _onConfettiRiveInit,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(36 / 2),
                      minSize: 36,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36 / 2),
                          boxShadow: [
                            BoxShadow(
                              color: RiveAppTheme.shadow.withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        widget.closeModal!();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Common style for Auth Input fields email and password
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