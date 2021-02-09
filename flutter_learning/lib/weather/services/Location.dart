import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  // Location(this.latitude, this.longitude);

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(
          "getCurrentLocation method exception location.dart at 15 line number $e");
      print(this.permission());
      // ignore: unrelated_type_equality_checks
      if (this.permission() == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();
      } else {
        print("other");
      }
    }
  }

  Future<void> permission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
  }

  Future<void> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }
}
