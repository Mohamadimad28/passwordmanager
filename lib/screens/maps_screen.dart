import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen();

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController googleMapController;
  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        onTap: (LatLng point) {
          marker.add(Marker(
              position: point,
              markerId: (MarkerId('location${point.latitude}'))));
          setState((){});
        },
        onMapCreated: (x) {
          googleMapController = x;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(31.5, 34.46667),
          zoom: 11.0,
        ),
      ),
    );
  }
}
