import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/hcard.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/vcard.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/courses.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<CourseModel> _courses = CourseModel.courses;
  final List<CourseModel> _courseSections = CourseModel.courseSections;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController specialistContact = TextEditingController();

  bool showPopup = false;
  @override
  void initState() {
    super.initState();
    getUserDetails();
    Future.delayed(Duration.zero, () {
      if (showPopup) {
        showAlert(context, showPopup);
      } else {
        print("Now do not need to show the popup view ");
      }
    });
  }

  getUserDetails() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    showPopup = sp.getBool('isRegistered') ?? false;
    print("Show popup is :  ${showPopup}");
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () {
    //   if (showPopup) {
    //     showAlert(context, showPopup);
    //   }
    // });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: RiveAppTheme.background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 60,
              bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 8),
                child: Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 22, fontFamily: "Poppins"),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _courses
                      .map(
                        (course) => Padding(
                          key: course.id,
                          padding: const EdgeInsets.all(10),
                          child: VCard(course: course),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Utilities",
                  style: TextStyle(fontSize: 22, fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  children: List.generate(
                    _courseSections.length,
                    (index) => Container(
                      key: _courseSections[index].id,
                      width: MediaQuery.of(context).size.width > 992
                          ? ((MediaQuery.of(context).size.width - 20) / 2)
                          : MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      child: HCard(section: _courseSections[index]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context, bool showPopup) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return showDialog(
          // useSafeArea: true,
          anchorPoint: Offset(2, 2),
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return PopScope(
                canPop: true,
                onPopInvoked: null,
                child: AlertDialog(
                  content: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height / 50),
                          // Image(
                          //   image: AssetImage('assets/brain4.png'),
                          //   height: height / 4,
                          //   width: 0.75 * width,
                          // ),
                          Text(
                            "Please Fill the Details",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          TextFieldComponent(
                            width: width,
                            controller: nameController,
                            hintText: "Enter your name",
                            FieldName: "Name",
                            type: TextInputType.text,
                            necessaryField: true,
                          ),
                          TextFieldComponent(
                            width: width,
                            controller: phoneController,
                            hintText: "Enter your Contact No",
                            FieldName: "Phone",
                            type: TextInputType.phone,
                            necessaryField: true,
                          ),
                          TextFieldComponent(
                            width: width,
                            controller: addressController,
                            hintText: "Enter your Address",
                            FieldName: "Address",
                            type: TextInputType.text,
                            necessaryField: true,
                          ),
                          TextFieldComponent(
                            width: width,
                            controller: ageController,
                            hintText: "Enter your Age",
                            FieldName: "Age",
                            type: TextInputType.number,
                            necessaryField: true,
                          ),
                          // TextFieldComponent(
                          //   width: width,
                          //   controller: friendName,
                          //   hintText: "Enter your well wisher's name",
                          //   FieldName: "Well Wisher's Name",
                          //   type: TextInputType.text,
                          //   necessaryField: true,
                          // ),
                          TextFieldComponent(
                            width: width,
                            controller: weightController,
                            hintText: "Enter your Weight",
                            FieldName: "Weight",
                            type: TextInputType.number,
                            necessaryField: true,
                          ),

                          // SizedBox(height: height / 20),
                          // Text(
                          //   'If you have any history of mental/health related diagonasis,\nPlease fill the following',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(fontSize: 14, color: Colors.red),
                          // ),
                          TextFieldComponent(
                            width: width,
                            controller: heightController,
                            hintText: "Enter your Height",
                            FieldName: "Height",
                            type: TextInputType.number,
                            necessaryField: false,
                          ),
                          // TextFieldComponent(
                          //   width: width,
                          //   controller: specialistContact,
                          //   hintText: "Enter email of specialist/pyschologist",
                          //   FieldName: "Email of specialist",
                          //   type: TextInputType.emailAddress,
                          //   necessaryField: false,
                          // ),
                          SizedBox(height: 20),

                          Container(
                            width: 150,
                            child: Card(
                              shadowColor: Colors.amber,
                              child: TextButton(
                                  onPressed: () async {
                                    SharedPreferences sp =
                                        await SharedPreferences.getInstance();
                                    showPopup =
                                        await sp.setBool("isRegistered", false);
                                    setState(() {});
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             HomeTabView()));
                                    Navigator.pop(context);
                                  },
                                  child: Text("SAVE")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          });
    });
  }
}

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {Key? key,
      required this.width,
      required this.controller,
      required this.hintText,
      required this.FieldName,
      required this.type,
      required this.necessaryField})
      : super(key: key);

  final double width;
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final TextInputType type;
  final bool necessaryField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  FieldName,
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                SizedBox(width: 5),
                necessaryField
                    ? Text('*',
                        style: TextStyle(fontSize: 15, color: Colors.red))
                    : SizedBox()
              ],
            ),
            TextField(
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
              autofocus: false,
              style: TextStyle(fontSize: 15, color: Colors.black),
              cursorColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
