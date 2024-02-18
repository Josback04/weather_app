import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/model/GeoPosition.dart';
import 'package:weather_app/services/ApiService.dart';
import 'package:weather_app/services/DataServices.dart';
import 'package:weather_app/services/LocationService.dart';
import 'package:weather_app/views/widgets/AddCity.dart';
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
  GeoPosition? positionToCall;
  List<String> cities = [];
  APIResponse? apiResponse;
  @override
  void initState() {
    getUserLocation();
    updateCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          positionToCall?.city ?? "Ma Méteo",
        ),
      ),
      drawer: MyDrawerView(
        myPosition: userPosition,
        cities: cities,
        onTap: onTap,
        onDelete: removeCity,
      ),
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

  // obtenir position via GPS
  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
        positionToCall = loc;
      });
      callApi();
    }
  }

// call API

  callApi() async {
    if (positionToCall == null) return;
    apiResponse = await ApiService().callApi(positionToCall!);
    setState(() {});
  }

// Nouvelle ville
  onTap(String string) async {
    Navigator.of(context).pop();
    removeKeyboard();
    if (string == userPosition?.city) {
      positionToCall = userPosition;
      callApi();
    } else {
      positionToCall = await LocationService().getCoordFromCity(string);
      callApi();
    }
  }

//remove keyboard

  removeKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

//
  onAddCity(String string) async {
    DataServices().addCity(string).then((onSuccess) => updateCities());
    removeKeyboard();
  }

  //supprimer
  removeCity(String string) async {
    DataServices().removeCity(string).then((onSucess) => updateCities());
  }

  //Mettre à jour les villes
  updateCities() async {
    cities = await DataServices().getCities();
    setState(() {});
  }
}
