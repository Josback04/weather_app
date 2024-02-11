import 'dart:convert';

import 'package:weather_app/model/GeoPosition.dart';

import 'package:http/http.dart';
import 'package:weather_app/services/ApiKeyService.dart';

class ApiService {
  String baseUrl = "http://api.openweathermap.org/data/2.5/forecast";
  String lat = "lat=";
  String long = "lon=";
  String appid = "aappid=";
  String lang = "lang=fr";
  String units = "units=metric";

  String prepareQuery(GeoPosition geoPosition) {
    final geoLat = geoPosition.lat;
    final geoLong = geoPosition.long;
    return "$baseUrl&$lat$geoLat&$long$geoLong&$units$lang&$appid$apiKey";
  }

  Future<Null> callApi(GeoPosition position) async {
    final queryString = prepareQuery(position);
    final uri = Uri.parse(queryString);
    final call = await get(uri);

    Map<String, dynamic> map = json.decode(call.body);
    print(map);
  }
}
