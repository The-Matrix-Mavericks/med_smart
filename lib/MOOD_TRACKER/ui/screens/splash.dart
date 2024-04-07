// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mood_tracker/core/services/hive.dart';
// import 'package:mood_tracker/core/utils/assets.dart';
// import 'package:mood_tracker/core/utils/routes.dart';
// import 'package:mood_tracker/ui/screens/introduction.dart';
// import 'package:mood_tracker/ui/widgets/app_text.dart';
// import 'package:mood_tracker/ui/widgets/default_container.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     scheduleMicrotask(() async {
//       await Future.delayed(const Duration(milliseconds: 3200));
//       await AppNavigator.replaceWith(HiveService.getSettings().skipIntroduction
//           ? Routes.main
//           : Routes.introduction);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       body: DefaultContainer(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset(AppAssets.animatedHi),

//             // Lottie.asset(AppAssets.anitmatedEmoji), // -------> Emoji that can be used as loading
//             const AppText(
//               text: 'ヾ(＾∇＾)',
//               weight: FontWeight.bold,
//               size: 28,
//             ),
//             GestureDetector(
//               child: const AppText(
//                 text: 'NiHao 你好',
//                 weight: FontWeight.bold,
//                 size: 28,
//               ),
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => IntroductionScreen())),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
