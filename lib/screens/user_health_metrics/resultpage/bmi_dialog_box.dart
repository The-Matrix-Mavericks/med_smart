import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/gender/gender.dart';
import 'package:flutter_samples/screens/user_health_metrics/resultpage/result_page.dart';

Widget BMIDialogBox(
    BuildContext context, int height, int weight, Gender gender) {
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  return AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
}
