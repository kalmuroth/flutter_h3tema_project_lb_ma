import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocode/geocode.dart';

class MapPage extends StatefulWidget {
  const MapPage(capital, {Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;
  String _countryName = "France"; // Nom du pays en anglais

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _updateMap();
  }

  void _updateMap() async {
    try {
      GeoCode geoCode = GeoCode();
      Coordinates location =
          await geoCode.forwardGeocoding(address: _countryName);
      print("Latitude: ${location!.latitude}");
      print("Longitude: ${location!.longitude}");
      _addMarker(LatLng(location.latitude!, location.longitude!));
    } catch (e) {
      print(e);
    }
  }

  void _addMarker(LatLng latLng) {
    Marker marker = Marker(
      markerId: MarkerId(_countryName),
      position: latLng,
      infoWindow: InfoWindow(title: _countryName),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 0.0,
        ),
      ),
    );
  }
}
