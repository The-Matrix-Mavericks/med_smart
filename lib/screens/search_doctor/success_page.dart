import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/button.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(milliseconds: 2500), () {
  //     Get.to(() => MedHomePage());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 230,
            ),
            Lottie.asset('assets/success.json'),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Button(
                width: double.infinity,
                title: 'Back to Home Page',
                onPressed: () => Get.to(() => RiveAppHome()),
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
