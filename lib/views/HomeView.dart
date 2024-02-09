import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/model/GeoPosition.dart';
import 'package:weather_app/services/ApiService.dart';
import 'package:weather_app/services/LocationService.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GeoPosition? userPosition;
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
        child: Text(
            "Ma position est: ${userPosition?.lat} \n ${userPosition?.long}"),
      ),
    );
  }

  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
        ApiService().callApi(userPosition!);
      });
    }
  }
}
