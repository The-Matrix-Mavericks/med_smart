import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/button.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   Timer(const Duration(milliseconds: 2500), () {
//     Get.to(() => MedHomePage());
//   });
// }
class AppointmentBooked extends StatefulWidget {
  AppointmentBooked({Key? key, required this.docID}) : super(key: key);
  String docID = 'null';

  @override
  State<AppointmentBooked> createState() => _AppointmentBookedState();
}

class _AppointmentBookedState extends State<AppointmentBooked> {
  String lastDocumentId = 'null';
  @override
  // void initState() {
  //   // TODO: implement initState
  //   // lastDocumentId = getDocID();
  //   super.initState();
  // }

  // getDocID() async {
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection('appointment')
  //       .orderBy("createdAt", descending: true)
  //       .limit(1)
  //       .get();
  //   return snap.docs.first.id;
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
              height: 100,
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
            SizedBox(
              height: 10,
            ),
            // Text(
            //   widget.docID,
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Center(
              child: SizedBox(
                width: 200,
                child: QrImageView(
                  data: widget.docID,
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: const Size(
                      100,
                      100,
                    ),
                  ),
                ),
              ),
            ),
            // Text(
            //   widget.docID,
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(
                textAlign: TextAlign.center,
                'Take screenshot of this QR Code when visiting clinic',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'),
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
