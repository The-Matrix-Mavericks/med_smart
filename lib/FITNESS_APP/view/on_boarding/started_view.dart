import 'package:flutter/material.dart';
import 'package:flutter_samples/FITNESS_APP/common/colo_extension.dart';
import 'package:flutter_samples/FITNESS_APP/view/on_boarding/on_boarding_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widget/round_button.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/fitness.jpg'),
              20.heightBox,
              Text(
                "Smart Lifestyle",
                style: GoogleFonts.stixTwoText(
                    color: TColor.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Inhance your LIFE with MedSmart",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RoundButton(
                    title: "Get Started",
                    type: isChangeColor
                        ? RoundButtonType.textGradient
                        : RoundButtonType.bgGradient,
                    onPressed: () {
                      // if (isChangeColor) {
                      //GO Next Screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()));
                      // } else {
                      //   //Change Color
                      //   setState(() {
                      //     isChangeColor = true;
                      //   });
                      // }
                    },
                  ),
                ),
              ),
              20.heightBox
            ],
          )),
    );
  }
}
