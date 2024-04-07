import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_colors.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;

  const TitleView({
    Key? key,
    this.titleTxt = "",
    this.subTxt = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: AppColors.lightText,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        // letterSpacing: 0.5,
                        color: AppColors.black800,
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.darkText,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
