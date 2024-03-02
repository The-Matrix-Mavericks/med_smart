import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/screens/user_health_metrics/appbar/bmi_appbar.dart';
import 'package:flutter_samples/screens/user_health_metrics/bottombar/pacman_slider.dart';
import 'package:flutter_samples/screens/user_health_metrics/fade_rote.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/age/age_card.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/gender/gender.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/inputsummary/input_summary_card.dart';
import 'package:flutter_samples/screens/user_health_metrics/resultpage/result_page.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/widget_utils.dart'
    show screenAwareSize;
import 'package:flutter_samples/screens/user_health_metrics/utils/widget_utils.dart'
    show appBarHeight;

import '../bottombar/transition_dot.dart';
import 'height/height_card.dart';
import 'weight/weight_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return InputPageState();
  }
}

class InputPageState extends State<InputPage> with TickerProviderStateMixin {
  Gender gender = Gender.other;
  int height = 170;
  int weight = 70;
  int age = 25;

  AnimationController? submitAnimationController;

  @override
  void initState() {
    super.initState();
    submitAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    submitAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResultPage().then((_) => submitAnimationController!.reset());
      }
    });
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          // floatingActionButton: GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     height: 40,
          //     width: 40,
          //     decoration:
          //         BoxDecoration(color: lightPurple, shape: BoxShape.circle),
          //     child: Icon(Icons.keyboard_arrow_right_rounded),
          //   ),
          // ),
          // appBar: PreferredSize(
          //     child: const BmiAppBar(),
          //     preferredSize: Size.fromHeight(appBarHeight(context))),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please fill in the \ntrue information',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (RiveAppHome()))),
                        child: selectedIndex != -1
                            ? Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: darkBlue,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // InputSummaryCard(
                //   gender: gender,
                //   weight: weight,
                //   height: height,
                // ),

                Container(
                  // height: MediaQuery.of(context).size.height * 0.45,
                  // flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: selectedIndex == -1
                                        ? Colors.grey[100]
                                        : selectedIndex == 0
                                            ? Color.fromARGB(255, 116, 124, 251)
                                                .withOpacity(0.4)
                                            : Colors.grey[100],
                                    // borderRadius: BorderRadius.circular(10),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey[300]!,
                                    //     offset: Offset(5, 5),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 8,
                                    //   )
                                    // ],
                                    border: Border.all(
                                        color: selectedIndex == 0
                                            ? darkBlue
                                            : Colors.grey[200]!,
                                        width: 3.5),
                                    shape: BoxShape.circle,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey[300]!,
                                    //     offset: Offset(5, 5),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 8,
                                    //   )
                                    // ],
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/man1.png"),
                                        fit: BoxFit.fill)),
                              ),
                              onTap: () {
                                setState(() {
                                  print(selectedIndex);
                                  selectedIndex = 0;
                                  print(selectedIndex);
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: selectedIndex == -1
                                      ? Colors.grey[100]
                                      : selectedIndex == 1
                                          ? Color.fromARGB(255, 116, 124, 251)
                                              .withOpacity(0.4)
                                          : Colors.grey[100],
                                  // borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: selectedIndex == 1
                                          ? darkBlue
                                          : Colors.grey[200]!,
                                      width: 3.5),
                                  shape: BoxShape.circle,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey[300]!,
                                  //     offset: Offset(5, 5),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 8,
                                  //   )
                                  // ],
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/woman.png"),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  print(selectedIndex);
                                  selectedIndex = 1;
                                  print(selectedIndex);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontWeight: selectedIndex == 0
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: 18,
                                  color: selectedIndex == 0
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontWeight: selectedIndex == 1
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: 18,
                                  color: selectedIndex == 1
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: _buildCards(context)),
                // _buildBottom(context),
              ],
            ),
          ),
        ),
        TransitionDot(animation: submitAnimationController!),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
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

  void onPacmanSubmit() {
    submitAnimationController!.forward();
  }

  _goToResultPage() async {
    return Navigator.of(context).push(FadeRoute(
      builder: (context) => ResultPage(
        weight: weight,
        height: height,
        gender: gender,
      ),
    ));
  }

  @override
  void dispose() {
    submitAnimationController!.dispose();
    super.dispose();
  }
}
