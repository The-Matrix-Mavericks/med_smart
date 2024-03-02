import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/user_health_metrics/inputpage/weight/weight_slider.dart';
import 'package:flutter_samples/screens/user_health_metrics/widget/card_title.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_samples/screens/user_health_metrics/utils/widget_utils.dart' show screenAwareSize;

class AgeCard extends StatefulWidget {
  final int? initialAge;
  final ValueChanged<int>? onChanged;

  const AgeCard({Key? key, this.initialAge, this.onChanged}) : super(key: key);

  @override
  _AgeCardState createState() {
    return _AgeCardState();
  }
}

class _AgeCardState extends State<AgeCard> {
  late int age;

  @override
  void initState() {
    age = widget.initialAge ?? 25;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CardTitle(
                "Age",
                subTitle: " (year)",
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenAwareSize(4.0, context),
                  bottom: 20,
                ),
                child: _drawWeightSlider(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawWeightSlider(BuildContext context) {
    return WeightBackground(
      child: LayoutBuilder(builder: (context, constraints) {
        return constraints.isTight
            ? Container()
            : WeightSlider(
                minValue: 12,
                maxValue: 100,
                value: age,
                onChanged: _onChanged,
                width: constraints.maxWidth,
              );
      }),
    );
  }

  _onChanged(int val) {
    age = val;
    widget.onChanged!(val);
  }
}

class WeightBackground extends StatelessWidget {
  final Widget? child;

  const WeightBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            // color: const Color(0xFF00154F),
            color: const Color(0xFF00154F),
            borderRadius: BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        )
      ],
    );
  }
}
