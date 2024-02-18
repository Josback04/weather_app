import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/model/GeoPosition.dart';
import 'package:weather_app/services/ApiService.dart';
import 'package:weather_app/services/LocationService.dart';
import 'package:weather_app/views/AddCity.dart';
import 'package:weather_app/views/ForecastView.dart';
import 'package:weather_app/views/MyDrawer.dart';
import 'package:weather_app/views/NoData.dart';

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
      drawer: MyDrawerView(myPosition: userPosition, cities: [], onTap: onTap),
      body: Column(
        children: [
          AddCityView(onAddCity: onAddCity),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: (apiResponse == null)
                  ? NoData()
                  : ForecastView(response: apiResponse!))
        ],
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

  onTap(String string) {
    Navigator.of(context).pop();
  }

  onAddCity(String string) {}
}
