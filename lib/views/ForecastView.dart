import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/views/CurrentWeather.dart';

class ForecastView extends StatelessWidget {
  final APIResponse? response;

  ForecastView({required this.response});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (response == null)
        ? Center(
            child: const Text("NO DATA"),
          )
        : Column(
            children: [CurrentWeather(forecast: response!.list.first)],
          );
  }
}
