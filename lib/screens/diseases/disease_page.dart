import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/disease_model.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/constants.dart';

class DiseasePage extends StatefulWidget {
  final int i;
  const DiseasePage({super.key, required this.i});

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(diseases[widget.i].name,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  color: kTextColor,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Get.back()),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            // decoration: BoxDecoration(
            //   color: Colors.blue[50],
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    diseases[widget.i].image,
                    height: 150,
                  ),
                ),
                10.widthBox,
                Text(
                  'Symptoms',
                  style: textStyle1.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: diseases[1].symptoms.length,
                      itemBuilder: (context, index) {
                        return Text(diseases[index].symptoms[index]);
                      }),
                ),
                5.heightBox,
              ],
            )));
  }
}
