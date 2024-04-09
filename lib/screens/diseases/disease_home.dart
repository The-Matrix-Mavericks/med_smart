import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:flutter_samples/screens/diseases/disease_page.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../samples/ui/rive_app/models/disease_model.dart';

class DiseaseHomePage extends StatefulWidget {
  const DiseaseHomePage({super.key});

  @override
  State<DiseaseHomePage> createState() => _DiseaseHomePageState();
}

class _DiseaseHomePageState extends State<DiseaseHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Diseases',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: kTextColor,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(
                      diseases[index].image,
                      height: 80,
                    ),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          diseases[index].name,
                          style: textStyle3.copyWith(color: Colors.black),
                        ),
                        5.heightBox,
                        Text(
                          'Tap to Know more ',
                        ),
                        Text(
                          diseases.length.toString(),
                        ),
                      ],
                    )
                  ],
                ).onTap(() {
                  Get.to(() => DiseasePage(
                        i: index,
                      ));
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
