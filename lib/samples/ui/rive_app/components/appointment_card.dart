import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

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

class AppointmentCard extends StatelessWidget {
  AppointmentCard(
      {super.key,
      required this.appDate,
      required this.appDay,
      required this.index,
      required this.appTime,
      required this.appWith});
  String appDay, appDate, appTime, appWith;
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              // color: Colors.white,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF9CC5FF).withOpacity(0.4),
                    Color(0xFF9CC5FF).withOpacity(0.8),
                    // Colors.purple[200]!.withOpacity(0.6)
                  ]),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black12,
              //     blurRadius: 4,
              //     spreadRadius: 2,
              //   )
              // ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      appWith,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(
                      "Therapist",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    trailing: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.cyan[50],
                      backgroundImage: AssetImage(docImages[index]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            appDate,
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            appTime,
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //     color: Colors.green,
                          //     shape: BoxShape.circle,
                          //   ),
                          // ),
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Confirmed",
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Reschedule",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F6FA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        4.heightBox
      ],
    );
  }
}
