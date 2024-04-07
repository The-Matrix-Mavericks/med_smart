import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/controllers/appointment_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/appointment_card.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _ChatPageState();
}



class _ChatPageState extends State<AppointmentPage> {
  int _buttonIndex = 0;
  @override
  Widget build(BuildContext context) {
    var controller = AppointmentController();
    return Scaffold(
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
            25.heightBox,
            Container(
              // padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 230, 238, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          // decoration: BoxDecoration(
                          //   color: _buttonIndex == 0
                          //       // ? Color(0xFF7165D6)
                          //       ? primaryColor
                          //       : Colors.transparent,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: _buttonIndex == 0
                                    ? Colors.black
                                    : Colors.black38,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Container(
                            width: 110,
                            color: _buttonIndex == 0
                                ? primaryColor
                                : Colors.transparent,
                            height: 2.5)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          // decoration: BoxDecoration(
                          //   color: _buttonIndex == 0
                          //       // ? Color(0xFF7165D6)
                          //       ? primaryColor
                          //       : Colors.transparent,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Text(
                            "Completed",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: _buttonIndex == 1
                                    ? Colors.black
                                    : Colors.black38,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Container(
                            width: 110,
                            color: _buttonIndex == 1
                                ? primaryColor
                                : Colors.transparent,
                            height: 2.5)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          // decoration: BoxDecoration(
                          //   color: _buttonIndex == 0
                          //       // ? Color(0xFF7165D6)
                          //       ? primaryColor
                          //       : Colors.transparent,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: _buttonIndex == 2
                                    ? Colors.black
                                    : Colors.black38,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Container(
                            width: 110,
                            color: _buttonIndex == 2
                                ? primaryColor
                                : Colors.transparent,
                            height: 2.5)
                      ],
                    ),
                  )
                ],
              ),
            ),
            15.heightBox,
            Visibility(
              visible: _buttonIndex == 0,
              child: FutureBuilder(
                future: controller.getAppointmentsOfUser(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var app_list = data[index];

                        var inputFormat = DateFormat('MM/dd/yyyy');
                        var date1 =
                            inputFormat.parse(app_list['appointmentDate']);
                        var outputFormat = DateFormat('dd-MM-yyyy');
                        var date2 = outputFormat.format(date1); // 2019-08-18

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: AppointmentCard(
                            appDate: date2,
                            index: index,
                            appDay: app_list['appointmentDay'],
                            appTime: app_list['appointmentTime'],
                            appWith: app_list['appointmentWithName'],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
