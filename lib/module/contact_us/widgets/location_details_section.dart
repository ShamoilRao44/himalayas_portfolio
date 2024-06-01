// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_portfolio/utils/widgets/app_text.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LatLng myLatLng = LatLng(21,27);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      text: 'Opening Hours: ',
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: '9 AM - 9 PM',
                      size: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    AppText(
                      text: 'Phone: ',
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: '(123) 456-7890',
                      size: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    AppText(
                      text: 'Email: ',
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: 'info@frozenfood.com',
                      size: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                AppText(
                  text: 'Address: ',
                  size: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16),
                AppText(
                  text: '123 Frozen Food St, Cold City',
                  size: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 480,
              color: Colors.grey[300], // Placeholder for the map
              // child: GoogleMap(
              //   initialCameraPosition: CameraPosition(
              //     target: myLatLng,
              //     zoom: 16,
              //   ),
              //   markers: {
              //     Marker(
              //       markerId: MarkerId('1'),
              //       position: myLatLng,
              //     ),
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
