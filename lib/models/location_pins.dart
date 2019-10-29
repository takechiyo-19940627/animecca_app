class LocationPin {
  final int latitude;
  final int longitude;

  LocationPin({this.latitude, this.longitude});

  factory LocationPin.fromJson(Map<int, dynamic> json) {
    return LocationPin(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}