import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/courses.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HCard extends StatelessWidget {
  const HCard({
    Key? key,
    required this.section,
    required this.nextScreen,
  }) : super(key: key);

  final CourseModel section;
  final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 8,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 110),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: section.color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    section.caption,
                    style: const TextStyle(
                        fontSize: 16, fontFamily: "Inter", color: Colors.white),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: VerticalDivider(thickness: 0.8, width: 0),
            ),
            Image.asset(
              section.image,
              width: 50,
            )
          ],
        ),
      ).onTap(() => Get.to(() => nextScreen)),
    );
  }
}
