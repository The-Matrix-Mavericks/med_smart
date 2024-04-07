import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

class HomeTopCard extends StatelessWidget {
  // final AnimationController? animationController;
  // final Animation<double>? animation;

  // const HomeTopCard({Key? key, this.animationController, this.animation})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.nearlyDarkBlue, HexColor("#6F56E8")],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.grey.withOpacity(0.6),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Lottie.asset('assets/hi.json',height: 30),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      DocumentSnapshot userData = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Hi ${userData["userName"]}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.0,
                            color: AppColors.white,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print(Error); //just for checking
                    }
                    return Text('.......'); // loading progress indicate
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text(
                  'Do you have any health complaints?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    color: AppColors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: const Text(
                  'Book Appointment with top doctors \nin 20 seconds...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.0,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 08,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.newspaper,
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        'EXPLORE MORE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppColors.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.nearlyWhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppColors.nearlyBlack.withOpacity(0.4),
                              offset: Offset(8.0, 8.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.read_more,
                            color: HexColor("#6F56E8"),
                            size: 44,
                          ),
                        ),
                        onTap: () {
                          // Navigator.pushNamed(context, Routes.news);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
