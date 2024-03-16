import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_styles.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/constants/custom_button.dart';
import 'package:flutter_samples/controllers/appointment_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BookAppointmentVIew extends StatelessWidget {
  final String docID;
  final String docName;
  BookAppointmentVIew({super.key, required this.docID, required this.docName});

  TextStyle hintStyle = TextStyle(
      color: Colors.grey[500], fontWeight: FontWeight.w400, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: Text(docName,
            style: TextStyle(
                fontSize: 24, fontFamily: 'Poppins', color: kTextColor)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWithFieldName(
                textField: TextField(
                  controller: controller.appointmentDayController,
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: 'Select appointment day',
                    hintStyle: hintStyle,
                    icon: Icon(
                      Icons.calendar_today,
                      size: 24.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                fieldName: "Appointment Day",
              ),
              8.heightBox,
              CustomTextFieldWithFieldName(
                textField: TextField(
                  controller: controller.appointmentTimeController,
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: 'Select time slot for appointment',
                    hintStyle: hintStyle,
                    icon: Icon(
                      FontAwesomeIcons.clock,
                      size: 24.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                fieldName: "Appointment Timing",
              ),
              8.heightBox,
              CustomTextFieldWithFieldName(
                textField: TextField(
                  controller: controller.appointmentMobileNoController,
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: 'Enter your active phone no.',
                    hintStyle: hintStyle,
                    icon: Icon(
                      Icons.call,
                      size: 24.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                fieldName: "Phone No.",
              ),
              8.heightBox,
              CustomTextFieldWithFieldName(
                textField: TextField(
                  controller: controller.appointmentNameController,
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: 'Enter patient name',
                    hintStyle: hintStyle,
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                fieldName: "Patient Name",
              ),
              8.heightBox,
              CustomTextFieldWithFieldName(
                textField: TextField(
                  controller: controller.appointmentMessageController,
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: 'Write your message..',
                    hintStyle: hintStyle,
                    icon: Icon(
                      Icons.message,
                      size: 24.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                fieldName: "Message for doctor",
              ),
              8.heightBox,
              // AppStyles.normal(title: "Select Appointment Day"),
              // CustomTextField(
              //   hint: "Select Day",
              //   textController: controler.appointmentDayController,
              // ),
              // 10.heightBox,
              // AppStyles.normal(title: "Select Appointment Time"),
              // CustomTextField(
              //     hint: "Select Time",
              //     textController: controler.appointmentTimeController),
              // 20.heightBox,
              // AppStyles.normal(title: "Mobile Number"),
              // CustomTextField(
              //     hint: "Enter you mobile number",
              //     textController: controler.appointmentMobileNoController),
              // 10.heightBox,
              // AppStyles.normal(title: "Name"),
              // CustomTextField(
              //     hint: "Enter you name",
              //     textController: controler.appointmentNameController),
              // 10.heightBox,
              // AppStyles.normal(title: "Message"),
              // CustomTextField(
              //     hint: "Enter you message",
              //     textController: controler.appointmentMessageController),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () async {
                await controller.bookAppointment(docID, docName, context);
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
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
