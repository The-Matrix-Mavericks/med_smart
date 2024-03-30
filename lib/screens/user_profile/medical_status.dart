import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/screens/user_profile/medical_form.dart';

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
        title: Text('Medical Records'),
      ),
      body: Wrap(children: [
        Center(
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MedicalForm()));
                },
                child: Text("Update Medical Details")),
          ),
        ),
        SizedBox(
          height: 15,
        ),
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
                  return Center(child: Text('No medical records found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final document = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                child: Text(
                                    'Clinical Issues: ${document['clinicalIssues']}')),
                            Card(
                                child: Text(
                                    'Ongoing Medicine: ${document['ongoing_medicine']}')),
                            Card(
                                child: Text(
                                    'Condition: ${document['condition']}')),
                            Card(
                              child: Text(
                                  'Timestamp: ${document['timestamp'].toDate().toString()}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
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
    );
  }
}
