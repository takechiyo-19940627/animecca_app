

class LocationPin {

  LocationPin(
      {this.latitude,
        this.longitude});

  final int latitude;
  final int longitude;

  factory LocationPin.fromJson(Map value) {
    return LocationPin(
      latitude: value['latitude'],
      longitude: value['longitude'],
    );
  }
}