import 'package:flutter/material.dart';

class CustomTextFieldWithFieldName extends StatelessWidget {
  CustomTextFieldWithFieldName(
      {super.key, required this.textField, required this.fieldName});
  final TextField textField;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0, bottom: 5),
          child: Text(
            fieldName,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey[300]!,
            ),
          ),
          child: textField,
        ),
      ],
    );
  }
}
