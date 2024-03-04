import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/constants/loginORsignupIndex.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/login_view.dart';
import 'package:flutter_samples/screens/user_health_metrics/bottombar/pacman_slider.dart';
import 'package:flutter_samples/screens/user_health_metrics/bottombar/transition_dot.dart';
import 'package:flutter_samples/screens/user_health_metrics/fade_rote.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/age/age_card.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/gender/gender.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/height/height_card.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/weight/weight_card.dart';
import 'package:flutter_samples/screens/user_health_metrics/resultpage/bmi_dialog_box.dart';
import 'package:flutter_samples/screens/user_health_metrics/resultpage/result_page.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/widget_utils.dart';
import 'package:flutter_samples/screens/user_health_metrics/widget/conainer_box.dart';
import 'package:rive/rive.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/signup_view.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_samples/screens/user_health_metrics/calculator.dart'
    as calculator;

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key, this.closeModal}) : super(key: key);

  // Close modal callback for any screen that uses this as a modal
  final Function? closeModal;

  @override
  State<InputScreen> createState() => _InputScreenViewState();
}

// const activeColor = Color(0xff0073dd);
const activeColor = primaryColor;
// const inActiveColor = Color(0xFF212121);
const inActiveColor = darkBlue;

class _InputScreenViewState extends State<InputScreen>
    with TickerProviderStateMixin {
  // Animation controller that shows the sign up modal as well as translateY boarding content together
  AnimationController? _signInAnimController;

  // Control touch effect animation for the "Start the Course" button
  late RiveAnimationController _btnController1;
  late RiveAnimationController _btnController2;

  Gender gender = Gender.other;
  int height = 170;
  int weight = 70;
  int age = 25;
  int selectedIndex = -1;
  AnimationController? submitAnimationController;

  // bool isLogin = false;
  void onPacmanSubmit() {
    submitAnimationController!.forward();
  }

  comment(double bmi) {
    if (bmi < 18.5) {
      return Column(
        children: const <Widget>[
          Text(
            'You are kinda Skinny',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'You need some 🥛🥙🥩',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      );
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Column(
        children: const <Widget>[
          Text(
            'You\'r in a great shape',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            'Keep it up 😍🔥',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return Column(
        children: const <Widget>[
          Text(
            'It ok but pay attention',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
            'You need healthy food 🥕🍅🍆',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
    if (bmi >= 30) {
      return Column(
        children: const <Widget>[
          Text(
            'Get your self up now',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
            'And workout 🏃‍💪🏋️',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }

  _goToResultPage() async {
    // return Navigator.of(context).push(FadeRoute(
    //   builder: (context) => ResultPage(
    //     weight: weight,
    //     height: height,
    //     gender: gender,
    //   ),
    // ));
    // BMIDialogBox(context, height, weight, gender);

    // show the dialog
    bmi = calculator.calculateBMI(height: height, weight: weight);
    minWeight = calculator.calculateMinNormalWeight(height: height);
    maxWeight = calculator.calculateMaxNormalWeight(height: height);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: lightPurple,
        title: comment(bmi),
        content: Container(
          height: 180,
          child: Column(
            children: [
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: darkBlue),
              ),
              Text(
                'BMI = ${bmi.toStringAsFixed(2)} kg/m²',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Normal BMI weight range for the height:\n${minWeight!.round()}kg - ${maxWeight!.round()}kg',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              height: 40,
              width: 80,
              // padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: darkBlue, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "Great",
                  style: TextStyle(color: primaryColor, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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

    submitAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    submitAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResultPage().then((_) => submitAnimationController!.reset());
      }
    });
  }

  @override
  void dispose() {
    _signInAnimController?.dispose();
    _btnController1.dispose();
    _btnController2.dispose();
    submitAnimationController!.dispose();
    super.dispose();
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              // Expanded(
              //     child: GenderCard(
              //   initialGender: gender,
              //   onChanged: (val) => setState(() => gender = val),
              // )),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 4),
                child: AgeCard(
                  initialAge: age,
                  onChanged: (val) => setState(() => age = val),
                ),
              )),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 4),
                child: WeightCard(
                  initialWeight: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
              )),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 4, bottom: 20, right: 8),
            child: HeightCard(
              height: height,
              onChanged: (val) => setState(() => height = val),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(10.0, context),
        top: screenAwareSize(0, context),
      ),
      child: SizedBox(
        height: screenAwareSize(52.0, context),
        child: PacmanSlider(
          onSubmit: onPacmanSubmit,
          submitAnimationController: submitAnimationController,
        ),
      ),
    );
  }

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;
  double? minWeight;
  double? maxWeight;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  /* String getInterpretation(double bmi) {
    if (bmi >= 25.0) {
      return 'You have higher than normal body weight. Try to excersie more.';
    } 
    else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } 
    else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  } */
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.male, title: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                    boxColor: femaleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.female, title: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        ' cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: textStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: textStyle2,
                          ),
                          Text(
                            ' kg',
                            style: textStyle1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: textStyle1,
                      ),
                      Text(
                        age.toString(),
                        style: textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age < 100) {
                                  age++;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          // GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         result = calculateBmi(weight, height);
          //         /*resultDetail = getInterpretation(bmi);*/
          //         showDialog(
          //             context: context,
          //             builder: (BuildContext contest) {
          //               return Dialog(
          //                   backgroundColor: inActiveColor,
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                   ),
          //                   child: Container(
          //                     color: inActiveColor,
          //                     height: 200.0,
          //                     margin: EdgeInsets.all(10.0),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: <Widget>[
          //                         Text(
          //                           'Your BMI',
          //                           style: textStyle1,
          //                         ),
          //                         Text(
          //                           result.toString(),
          //                           style: textStyle2,
          //                         ),
          //                         /*Text(
          //                             resultDetail,
          //                             style: textStyle1,
          //                           ),*/
          //                       ],
          //                     ),
          //                   ));
          //             });
          //       });
          //     },
          //     child: Container(
          //       child: Center(
          //         child: Text(
          //           'Calculate',
          //           style: textStyle3,
          //         ),
          //       ),
          //       width: double.infinity,
          //       height: 80.0,
          //       color: activeColor,
          //       margin: EdgeInsets.only(top: 10.0),
          //     ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // ImageFiltered(
        //   imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        //   child: Center(
        //     child: OverflowBox(
        //       maxWidth: double.infinity,
        //       child: Transform.translate(
        //         offset: const Offset(200, 100),
        //         child: Image.asset(app_assets.spline, fit: BoxFit.cover),
        //       ),
        //     ),
        //   ),
        // ),
        // ImageFiltered(
        //   imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        //   child: const RiveAnimation.asset(app_assets.shapesRiv),
        // ),
        AnimatedBuilder(
          animation: _signInAnimController!,
          builder: (context, child) {
            return Transform(
                transform: Matrix4.translationValues(
                    0, -50 * _signInAnimController!.value, 0),
                child: child);
          },
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 15, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BMI Calculator',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      // GestureDetector(
                      //   onTap: () => Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => (RiveAppHome()))),
                      //   child: Container(
                      //     height: 40,
                      //     width: 40,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey[200],
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: RiveAppTheme.shadow.withOpacity(0.2),
                      //             blurRadius: 5,
                      //             offset: const Offset(0, 5),
                      //           )
                      //         ],
                      //         shape: BoxShape.circle),
                      //     child: Icon(FontAwesomeIcons.close),
                      //   ),
                      // ),
                      Positioned(
                        top: 100 - (_signInAnimController!.value * 200),
                        right: 20,
                        child: SafeArea(
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
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 10))
                                ],
                              ),
                              child: const Icon(
                                FontAwesomeIcons.close,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              widget.closeModal!();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // InputSummaryCard(
                //   gender: gender,
                //   weight: weight,
                //   height: height,
                // ),

                // Container(
                //   // height: MediaQuery.of(context).size.height * 0.45,
                //   // flex: 2,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             GestureDetector(
                //               child: Container(
                //                 height:
                //                     MediaQuery.of(context).size.height * 0.18,
                //                 width: MediaQuery.of(context).size.width * 0.4,
                //                 decoration: BoxDecoration(
                //                     color: selectedIndex == -1
                //                         ? Colors.grey[100]
                //                         : selectedIndex == 0
                //                             ? Color.fromARGB(255, 116, 124, 251)
                //                                 .withOpacity(0.4)
                //                             : Colors.grey[100],
                //                     // borderRadius: BorderRadius.circular(10),
                //                     // boxShadow: [
                //                     //   BoxShadow(
                //                     //     color: Colors.grey[300]!,
                //                     //     offset: Offset(5, 5),
                //                     //     spreadRadius: 2,
                //                     //     blurRadius: 8,
                //                     //   )
                //                     // ],
                //                     border: Border.all(
                //                         color: selectedIndex == 0
                //                             ? darkBlue
                //                             : Colors.grey[200]!,
                //                         width: 3.5),
                //                     shape: BoxShape.circle,
                //                     // boxShadow: [
                //                     //   BoxShadow(
                //                     //     color: Colors.grey[300]!,
                //                     //     offset: Offset(5, 5),
                //                     //     spreadRadius: 2,
                //                     //     blurRadius: 8,
                //                     //   )
                //                     // ],
                //                     image: DecorationImage(
                //                         image: AssetImage(
                //                             "assets/images/man1.png"),
                //                         fit: BoxFit.fill)),
                //               ),
                //               onTap: () {
                //                 setState(() {
                //                   print(selectedIndex);
                //                   selectedIndex = 0;
                //                   print(selectedIndex);
                //                 });
                //               },
                //             ),
                //             GestureDetector(
                //               child: Container(
                //                 height:
                //                     MediaQuery.of(context).size.height * 0.18,
                //                 width: MediaQuery.of(context).size.width * 0.4,
                //                 decoration: BoxDecoration(
                //                   color: selectedIndex == -1
                //                       ? Colors.grey[100]
                //                       : selectedIndex == 1
                //                           ? Color.fromARGB(255, 116, 124, 251)
                //                               .withOpacity(0.4)
                //                           : Colors.grey[100],
                //                   // borderRadius: BorderRadius.circular(10),
                //                   border: Border.all(
                //                       color: selectedIndex == 1
                //                           ? darkBlue
                //                           : Colors.grey[200]!,
                //                       width: 3.5),
                //                   shape: BoxShape.circle,
                //                   // boxShadow: [
                //                   //   BoxShadow(
                //                   //     color: Colors.grey[300]!,
                //                   //     offset: Offset(5, 5),
                //                   //     spreadRadius: 2,
                //                   //     blurRadius: 8,
                //                   //   )
                //                   // ],
                //                   image: DecorationImage(
                //                       image:
                //                           AssetImage("assets/images/woman.png"),
                //                       fit: BoxFit.cover,
                //                       alignment: Alignment.bottomCenter),
                //                 ),
                //               ),
                //               onTap: () {
                //                 setState(() {
                //                   print(selectedIndex);
                //                   selectedIndex = 1;
                //                   print(selectedIndex);
                //                 });
                //               },
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 0,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Text(
                //               "Male",
                //               style: TextStyle(
                //                   fontWeight: selectedIndex == 0
                //                       ? FontWeight.w600
                //                       : FontWeight.w400,
                //                   fontSize: 18,
                //                   color: selectedIndex == 0
                //                       ? Colors.black
                //                       : Colors.grey),
                //             ),
                //             Text(
                //               "Female",
                //               style: TextStyle(
                //                   fontWeight: selectedIndex == 1
                //                       ? FontWeight.w600
                //                       : FontWeight.w400,
                //                   fontSize: 18,
                //                   color: selectedIndex == 1
                //                       ? Colors.black
                //                       : Colors.grey),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Expanded(child: buildBody(context)),
                _buildBottom(context),
              ],
            ),
          ),
        ),
        TransitionDot(animation: submitAnimationController!),
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
                : SignUpView(
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
