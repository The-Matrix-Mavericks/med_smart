import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_styles.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        child:  AppStyles.normal(
                      title: buttonText, size: AppSizes.size16),
      ),
    );
  }
}