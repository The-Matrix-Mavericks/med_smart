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
        title: "Post Traumatic Stress Disorder",
        subtitle:
            "Learn ways to fight PTSD by developing new hobbies with Med Smart",
        caption: "Know more",
        color: const Color(0xFF7850F0),
        image: app_assets.topic_1),
    CourseModel(
        title: "Stress in today's world",
        subtitle:
            "Learn ways to handel and chanalize the stress to get a better lifestyle with Med Smart",
        caption: "Know more",
        color: const Color(0xFF6792FF),
        image: app_assets.topic_2),
    CourseModel(
        title: "Depression \nv/s You",
        subtitle:
            "Learn ways to overcome depression by keeping the track of you daily life with Med Smart",
        caption: "Know more",
        color: const Color(0xFF005FE7),
        image: app_assets.topic_1),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
        title: "AI Diagnose",
        caption: "within 10 mins",
        color: const Color(0xFF9CC5FF),
        image: app_assets.topic_2),
    CourseModel(
        title: "Self Assess",
        caption: "for stress test",
        color: const Color(0xFF6E6AE8),
        image: app_assets.topic_1),
    CourseModel(
        title: "MedAI is here",
        caption: "for assistance",
        color: const Color(0xFFBBA6FF),
        image: app_assets.topic_1),
    CourseModel(
        title: "Day Planner",
        caption: "to be productive",
        color: const Color(0xFF005FE7),
        image: app_assets.topic_2),
    CourseModel(
        title: "Day Tracker",
        caption: "with Med Smart",
        color: const Color.fromARGB(255, 255, 114, 114)!,
        image: app_assets.topic_1),
    CourseModel(
        title: "Helplines",
        caption: "for Govt. & NGO's",
        color: Colors.teal[200]!,
        image: app_assets.topic_1),
  ];
}
