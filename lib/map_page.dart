import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  final String countryName;

  MapPage({required this.countryName});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;
  String _countryName = "";
  String _country = "";
  String _languages = "";
  int _population = 0;
  int _superficie = 0;
  late String _alpha2Code;
  String _capital = "";
  late double _latitude;
  late double _longitude;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _updateMap();
  }

  @override
  void initState() {
    super.initState();
    _countryName = widget.countryName;
    _fetchCountryData();
  }

  void _fetchCountryData() async {
    try {
      var url =
          Uri.parse('https://restcountries.com/v3.1/capital/$_countryName');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)[0];
        var latlng = data['capitalInfo']['latlng'];
        _country = data['name']['common'];
        _alpha2Code = data['cca2'];
        _capital = data['capital'][0];
        _latitude = latlng[0];
        _longitude = latlng[1];
        _population = data['population'];
        _languages = data['languages'].values.toList().join(', ');
        _superficie = data['area'];
        print('Languages: $_languages');
        print('-------');
        print('$_country et $_countryName');
        print('-------');

        _updateMap();
      } else {
        throw Exception('Failed to load country data');
      }
    } catch (e) {
      print(e);
    }
  }

  void _updateMap() async {
    try {
      _addMarker(LatLng(_latitude, _longitude));
      _controller
          .animateCamera(CameraUpdate.newLatLng(LatLng(_latitude, _longitude)));
      for (double zoom = 1.0; zoom <= 10.0; zoom += 0.5) {
        await Future.delayed(Duration(milliseconds: 100));
        _controller.animateCamera(CameraUpdate.zoomTo(zoom));
      }
    } catch (e) {
      print(e);
    }
  }

  void _addMarker(LatLng latLng) {
    Marker marker = Marker(
      markerId: MarkerId(_alpha2Code),
      position: latLng,
      infoWindow: InfoWindow(title: _countryName, snippet: _capital),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_capital)),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 0.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '$_country ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Capital: $_capital \nPopulation: $_population habitants\nLanguages: $_languages \nSuperficie: $_superficie km²',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
