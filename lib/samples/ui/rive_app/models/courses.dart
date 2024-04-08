import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;

class CourseModel {
  CourseModel(
      {this.id,
      this.title = "",
      this.subtitle = "",
      this.caption = "",
      this.color = Colors.white,
      this.image = ""});

  UniqueKey? id = UniqueKey();
  String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
        title: "Beat Exam Stress",
        subtitle:
            "Top Tips from the Makers of the Viral Student Focusing App...",
        caption: "Know more",
        color: const Color(0xFF7850F0),
        image: app_assets.topic_1),
    CourseModel(
        title: "Exam Season Survival Guide",
        subtitle: "Must-Have tools for Staying Focused and Acing Tests...",
        caption: "Know more",
        color: const Color(0xFF6792FF),
        image: app_assets.topic_2),
    CourseModel(
        title: "Brain Hacks",
        subtitle:
            "Supercharge your concentration and focus using mind tricks... ",
        caption: "Know more",
        color: const Color(0xFF005FE7),
        image: app_assets.topic_3),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
        title: "Smart Lifestyle",
        caption: "with yoga, excercise, sleep & meal planning",
        color: const Color(0xFF9CC5FF),
        image: app_assets.utility_1),
    CourseModel(
        title: "Mood Tracker",
        caption: "to track and record daily mood",
        color: const Color(0xFF6E6AE8),
        image: app_assets.utility_2),
    // CourseModel(
    //     title: "MedAI is here",
    //     caption: "for assistance",
    //     color: const Color(0xFFBBA6FF),
    //     image: app_assets.topic_1),
    CourseModel(
        title: "Day Planner",
        caption: "to be productive by planning each task",
        // color: const Color(0xFF005FE7),
        color: const Color(0xFFBBA6FF),
        image: app_assets.utility_3),
    // CourseModel(
    //     title: "Day Tracker",
    //     caption: "with Med Smart",
    //     color: const Color.fromARGB(255, 255, 114, 114)!,
    //     image: app_assets.topic_1),
    // CourseModel(
    //     title: "Helplines",
    //     caption: "for Govt. & NGO's",
    //     color: Colors.teal[200]!,
    //     image: app_assets.topic_1),
  ];
}
