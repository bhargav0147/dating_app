// ignore_for_file: file_names

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Map<String, String>> getLocationDetails() async {
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception("Location permission denied");
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    List<Placemark> placeList =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placeList.isNotEmpty) {
      Placemark place = placeList.first;
      print(place);
      return {
        "latitude": position.latitude.toString(),
        "longitude": position.longitude.toString(),
        "city": place.locality ?? "Unknown",
        "state": place.administrativeArea ?? "Unknown",
        "country": place.country ?? "Unknown",
      };
    } else {
      throw Exception("Unable to fetch address details");
    }
  } catch (e) {
    return {
      "latitude": "0.0",
      "longitude": "0.0",
      "city": "Unknown",
      "state": "Unknown",
      "country": "Unknown",
      "error": e.toString(),
    };
  }
}
