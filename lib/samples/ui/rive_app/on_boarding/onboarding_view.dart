import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/loginORsignupIndex.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/login_view.dart';
import 'package:rive/rive.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/signin_view.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, this.closeModal}) : super(key: key);

  // Close modal callback for any screen that uses this as a modal
  final Function? closeModal;

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  // Animation controller that shows the sign up modal as well as translateY boarding content together
  AnimationController? _signInAnimController;

  // Control touch effect animation for the "Start the Course" button
  late RiveAnimationController _btnController1;
  late RiveAnimationController _btnController2;

  // bool isLogin = false;

  @override
  void initState() {
    super.initState();

    // isLogin = false;
    _signInAnimController = AnimationController(
        duration: const Duration(milliseconds: 350),
        upperBound: 1,
        vsync: this);

    _btnController1 = OneShotAnimation("active", autoplay: false);
    _btnController2 = OneShotAnimation("active", autoplay: false);

    const springDesc = SpringDescription(
      mass: 0.1,
      stiffness: 40,
      damping: 5,
    );

    _btnController1.isActiveChanged.addListener(() {
      if (!_btnController1.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _signInAnimController?.animateWith(springAnim);
      }
    });

    _btnController2.isActiveChanged.addListener(() {
      if (!_btnController2.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _signInAnimController?.animateWith(springAnim);
      }
    });
  }

  @override
  void dispose() {
    _signInAnimController?.dispose();
    _btnController1.dispose();
    _btnController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: const Offset(200, 100),
                child: Image.asset(app_assets.spline, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const RiveAnimation.asset(app_assets.shapesRiv),
        ),
        AnimatedBuilder(
          animation: _signInAnimController!,
          builder: (context, child) {
            return Transform(
                transform: Matrix4.translationValues(
                    0, -50 * _signInAnimController!.value, 0),
                child: child);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 260,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: const Text(
                              "Intelligent care. Intuitive health.",
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 45),
                            ),
                          ),
                          Text(
                            "Our app harnesses advanced AI to deliver personalized healthcare right from your palm.",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontFamily: "Inter",
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // const Spacer(),
                  GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 236,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              app_assets.buttonRiv,
                              fit: BoxFit.cover,
                              controllers: [_btnController1],
                            ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(4, 4),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(
                                    //   Icons.rocket,
                                    //   color: Colors.red[200]!,
                                    // ),
                                    // SizedBox(width: 14),
                                    Text(
                                      "Login to continue",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // SizedBox(width: 14),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _btnController1.isActive = true;
                      setState(() {
                        loginORsignupIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // const Spacer(),
                  GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 236,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              app_assets.buttonRiv,
                              fit: BoxFit.cover,
                              controllers: [_btnController2],
                            ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(4, 4),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Sign Up  to continue",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(width: 14),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _btnController2.isActive = true;
                      setState(() {
                        loginORsignupIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Making managing healthcare simple, smart and personalized that helps you live your healthiest life possible.",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontFamily: "Inter",
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _signInAnimController!,
            builder: (context, child) {
              return Stack(
                children: [
                  // Positioned(
                  //   top: 100 - (_signInAnimController!.value * 200),
                  //   right: 20,
                  //   child: SafeArea(
                  //     child: CupertinoButton(
                  //       padding: EdgeInsets.zero,
                  //       borderRadius: BorderRadius.circular(36 / 2),
                  //       minSize: 36,
                  //       child: Container(
                  //         width: 36,
                  //         height: 36,
                  //         decoration: BoxDecoration(
                  //           color: Colors.black,
                  //           borderRadius: BorderRadius.circular(36 / 2),
                  //           boxShadow: [
                  //             BoxShadow(
                  //                 color: Colors.black.withOpacity(0.3),
                  //                 blurRadius: 10,
                  //                 offset: const Offset(0, 10))
                  //           ],
                  //         ),
                  //         child: const Icon(
                  //           Icons.close,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         widget.closeModal!();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Positioned.fill(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Opacity(
                        opacity: 0.4 * _signInAnimController!.value,
                        child: Container(color: RiveAppTheme.shadow),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      0,
                      -MediaQuery.of(context).size.height *
                          (1 - _signInAnimController!.value),
                    ),
                    child: child,
                  ),
                ],
              );
            },
            child: loginORsignupIndex == 0
                ? LogInView(
                    closeModal: () {
                      _signInAnimController?.reverse();
                    },
                  )
                : SignInView(
                    closeModal: () {
                      _signInAnimController?.reverse();
                    },
                  ),
          ),
        ),
      ]),
    );
  }
}
