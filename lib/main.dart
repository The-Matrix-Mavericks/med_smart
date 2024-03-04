import 'package:flutter/material.dart';
import 'package:flutter_samples/models/samples.dart';
import 'package:flutter_samples/samples/animations/animation_samples_list.dart';
import 'package:flutter_samples/samples/animations/custom_caret/custom_caret.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/onboarding_view.dart';
import 'package:flutter_samples/screens/intro_screens/intro_view.dart';
import 'package:flutter_samples/screens/samples_list_view.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/animations/grid_magnification/grid_magnification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_samples/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Med Smart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RiveAppHome.route: (context) => const RiveAppHome(),
        AnimationSamplesList.route: (context) => const AnimationSamplesList(),
        GridMagnification.route: (context) => const GridMagnification(),
        CustomCaret.route: (context) => const CustomCaret(),
      },
      // home: SamplesListView(
      //   title: "Flutter Samples",
      //   backEnabled: false,
      //   listData: SampleData.sampleTypes,
      // ),
      home: SplashScreen(),
    );
  }
}
