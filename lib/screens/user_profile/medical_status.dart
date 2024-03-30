import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:flutter_samples/screens/user_profile/medical_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String dateString = '27-02-2002';
DateFormat format = new DateFormat("dd-MM-yyyy");

class MedicalRecordsScreen extends StatefulWidget {
  @override
  _MedicalRecordsScreenState createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  late Future<List<DocumentSnapshot>> _medicalRecordsFuture;

  @override
  void initState() {
    super.initState();
    _medicalRecordsFuture = _fetchUserMedicalRecords();
  }

  Future<List<DocumentSnapshot>> _fetchUserMedicalRecords() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('medical_records')
          .where('userId', isEqualTo: userId)
          .get();
      return querySnapshot.docs;
    } else {
      throw Exception('User is not authenticated.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Medical Records",
              style: TextStyle(
                  fontSize: 24, fontFamily: 'Poppins', color: primaryColor)),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Get.back()),
        ),
        body: Wrap(children: [
          SingleChildScrollView(
            child: Container(
              height: 1000,
              child: FutureBuilder<List<DocumentSnapshot>>(
                future: _medicalRecordsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Image.asset(
                            'assets/images/no_data.jpg',
                            width: 250,
                          ),
                          Text(
                            'No medical records found',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final document = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 8,
                            color: Colors.grey[50],
                            margin: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Clinical Issues: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['clinicalIssues']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Ongoing Medicine: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['ongoing_medicine']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Condition: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['condition']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Surgical History: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['surgical_history']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Prescriptions: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['prescription']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Allergies: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['allergies']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Smoking, Alcohol etc. ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '${document['allergies']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),

                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Updted on: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                    TextSpan(
                                        text:
                                            '${document['timestamp'].toDate().toString().substring(0, 10)} at ${document['timestamp'].toDate().toString().substring(11, 16)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ])),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ]),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.to(() => MedicalForm());
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: primaryColor,
              ),
              height: 60.0,
              child: Center(
                child: Text(
                  "Add Medical Records",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
        ));
  }
}
