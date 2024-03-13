import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/controllers/setting_controller.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/custom_text_field.dart';
import 'package:get/get.dart';

class UserProfileEditPage extends StatefulWidget {
  const UserProfileEditPage({super.key});

  @override
  State<UserProfileEditPage> createState() => _UserProfileEditPageState();
}

class _UserProfileEditPageState extends State<UserProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
          ),
          SizedBox(
            height: 8,
          ),
          // CustomTextFieldWithFieldName(
          //   textField: TextField(
          //     controller: controller.userName,
          //     // onChanged: (value) {
          //     //   _password = value;
          //     // },
          //     style: const TextStyle(
          //       fontSize: 17,
          //     ),
          //     decoration: kTextInputDecoration.copyWith(
          //       hintText: 'Enter your password',
          //       hintStyle: TextStyle(
          //           color: Colors.grey[500],
          //           fontWeight: FontWeight.w400,
          //           fontSize: 16),
          //       icon: Icon(
          //         Icons.key,
          //         size: 20.0,
          //         color: Colors.grey[600],
          //       ),
          //     ),
          //   ),
          //   fieldName: 'Password',
          // ),
        ],
      ),
    );
  }
}
