import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/controllers/doctor_screen_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/custom_text_field.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/screens/search_doctor/doctor_profile_screen.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchDoctorPage extends StatefulWidget {
  const SearchDoctorPage({super.key});

  @override
  State<SearchDoctorPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<SearchDoctorPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DoctorScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/app_logo.png",
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.heightBox,
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //   child: Container(
            //     // padding: EdgeInsets.all(14),
            //     height: 100,
            //     width: double.infinity,
            //     // color: Colors.blue,
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: CustomTextField(
            //             textController: controller.searchQueryController,
            //             hint: "Search",
            //             textColor: Colors.black,
            //             borderColor: Colors.grey,
            //             inputColor: Colors.black,
            //           ),
            //         ),
            //         10.heightBox,
            //         IconButton(
            //             onPressed: () {
            //               // Get.to(() => SearchView(
            //               //       searchQuery:
            //               //           controller.searchQueryController.text,
            //               //     ));
            //             },
            //             icon: Icon(
            //               Icons.search,
            //               color: Colors.black,
            //             ))
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 15, left: 15),

              /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
              /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Center(
                        child: Text("DOCTORS",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: kTextColor,
                                fontFamily: "Popins"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 75.0, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: kTextColor,
                              fontFamily: "Inter")),
                    ),
                  ),
                  AnimSearchBar(
                    helpText: "Search Doctor..",
                    suffixIcon: Icon(
                      FontAwesomeIcons.close,
                      color: Colors.white,
                    ),
                    textFieldColor: Colors.grey[300],
                    color: Colors.grey[700],
                    prefixIcon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, fontFamily: 'Inter'),
                    width: 400,
                    textController: controller.searchQueryController,
                    onSuffixTap: () {
                      setState(() {
                        controller.searchQueryController.clear();
                      });
                    },
                    onSubmitted: (String) {
                      print(controller.searchQueryController.text);
                    },
                  ),
                ],
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: controller.getDoctorList(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var data = snapshot.data?.docs;
                    print(data!.length
                        .toString()); // to print the no of Doctors in the Firebase
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        height: 135,
                        child: ListView.builder(
                            // to show top 3 doctors
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DoctorProfileView(
                                        doc: data![index],
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  height: 100,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      // color: Color(0xFF9CC5FF).withOpacity(0.9),
                                      color: Color.fromARGB(255, 243, 243, 243),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black45,
                                            blurRadius: 5,
                                            offset: Offset(5, 5))
                                      ],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      8.heightBox,
                                      Image.asset(
                                        "assets/images/doctor_icon1.png", // show doctor pic
                                        width: 65.0,
                                        // color: Colors.white,
                                        fit: BoxFit.cover,
                                      ),
                                      // 5.heightBox,
                                      Text(
                                        data[index]['docName'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // 5.heightBox,
                                      Text(
                                        data[index]['docCategory'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[800]),
                                      ),
                                      5.heightBox
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
