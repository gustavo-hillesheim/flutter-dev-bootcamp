import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);

  static Future<Location> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      return Location(position.latitude, position.longitude);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  String toString() {
    return 'Location(latitude=$latitude, longitude=$longitude)';
  }
}