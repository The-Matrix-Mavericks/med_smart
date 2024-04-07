
// import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/FITNESS_APP/common/colo_extension.dart';

class BlankView extends StatefulWidget {
  const BlankView({super.key});

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
    );
  }
}