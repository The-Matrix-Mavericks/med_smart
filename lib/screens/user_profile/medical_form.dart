import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/chat_page/vediocall.dart';
import 'package:flutter_samples/screens/user_profile/user_profile.dart';

class MedicalForm extends StatefulWidget {
  @override
  _MedicalFormState createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _clinicalIssuesController =
      TextEditingController(); // ClinicalIssues Big Controller
  final TextEditingController _ongoingMedicineController =
      TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();

  List<String> _selectedDiagnoses = [];
  List<String> _diagnosesOptions = [
    'Diagnosis A',
    'Diagnosis B',
    'Diagnosis C',
    'Diagnosis D',
    // Add more diagnoses options as needed
  ];
  bool _showDropdown = false;
  List<String> _selectedItems = [];
  List<String> _clinicalList = [
    'No clinical issues',
    'Allergies',
    'Anemis',
    'Asthma',
    'Arthritis',
    'Conditions',
    'Depression',
    'Diabetes (insulin dependent )',
    'Diabets ( insulin independent )',
    'Drug/ Alcohaol Abuse',
    'High Cholesterol',
    'Hypertension',
    'Hypothyroidism',
    'Infection Problems',
    'Insomnia',
    'Irritable Bowel Syndrome',
    'Kidney Problems',
    'Liver Problems',
    'Menopause',
    'Malaria',
    'Organ Injury',
    'Osteoporosis',
    'Tuberculosis ( TB )',
    'Typhoid',
    'Other'
    // Add more items as needed
  ];
  showTextFeild() {
    TextFormField();
    setState(() {});
  }

  Future<String?> getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final userId = await getCurrentUserId();
      // Save form data to Firestore
      await FirebaseFirestore.instance.collection('medical_records').add({
        'userId': userId,
        "clinicalIssues": _clinicalIssuesController!.text,
        'ongoing_medicine': _ongoingMedicineController.text,
        'condition': _medicalConditionController.text,
        'timestamp': DateTime.now(),
      });

      // Clear text fields and selected diagnoses after submission

      _ongoingMedicineController.clear();
      _medicalConditionController.clear();
      // SnackBar(content: Text("Details Updated"));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => UserProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medical Status'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text('Clinical Issues', style: TextStyle()),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  onTap: () {
                                    setState(() {
                                      _showDropdown = !_showDropdown;
                                      print("Show DropDown $_showDropdown");
                                    });
                                  },
                                  controller: _clinicalIssuesController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: 'Clinical Issues',
                                    suffixIcon: Container(
                                      child: _showDropdown
                                          ? Icon(
                                              Icons.arrow_drop_up_outlined,
                                              color: _showDropdown
                                                  ? Colors.blue
                                                  : Colors.black,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_down_outlined,
                                            ),
                                    ),
                                  ),
                                ),
                                if (_showDropdown)
                                  SizedBox(
                                    height: 1450, // Adjust the height as needed
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    179, 114, 109, 109)
                                                .withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(
                                                parent: BouncingScrollPhysics(),
                                              ),
                                              itemCount: _clinicalList.length,
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile
                                                    .adaptive(
                                                  title: Text(
                                                      _clinicalList[index]),
                                                  value:
                                                      _selectedItems.contains(
                                                          _clinicalList[index]),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if (value!) {
                                                        _selectedItems.add(
                                                            _clinicalList[
                                                                index]);
                                                      } else {
                                                        _selectedItems.remove(
                                                            _clinicalList[
                                                                index]);
                                                      }
                                                      _clinicalIssuesController
                                                              ?.text =
                                                          _selectedItems
                                                              .join(', ');
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          GestureDetector(
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 180,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              onTap: () => {
                                                    setState(() {
                                                      print(
                                                          "ClinicalIssuesController --------------->$_clinicalIssuesController");
                                                      _showDropdown =
                                                          !_showDropdown;
                                                    })
                                                  }),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (_clinicalIssuesController
                                    .toString()
                                    .isEmpty)
                                  showTextFeild()
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _ongoingMedicineController,
                              decoration: InputDecoration(
                                labelText: 'Ongoing Medicine',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Ongoing Medicine';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _medicalConditionController,
                              decoration: InputDecoration(
                                labelText: 'Medical Condition',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your medical condition';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: _submitForm,
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )),
        ));
  }
}
