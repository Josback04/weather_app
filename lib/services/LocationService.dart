// import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:weather_app/model/GeoPosition.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationService {
//get position
  Future<LocationData?> getPosition() async {
    try {
      Location location = Location();
      return location.getLocation();
    } on PlatformException catch (error) {
      print("erreur lors de la récupération:${error.message}");
      return null;
    }
  }

//position to ville
  Future<GeoPosition?> getCity() async {
    final position = await getPosition();
    if (position == null) return null;
    final lat = position.latitude ?? 0.0;
    final long = position.longitude ?? 0.0;

    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(lat, long);
    print(placemarks);
    final firstChoice = placemarks.first;
    final geoPosition =
        GeoPosition(city: firstChoice.locality ?? "", lat: lat, long: long);
    return geoPosition;
  }

// ville to position

  Future<GeoPosition?> getCoordFromCity(String city) async {
    final placemarks = await geocoding.locationFromAddress(city);
    if (placemarks.isEmpty) return null;
    final bestChoice = placemarks.first;
    return GeoPosition(
        city: city, lat: bestChoice.latitude, long: bestChoice.longitude);
  }
}
