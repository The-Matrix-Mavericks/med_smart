import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorMap extends StatefulWidget {
  const DoctorMap({super.key});

  @override
  State<DoctorMap> createState() => _DoctorMapState();
}

class _DoctorMapState extends State<DoctorMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Doctors',
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
              initialZoom: 11,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  buildMarker(
                      LatLng(23.1661, 77.3281), " Dr. Yogesh "), // Ratibad
                  buildMarker(
                      LatLng(23.1925, 77.3468), " Dr. Arpit "), // Neelbad
                  buildMarker(LatLng(23.2567, 77.4343),
                      " Dr. Lalit "), // Ashkoda Garden
                  buildMarker(
                      LatLng(23.2332, 77.4343), " Dr. Lucky "), // MP Nagar
                  buildMarker(
                      LatLng(23.2523, 77.4623), " Dr. Anushka "), // Indrapuri
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
        width: 100,
        height: 20,
        child: buildTextWidget(word));
  }

  Container buildTextWidget(String word) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            Icons.location_on,
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
