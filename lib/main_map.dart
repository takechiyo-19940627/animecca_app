import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'src/models/location_pin.dart';

class MainMap extends StatefulWidget {
  _MainMap createState() => _MainMap();
}

class _MainMap extends State<MainMap> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Form(
        child: TextFormField(
          decoration: InputDecoration(
              labelText: '聖地を探す',
              icon: Icon(
                  Icons.search,
                  color: Colors.black),),
//TODO:検索機能実装時に下記もいじっていく
//          onFieldSubmitted: submit,
        ),
      ),
    );
  }

  //TODO:検索機能実装時に下記もいじっていく
//  void submit(String searchValue) async {
//
//  }


  Future<void> _refresh() async {
    await Future.sync(() {
      _getLocationPins();
    });

    return;
  }
  
  _getLocationPins() async {
    print("Starting getMapPins");
    var url = 'http://localhost:3000/api/v1/';

    http.get(url).then((response) {
      var body = response.body;
      var locationPin = jsonDecode(body);
      setState(() {
        LocationPin.fromJson(locationPin);
      });
    });
  }

  //  TODO:下記はユーザの現在地を取得した値をいれるように修正する
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildSearchField(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }

}