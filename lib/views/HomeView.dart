import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/model/GeoPosition.dart';
import 'package:weather_app/services/ApiService.dart';
import 'package:weather_app/services/LocationService.dart';
import 'package:weather_app/views/ForecastView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GeoPosition? userPosition;
  APIResponse? apiResponse;
  Forecast? forecast;
  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userPosition?.city ?? "Ma Méteo",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Text("notre reponse: ${apiResponse?.cnt ?? 0} "),
            // Text("notre forecast: ${forecast?.visibility}")
            ForecastView(response: apiResponse),
          ],
        ),
      ),
    );
  }

  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
      });
      apiResponse = await ApiService().callApi(userPosition!);
      setState(() {});
    }
  }
}
