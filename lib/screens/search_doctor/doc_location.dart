import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/constants/constants.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorLocation extends StatefulWidget {
  DoctorLocation({
    required this.name,
    required this.latLng,
    super.key,
  });
  String name;
  LatLng latLng;

  @override
  State<DoctorLocation> createState() => _DoctorMapState();
}

class _DoctorMapState extends State<DoctorLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
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
              initialCenter: widget.latLng,
              // initialCenter: LatLng(51.509364, -0.128928),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  buildMarker(widget.latLng, widget.name), // Ratibad
                  // Indrapuri
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
        width: 120,
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
