import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/model/GroupWeather.dart';
import 'package:weather_app/services/Data_converter.dart';
import 'package:weather_app/views/widgets/CurrentWeatherWidget.dart';
import 'package:weather_app/views/widgets/DailyTileWidget.dart';

class ForecastView extends StatelessWidget {
  final APIResponse response;

  ForecastView({required this.response});
  @override
  Widget build(BuildContext context) {
    List<GroupWeather> byDay = DataConverter().groupByDay(response);
    // TODO: implement build
    return Column(
      children: [
        CurrentWeather(forecast: response!.list.first),
        Expanded(
            child: ListView.builder(
                itemBuilder: ((context, index) =>
                    DailyTileWidget(day: byDay[index])),
                itemCount: byDay.length)),
      ],
    );
  }
}
