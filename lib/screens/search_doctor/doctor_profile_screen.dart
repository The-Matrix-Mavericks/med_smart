import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/constants/app_styles.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/constants/custom_button.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/doc_info_field.dart';
import 'package:flutter_samples/screens/search_doctor/book_appointment_screen.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Doctor Details",
              style: TextStyle(
                  fontSize: 24, fontFamily: 'Poppins', color: kTextColor)),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Get.back()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue[200],
                      child: Image.asset("assets/images/doctor_icon1.png"),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 2, width: 100, color: Colors.grey)),
                  ],
                ),
                15.heightBox,
                Text(
                  doc['docName'],
                  style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
                ),
                0.heightBox,
                Text(
                  "Physician",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Colors.grey[700]),
                ),
                8.heightBox,
                SizedBox(
                  width: _width * 0.75,
                  child: const Text(
                    'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Inter',
                      fontSize: 15,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                8.heightBox,
                SizedBox(
                  width: _width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_hospital),
                      4.widthBox,
                      const Text(
                        'Apex Multispeciality Hospital',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: _height * 0.12,
                      width: _width * 0.28,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF9CC5FF).withOpacity(0.6),
                                Color.fromARGB(255, 40, 76, 255)
                                    .withOpacity(0.3)
                              ]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Patients',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                          5.heightBox,
                          Text(
                            '154',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _height * 0.12,
                      width: _width * 0.28,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF9CC5FF).withOpacity(0.6),
                                Color.fromARGB(255, 40, 76, 255)
                                    .withOpacity(0.3)
                              ]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Experience',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                          5.heightBox,
                          Text(
                            '10+ years',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _height * 0.12,
                      width: _width * 0.28,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 236, 225, 255),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF9CC5FF).withOpacity(0.6),
                                Color.fromARGB(255, 40, 76, 255)
                                    .withOpacity(0.3)
                              ]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ratings',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                          5.heightBox,
                          Text(
                            '4.5',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // 10.widthBox,
                  ],
                ),

                15.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    ),
                  ),
                ),
                4.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      doc['docAbout'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.grey[700]),
                    ),
                  ),
                ),

                10.heightBox,
                Container(
                  padding: EdgeInsets.all(0),
                  color: AppColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // DocInfoBox(
                      //     infoLabel: "Name",
                      //     infoText: doc['docName'],
                      //     icon: iconList[0]),
                      DocInfoBox(
                          infoLabel: "Email",
                          infoText: doc['docEmail'],
                          icon: iconList[1]),
                      DocInfoBox(
                          infoLabel: "Phone",
                          infoText: doc['docPhone'],
                          icon: iconList[2]),
                      DocInfoBox(
                          infoLabel: "Address",
                          infoText: doc['docAddress'],
                          icon: iconList[3]),
                      DocInfoBox(
                          infoLabel: "Services",
                          infoText: doc['docServices'],
                          icon: iconList[5]),
                      DocInfoBox(
                          infoLabel: "Category",
                          infoText: doc['docCategory'],
                          icon: iconList[6]),
                      DocInfoBox(
                          infoLabel: "Timing",
                          infoText: doc['docTiming'],
                          icon: iconList[7]),
                    ],
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.to(() => BookAppointmentVIew(
                  docID: doc['docID'],
                  docName: doc['docName'],
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: kTextColor,
              ),
              height: 60.0,
              child: Center(
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
        )

        // CustomButton(
        //   buttonText: "Book an appointment",
        //   onTap: () {
        //     Get.to(() => BookAppointmentVIew(
        //           docID: doc['docID'],
        //           docName: doc['docName'],
        //         ));
        //   },
        // ),
        );
  }

  List<Icon> iconList = [
    Icon(
      Icons.person,
      size: 20,
    ),
    Icon(
      Icons.alternate_email,
      size: 20,
    ),
    Icon(
      Icons.call,
      size: 20,
    ),
    Icon(
      Icons.location_on,
      size: 20,
    ),
    Icon(
      Icons.notes,
      size: 20,
    ),
    Icon(
      Icons.medical_services,
      size: 20,
    ),
    Icon(
      FontAwesomeIcons.userDoctor,
      size: 20,
    ),
    Icon(
      FontAwesomeIcons.clock,
      size: 20,
    ),
  ];
}

//  Container(
//                   color: Colors.white,
//                   child: Row(
//                     children: [
//                       35.widthBox,
//                       Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 48,
//                             backgroundColor: Colors.blue[200],
//                             child:
//                                 Image.asset("assets/images/doctor_icon1.png"),
//                           ),
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Container(
//                                   height: 2, width: 100, color: Colors.grey)),
//                         ],
//                       ),
//                       20.widthBox,
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               doc['docName'],
//                               style: TextStyle(
//                                   fontSize: 24, fontFamily: 'Poppins'),
//                             ),
//                             Text(
//                               "Physician",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   color: Colors.grey[700]),
//                             ),
//                             Text(
//                               "5+ Years Experience",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   color: Colors.grey[700]),
//                             ),
//                             VxRating(
//                               selectionColor: Colors.amber,
//                               onRatingUpdate: (value) {},
//                               maxRating: 5,
//                               count: 5,
//                               // Doctor's rating from Firebase
//                               value: double.parse(doc['docRating'].toString()),
//                               stepInt: true,
//                             ),
//                           ],
//                         ),
//                       ),
//                       // AppStyles.normal(
//                       //     title: "See all reviews",
//                       //     size: AppSizes.size14,
//                       //     color: AppColors.blueColor),
//                     ],
//                   ),
//                 ),

//                 10.heightBox,
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   color: AppColors.whiteColor,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // ListTile(
//                       //   title: AppStyles.normal(
//                       //       title: "Phone Number",
//                       //       color: AppColors.textColor,
//                       //       size: AppSizes.size16),
//                       //   subtitle: AppStyles.normal(
//                       //       title: doc['docPhone'],
//                       //       color: AppColors.textColor,
//                       //       size: AppSizes.size12),
//                       //   trailing: Icon(Icons.phone),
//                       // ),
//                       // AppStyles.normal(
//                       //     title: "About",
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size18),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: doc['docAbout'],
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size14),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: "Address",
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size18),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: doc['docAddress'],
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size14),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: "Services",
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size18),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: doc['docServices'],
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size14),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: "Working Time",
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size18),
//                       // 5.heightBox,
//                       // AppStyles.normal(
//                       //     title: doc['docTiming'],
//                       //     color: AppColors.textColor,
//                       //     size: AppSizes.size14),

//                       DocInfoBox(
//                           infoLabel: "Name",
//                           infoText: doc['docName'],
//                           icon: iconList[0]),
//                       DocInfoBox(
//                           infoLabel: "Email",
//                           infoText: doc['docEmail'],
//                           icon: iconList[1]),
//                       DocInfoBox(
//                           infoLabel: "Phone",
//                           infoText: doc['docPhone'],
//                           icon: iconList[2]),
//                       DocInfoBox(
//                           infoLabel: "Address",
//                           infoText: doc['docAddress'],
//                           icon: iconList[3]),
//                       DocInfoBox(
//                           infoLabel: "About",
//                           infoText: doc['docAbout'],
//                           icon: iconList[4]),
//                       DocInfoBox(
//                           infoLabel: "Services",
//                           infoText: doc['docServices'],
//                           icon: iconList[5]),
//                       DocInfoBox(
//                           infoLabel: "Category",
//                           infoText: doc['docCategory'],
//                           icon: iconList[6]),
//                       DocInfoBox(
//                           infoLabel: "Timing",
//                           infoText: doc['docTiming'],
//                           icon: iconList[7]),
//                     ],
//                   ),
//                 ),
//                 // Spacer(),
//               ],
//             ),
