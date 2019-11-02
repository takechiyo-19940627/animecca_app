import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'src/models/location_pin.dart';
import 'src/google_location.dart' as locations;
import 'package:location/location.dart';

class MainMap extends StatefulWidget {
  _MainMap createState() => _MainMap();
}

class _MainMap extends State<MainMap> {
  LocationData currentLocation;

  Location _locationService = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();
    _locationService.onLocationChanged().listen((LocationData result) async {
      setState(() {
        currentLocation = result;
      });
    });
  }

  void initPlatformState() async {
    LocationData myLocation;
    try {
      myLocation = await _locationService.getLocation();
      error = "";
    } on PlatformException catch(e){
      if(e.code == 'PERMISSION_DENITED')
        error = 'Permission denited';
      else if(e.code == 'PERMISSION_DENITED_NEVER_ASK')
        error = 'Permission denited - please ask the user to enable it from the app settings';
      myLocation = null;
    }
    setState(() {
      currentLocation = myLocation;
    });
  }

  final Map<String, Marker> _markes = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markes.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markes[office.name] = marker;
      }
    });
  }

  buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Form(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: '聖地を探す',
            icon: Icon(Icons.search, color: Colors.black),
          ),
//TODO:検索機能実装時に下記もいじっていく
//          onFieldSubmitted: submit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: buildSearchField(),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 17.0,
          ),
          myLocationEnabled: true,
          markers: _markes.values.toSet(),
          minMaxZoomPreference: MinMaxZoomPreference(16, 18),
        ),
      );
    }
  }
}
