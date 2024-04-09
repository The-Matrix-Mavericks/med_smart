import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_styles.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/constants/custom_button.dart';
import 'package:flutter_samples/controllers/appointment_controller.dart';
import 'package:flutter_samples/controllers/paymentMethod.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/button.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/custom_text_field.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/booking_datetime_contverted.dart';
import 'package:flutter_samples/screens/appointment/payment.dart';
import 'package:flutter_samples/screens/search_doctor/qr_code.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class BookAppointmentVIew extends StatefulWidget {
  final String docID;
  final String docName;
  final String fees;
  BookAppointmentVIew(
      {super.key,
      required this.docID,
      required this.docName,
      required this.fees});

  @override
  State<BookAppointmentVIew> createState() => _BookAppointmentVIewState();
}

class _BookAppointmentVIewState extends State<BookAppointmentVIew> {
  CalendarFormat _format = CalendarFormat.month;

  DateTime _focusDay = DateTime.now();

  DateTime _currentDay = DateTime.now();

  String selectedOption = 'Prepaid';

  int? _currentIndex;

  bool _isWeekend = false;

  bool _dateSelected = false;

  bool _timeSelected = false;

  TextStyle hintStyle = TextStyle(
      color: Colors.grey[500], fontWeight: FontWeight.w400, fontSize: 16);

  late Razorpay _razorpay;
  var controller = Get.put(AppointmentController());
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print("Payment Success: " + response.paymentId!);

    if (response.paymentId!.isNotEmpty) {
      final getDate = DateConverted.getDate(_currentDay);
      final getDay = DateConverted.getDay(_currentDay.weekday);
      final getTime = DateConverted.getTime(_currentIndex!);
      print(getTime + " " + getDay + " " + getDate);
      controller.bookAppointment(
          widget.docID, widget.docName, getDate, getDay, getTime, context);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print("Payment Error: " +
        response.code.toString() +
        " - " +
        response.message!);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet: " + response.walletName!);
  }

  _openCheckout() {
    double amount = double.tryParse(widget.fees) ?? 0;
    int amountInPaise = (amount * 100).toInt();
    var options = {
      'key': 'rzp_test_Y9xW7kK9cQ6HWo',
      'amount': amountInPaise, // amount in the smallest currency unit
      'name': 'Med Smart',
      'description': 'Appoinment Fee',
      'prefill': {
        'contact': '8839361702',
        'email': 'arpitpatel12122001@gmail.com'
      },
      'external': {
        'wallets': ['paytm', 'phone-pe']
      }
    };

    try {
      print("working--------");
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    PaymentMethod provider = Provider.of<PaymentMethod>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.docName,
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: kTextColor,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
        // actions: [
        //   IconButton(
        // icon: Icon(Icons.qr_code), onPressed: () => Get.to(()=>QrCode())),
        // ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Weekend is not available, please select another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index ? primaryColor : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
          //     child: Button(
          //       width: double.infinity,
          //       title: 'Make Appointment',
          //       onPressed: () async {
          //         //convert date/day/time into string first
          //         final getDate = DateConverted.getDate(_currentDay);
          //         final getDay = DateConverted.getDay(_currentDay.weekday);
          //         final getTime = DateConverted.getTime(_currentIndex!);

          //         // final booking = await DioProvider().bookAppointment(
          //         //     getDate, getDay, getTime, doctor['doctor_id'], token!);

          //         //if booking return status code 200, then redirect to success booking page

          //         // if (booking == 200) {
          //         //   MyApp.navigatorKey.currentState!
          //         //       .pushNamed('success_booking');
          //         // }
          //       },
          //       disable: _timeSelected && _dateSelected ? false : true,
          //     ),
          //   ),
          // ),

          // 8.heightBox,
          SliverToBoxAdapter(
              child: Column(
            children: [
              Card(
                  child: Container(
                      height: 50,
                      // width: 300,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            'Doctor Fees :',
                            style: TextStyle(
                                color: Color.fromARGB(221, 8, 2, 2),
                                // fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                          Center(child: Icon(Icons.currency_rupee)),
                          Center(
                              child: Text(
                            '${widget.fees}',
                            style: TextStyle(
                                color: Color.fromARGB(221, 8, 2, 2),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ],
                      ))),
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
              // 8.heightBox,
              Center(
                  child: Text(
                'Payment Methods',
                style: TextStyle(
                    color: Color.fromARGB(221, 8, 2, 2),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Prepaid'),
                      value: 'Prepaid',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          provider.updateValue(true);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('Postpaid'),
                      value: 'Postpaid',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          provider.updateValue(false);
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
      bottomNavigationBar: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () async {
                // final getDate = DateConverted.getDate(_currentDay);
                // final getDay = DateConverted.getDay(_currentDay.weekday);
                // final getTime = DateConverted.getTime(_currentIndex!);
                // print(getTime + " " + getDay + " " + getDate);
                // await controller.bookAppointment(widget.docID, widget.docName,
                //     getDate, getDay, getTime, context);

                await _openCheckout();
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

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: primaryColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}



// CustomTextFieldWithFieldName(
              //   textField: TextField(
              //     controller: controller.appointmentDayController,
              //     // onChanged: (value) {
              //     //   _name = value;
              //     // },
              //     style: const TextStyle(
              //       fontSize: 17,
              //     ),
              //     decoration: kTextInputDecoration.copyWith(
              //       hintText: 'Select appointment day',
              //       hintStyle: hintStyle,
              //       icon: Icon(
              //         Icons.calendar_today,
              //         size: 24.0,
              //         color: Colors.grey[700],
              //       ),
              //     ),
              //   ),
              //   fieldName: "Appointment Day",
              // ),
              // 8.heightBox,
              // CustomTextFieldWithFieldName(
              //   textField: TextField(
              //     controller: controller.appointmentTimeController,
              //     // onChanged: (value) {
              //     //   _name = value;
              //     // },
              //     style: const TextStyle(
              //       fontSize: 17,
              //     ),
              //     decoration: kTextInputDecoration.copyWith(
              //       hintText: 'Select time slot for appointment',
              //       hintStyle: hintStyle,
              //       icon: Icon(
              //         FontAwesomeIcons.clock,
              //         size: 24.0,
              //         color: Colors.grey[600],
              //       ),
              //     ),
              //   ),
              //   fieldName: "Appointment Timing",
              // ),
              // 8.heightBox,
              // CustomTextFieldWithFieldName(
              //   textField: TextField(
              //     controller: controller.appointmentMobileNoController,
              //     // onChanged: (value) {
              //     //   _name = value;
              //     // },
              //     style: const TextStyle(
              //       fontSize: 17,
              //     ),
              //     decoration: kTextInputDecoration.copyWith(
              //       hintText: 'Enter your active phone no.',
              //       hintStyle: hintStyle,
              //       icon: Icon(
              //         Icons.call,
              //         size: 24.0,
              //         color: Colors.grey[600],
              //       ),
              //     ),
              //   ),
              //   fieldName: "Phone No.",
              // ),
              // 8.heightBox,
              // CustomTextFieldWithFieldName(
              //   textField: TextField(
              //     controller: controller.appointmentNameController,
              //     // onChanged: (value) {
              //     //   _name = value;
              //     // },
              //     style: const TextStyle(
              //       fontSize: 17,
              //     ),
              //     decoration: kTextInputDecoration.copyWith(
              //       hintText: 'Enter patient name',
              //       hintStyle: hintStyle,
              //       icon: Icon(
              //         Icons.person,
              //         size: 24.0,
              //         color: Colors.grey[600],
              //       ),
              //     ),
              //   ),
              //   fieldName: "Patient Name",
              // ),
              // 8.heightBox,
              // CustomTextFieldWithFieldName(
              //   textField: TextField(
              //     controller: controller.appointmentMessageController,
              //     // onChanged: (value) {
              //     //   _name = value;
              //     // },
              //     style: const TextStyle(
              //       fontSize: 17,
              //     ),
              //     decoration: kTextInputDecoration.copyWith(
              //       hintText: 'Write your message..',
              //       hintStyle: hintStyle,
              //       icon: Icon(
              //         Icons.message,
              //         size: 24.0,
              //         color: Colors.grey[600],
              //       ),
              //     ),
              //   ),
              //   fieldName: "Message for doctor",
              // ),
              // 8.heightBox,
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