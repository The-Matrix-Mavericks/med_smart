import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_colors.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/device_utils.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    return Container(
      color: AppColors.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Feedback",
                style: TextStyle(
                    fontSize: 24, fontFamily: 'Poppins', color: primaryColor)),
            backgroundColor: AppColors.nearlyWhite,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back()),
          ),
          backgroundColor: AppColors.nearlyWhite,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Image.asset('assets/images/feedbackImage.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Your FeedBack',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Help us so that we can provide you better',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  _buildComposerIsu(),
                  _buildComposerCategory(),
                  _buildComposer(),
                  SizedBox(
                    height: 16,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16),
                  //   child: Center(
                  //     child: Container(
                  //       width: DeviceUtils.getScaledWidth(context, 0.85),
                  //       height: DeviceUtils.getScaledHeight(context, 0.05),
                  //       decoration: BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10.0)),
                  //         boxShadow: <BoxShadow>[
                  //           BoxShadow(
                  //               color: Colors.grey.withOpacity(0.6),
                  //               offset: const Offset(4, 4),
                  //               blurRadius: 8.0),
                  //         ],
                  //       ),
                  //       child: Material(
                  //         color: Colors.transparent,
                  //         child: InkWell(
                  //           onTap: () {
                  //             FocusScope.of(context).requestFocus(FocusNode());
                  //           },
                  //           child: Center(
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(4.0),
                  //               child: Text(
                  //                 'Send',
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Colors.white,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Get.back();
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
                    "Send",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposerIsu() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 40, maxHeight: 160),
            color: AppColors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {
                  // TODO: implement
                },
                style: TextStyle(
                  fontFamily: AppColors.fontName,
                  fontSize: 16,
                  color: AppColors.dark_grey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Subject'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposerCategory() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 40, maxHeight: 160),
            color: AppColors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: DropdownButtonFormField<String>(
                onChanged: (String? selectedValue) {
                  // TODO: implement
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'Report an Issue',
                    child: Text('Report an Issue'),
                  ),
                  DropdownMenuItem(
                    value: 'Suggestions',
                    child: Text('Suggestions'),
                  ),
                  DropdownMenuItem(
                    value: 'Improvements',
                    child: Text('Improvements'),
                  ),
                ],
                hint: Text('Select category'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: AppColors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: 4,
                onChanged: (String txt) {
                  // TODO: implement
                },
                style: TextStyle(
                  fontFamily: AppColors.fontName,
                  fontSize: 16,
                  color: AppColors.dark_grey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
