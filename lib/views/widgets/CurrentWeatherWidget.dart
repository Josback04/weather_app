import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';
import 'package:weather_app/services/Data_converter.dart';

class CurrentWeather extends StatelessWidget {
  Forecast forecast;
  CurrentWeather({required this.forecast});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 3,
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 7,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //image,
                  Image.network(
                      DataConverter().fromIcon(forecast.weather.first.icon)),
                  Text(
                    "${forecast.main.temp.toInt()}° C",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "${forecast.weather.first.description}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Min : ${forecast.main.temp_min.toInt()} dégrés Celsius --  Max: ${forecast.main.temp_max.toInt()}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
