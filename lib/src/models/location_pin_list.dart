import 'package:animecca_app/src/models/location_pin.dart';

class LocationPinList {
  LocationPinList(
      this.location_pins
      );

  final List<LocationPin> location_pins;

  LocationPinList.fromJson(Map<String, dynamic> json)
      :
      location_pins = new List<LocationPin>.from(
          json['location_pins'].map((location_pin) => LocationPin.fromJson(location_pin))
      );
}