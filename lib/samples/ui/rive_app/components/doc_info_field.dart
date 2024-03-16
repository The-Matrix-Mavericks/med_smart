import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class DocInfoBox extends StatelessWidget {
  String infoLabel;
  String infoText;
  Icon icon;
  DocInfoBox(
      {super.key,
      required this.infoLabel,
      required this.infoText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: Colors.grey[100],
          ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 0, top: 5),
            child: Row(
              children: [
                icon,
                5.widthBox,
                Text(
                  infoLabel,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      fontFamily: 'Inter'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 0),
            child: Text(
              infoText,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: 'Poppins'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
          )
          // Text(infoText),
        ],
      ),
    );
  }
}
