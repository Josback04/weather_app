import 'package:flutter/material.dart';
import 'package:weather_app/model/ApiResponse.dart';

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
                  Text("${forecast.main.temp.toInt()} dégré Celsius"),
                ],
              ),
              const Spacer(),
              Text("${forecast.weather.first.description}"),
              Text(
                  "Min : ${forecast.main.temp_min.toInt()} dégré Celsius --  Max: ${forecast.main.temp_max.toInt()}"),
            ],
          ),
        ),
      ),
    );
  }
}
