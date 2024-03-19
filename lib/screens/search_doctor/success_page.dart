import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/button.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.network('https://lottie.host/919587de-673a-4c53-8882-bb2dd19a0055/L5xvP7YYoQ.json'),
            ),
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
