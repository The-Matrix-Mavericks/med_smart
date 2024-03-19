import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_samples/screens/search_doctor/success_page.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;

  var appointmentDayController = TextEditingController();
  var appointmentTimeController = TextEditingController();
  var appointmentMobileNoController = TextEditingController();
  var appointmentNameController = TextEditingController();
  var appointmentMessageController = TextEditingController();

  bookAppointment(String docID, String docName, String appDate, String appDay,
      String appTime, context) async {
    isLoading(true);
    var store = FirebaseFirestore.instance.collection('appointment').doc();
    await store.set({
      'appointmentBy': FirebaseAuth
          .instance.currentUser?.uid, // user id from USER collection
      'appointmentDay':
          // appointmentDayController.text, // selected day for appointment
          appDay, // selected day for appointment
      'appointmentTime':
          // appointmentTimeController.text, // selected time for appointment
          appTime, // selected time for appointment
      'appointmentDate':
          // appointmentTimeController.text, // selected time for appointment
          appDate, // selected time for appointment
      'appointmentMobileNo':
          appointmentMobileNoController.text, // mobile no. of user
      'appointmentName': appointmentNameController
          .text, //  name of user appointment is booked for
      'appointmentMessage': appointmentMessageController
          .text, // message by user for doctor about the health condition
      'appointmentWith': docID, // doctor id from DOCTOR collection
      'appointmentWithName': docName, // doctor name from DOCTOR collection
    });
    isLoading(false);
    // VxToast.show(context,
    //     msg: "Appointment booked successfully ✅",
    //     textSize: 18,
    //     bgColor: Colors.black,
    //     textColor: Colors.white);
    Get.to(() => AppointmentBooked());
  }

  // Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(bool isDoctor) {
  //   if (isDoctor) {
  //     return FirebaseFirestore.instance
  //         .collection('appointment')
  //         .where('appointmentWith',
  //             isEqualTo: FirebaseAuth.instance.currentUser?.uid)
  //         .get();
  //   } else {
  //     return FirebaseFirestore.instance
  //         .collection('appointment')
  //         .where('appointmentBy',
  //             isEqualTo: FirebaseAuth.instance.currentUser?.uid)
  //         .get();
  //   }
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentsOfUser() {
    return FirebaseFirestore.instance
        .collection('appointment')
        .where('appointmentBy',
            isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
  }
}
