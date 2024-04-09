import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_colors.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/controllers/doctor_screen_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/custom_text_field.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/screens/doctor_map/doctor_map.dart';
import 'package:flutter_samples/screens/search_doctor/doctor_profile_screen.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchDoctorPage extends StatefulWidget {
  const SearchDoctorPage({super.key});

  @override
  State<SearchDoctorPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<SearchDoctorPage> {
  List<String> icons = [
    "assets/icons/tooth.png",
    "assets/icons/heart.png",
    "assets/icons/hair.png",
    "assets/icons/skin.png",
    "assets/icons/nose.png",
    "assets/icons/stomach.png",
    "assets/icons/lungs.png",
    "assets/icons/bone.png",
    "assets/icons/eye.png",
    "assets/icons/ear.png",
  ];
  List<String> iconsLable = [
    'Tooth',
    'Heart',
    'Hair',
    'Skin',
    'Nose',
    'Stomach',
    'Lungs',
    'Bones',
    'Eyes',
    'Ears',
  ];

  List docLocations = [
    LatLng(23.1661, 77.3281), // Ratibad

    LatLng(23.1925, 77.3468), // Neelbad
    LatLng(23.2567, 77.4343),
    // Ashkoda Garden
    LatLng(23.2332, 77.4343), // MP Nagar

    LatLng(23.2523, 77.4623),
  ];

  bool isViewAll = false;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    var controller = Get.put(DoctorScreenController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 254, 255),
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: Colors.white,
        ),
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
              padding: const EdgeInsets.only(
                  top: 30.0, right: 18, left: 18, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF9CC5FF).withOpacity(0.6),
                          Color.fromARGB(255, 40, 76, 255).withOpacity(0.3)
                        ]),
                    // color: Color(0xFF9CC5FF).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15)),
                height: _height * 0.2,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/home_doc.png",
                      height: _height * 0.2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "How do you feel?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        8.heightBox,
                        Text(
                          "When you need any help,\nMed Smart is with you... ",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                        ),
                        10.heightBox,
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Color(0xFFBBA6FF).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "Get started",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                        // .onTap(() => Get.to(() => DoctorMap())),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 20, left: 18, bottom: 15),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  decoration: BoxDecoration(
                      color: Color(0xFF9CC5FF).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  height: _height * 0.08,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          FontAwesomeIcons.search,
                          color: Colors.grey[600],
                        ),
                        border: InputBorder.none,
                        hintText: "How can we help you?",
                        hintStyle: textStyle1.copyWith(
                            color: Colors.grey[600], fontSize: 16)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 52,
                child: ListView.builder(
                    // to show top 3 doctors
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: icons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        // onTap: () {
                        //   Get.to(() => DoctorProfileView(
                        //         doc: data![index],
                        //       ));
                        // },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 7),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: Colors.grey[200]!, width: 2),
                                  // color: Color(0xFF9CC5FF).withOpacity(0.9),
                                  color: AppColors.grey.withOpacity(0.1),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       color: Colors.black45,
                                  //       blurRadius: 5,
                                  //       offset: Offset(5, 5))
                                  // ],
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  // 8.heightBox,
                                  Image.asset(
                                    icons[index], // show doctor pic
                                    height: 40.0,
                                    // color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                  5.widthBox,
                                  Text(
                                    iconsLable[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                  // 5.heightBox
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isViewAll ? "Available Doctors" : "Top Doctors",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        isViewAll = !isViewAll;
                      });
                    }),
                    child: Text(
                      isViewAll ? "View top" : "View all",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            8.heightBox,
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
                    // print(data!.length
                    //     .toString()); // to print the no of Doctors in the Firebase
                    return Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 15),
                      child: SizedBox(
                        height: _height * 0.4,
                        child: ListView.builder(
                            // to show top 3 doctors
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: isViewAll
                                ? data?.length ?? 0
                                : data!.length <= 5
                                    ? data!.length
                                    : 5,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DoctorProfileView(
                                        doc: data![index],
                                        image: docImages[index],
                                        latLng: docLocations[index],
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      // margin: EdgeInsets.only(bottom: 8),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      height: 100,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     color: Colors.grey[300]!, width: 1),
                                          // color: Color(0xFF9CC5FF).withOpacity(0.9),
                                          color:
                                              Colors.blue[50]!.withOpacity(0.7),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black45,
                                          //       blurRadius: 5,
                                          //       offset: Offset(5, 5))
                                          // ],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceAround,
                                        children: [
                                          8.heightBox,
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.blue[100],
                                            child: Image.asset(
                                              docImages[
                                                  index], // show doctor pic
                                            ),
                                          ),
                                          10.widthBox,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              15.heightBox,
                                              Text(
                                                // "Dr. ${data![index]['docName']}",
                                                data![index]['docName'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Inter',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // 5.heightBox,
                                              Row(
                                                children: [
                                                  Text(
                                                    // data[index]['docCategory'],
                                                    "Physician",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                  10.widthBox,
                                                  Text(
                                                    // data[index]['docRating'].toString(),
                                                    "⭐ 4.5",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    // data[index]['docRating'].toString(),
                                                    "5+ years",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                  10.widthBox,
                                                  Icon(Icons.location_on),
                                                  Text(
                                                    data[index]['docAddress']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                ],
                                              ),
                                              5.heightBox
                                            ],
                                          ),

                                          // 5.heightBox,
                                        ],
                                      ),
                                    ),
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
      floatingActionButton: IconButton(
        onPressed: () => Get.to(() => DoctorMap()),
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 65, right: 0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(5, 5),
                    blurRadius: 8,
                  )
                ]),
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  List<String> docImages = [
    "assets/images/doctor.png",
    "assets/images/doctor_4.png",
    "assets/images/doctor_3.png",
    "assets/images/doctor_1.png",
    "assets/images/doctor_5.png",
    "assets/images/doctor.png",
    "assets/images/doctor_4.png",
    "assets/images/doctor_3.png",
    "assets/images/doctor_1.png",
    "assets/images/doctor_5.png",
  ];
}
