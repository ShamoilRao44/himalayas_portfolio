import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    LatLng myLatLng = LatLng(22.695518, 75.856222);
    String address = '802, Aashyan Apt., Saifee Nager';
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: myLatLng,
            zoom: 16,
          ),
          markers: {
            Marker(
              markerId: MarkerId('1'),
              infoWindow: InfoWindow(title: address),
              position: myLatLng,
            ),
          }),
    );
  }
}
