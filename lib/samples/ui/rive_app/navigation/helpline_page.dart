import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';

import '../../../../screens/hospital_map/hospital_map.dart';

class HelplinePage extends StatelessWidget {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: height * 0.1,
        centerTitle: true,
        title: Text(
          "Helplines",
          style: TextStyle(
            color: primaryColor,
            fontSize: 0.035 * height,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: helplines.length,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            // elevation: 10.0,
            // shadowColor: Colors.grey.shade200, // Shadow
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple[100]!, Colors.blue[100]!],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                    child: Row(
                      children: [
                        10.widthBox,
                        IconButton(
                          onPressed: () async {
                            Uri phoneno = Uri.parse('tel:+91'+helplines[index]['phone']!);
                            if (await launchUrl(phoneno)) {
                              //dialer opened
                            } else {
                              //dailer is not opened
                            }
                          },
                          icon: Icon(icons[index], size: 30),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        10.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Get.to(() => HospitalMap(
                                    name: helplines[index]['name']!,
                                    latLng: locations[index]));
                              }),
                              child: Text(
                                helplines[index]['name']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            5.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Icon(
                                      Icons.call,
                                      size: 15,
                                      color: Colors.green[600],
                                    ),
                                5.widthBox,
                                Text(helplines[index]['phone']!),
                              ],
                            ),
                          ],
                        )
                      ],
                    ))),
          );
        },
      ),
    );
  }
}

List<IconData> icons = [
  FontAwesomeIcons.ambulance,
  FontAwesomeIcons.personPregnant,
  FontAwesomeIcons.hatCowboy,
  FontAwesomeIcons.hospital,
  FontAwesomeIcons.hospital,
  FontAwesomeIcons.hospital,
  FontAwesomeIcons.hospital,
  FontAwesomeIcons.hospital,
];

List<Map<String, String>> helplines = [
  {'name': 'Ambulance', 'phone': '108'},
  {'name': 'Pregnant Women', 'phone': '112'},
  {'name': 'Police', 'phone': '100'},
  {'name': 'Carewell Multispeciality Hospital', 'phone': '08401338706'},
  {'name': 'Apollo Sage Hospital', 'phone': '09303972510'},
  {'name': 'Care & Cure Hospital', 'phone': '080401338706'},
  {'name': 'Mount Hospital', 'phone': '08401859403'},
  {'name': 'Sagar Multispeciality Hospital', 'phone': '0755-4303030'},
];

List locations = [
  LatLng(23.1661, 77.3281),
  // Ratibad
  LatLng(23.1925, 77.3468), // Neelbad

  LatLng(23.2332, 77.4343), // MP Nagar
  LatLng(23.1023, 77.4623), // Indrapuri
  LatLng(23.2523, 77.4623), // Indrapuri
  LatLng(23.2563, 77.4043),
  LatLng(23.2523, 77.4623), // Indrapuri
  LatLng(23.2563, 77.4043), // puri
];
