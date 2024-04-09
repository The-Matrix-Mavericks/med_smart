import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
// import 'package:velocity_x/velocity_x.dart';

class MedicalStoresNearMe extends StatefulWidget {
  const MedicalStoresNearMe({super.key});

  @override
  State<MedicalStoresNearMe> createState() => _DoctorMapState();
}

class _DoctorMapState extends State<MedicalStoresNearMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Medical Stores',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: kTextColor,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(23.259933, 77.412613),
              // initialCenter: LatLng(51.509364, -0.128928),
              initialZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  buildMarker(LatLng(23.1661, 77.3281),
                      " Mahavir Medical Store "), // Ratibad
                  buildMarker(LatLng(23.1925, 77.3468),
                      " Siddhant Medical Store "), // Neelbad

                  buildMarker(LatLng(23.2332, 77.4343),
                      " Shiv Kripa Medical Store "), // MP Nagar
                  buildMarker(LatLng(23.1023, 77.4623),
                      " Vishal Medical Store "), // Indrapuri
                  buildMarker(LatLng(23.2523, 77.4623),
                      "Jeevan Jyoti Medical Store"), // Indrapuri
                  buildMarker(LatLng(23.2563, 77.4043),
                      "H.C. Medical Store"), // Indrapuri
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Marker buildMarker(LatLng coordinates, String word) {
    return Marker(
        point: coordinates,
        width: 180,
        height: 20,
        child: buildTextWidget(word));
  }

  Container buildTextWidget(String word) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            Icons.store,
            color: Colors.red,
          ),
          // 5.widthBox,
          Text(
            word,
            textAlign: TextAlign.center,
            style: getDefaultTextStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle getDefaultTextStyle() {
    return const TextStyle(
      fontSize: 12,
      backgroundColor: primaryColor,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
