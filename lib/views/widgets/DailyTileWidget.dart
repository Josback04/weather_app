import 'package:flutter/material.dart';
import 'package:weather_app/model/GroupWeather.dart';
import 'package:weather_app/services/Data_converter.dart';

class DailyTileWidget extends StatelessWidget {
  GroupWeather day;
  DailyTileWidget({required this.day});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Theme.of(context).primaryColorDark.withOpacity(0.8),
      elevation: 7,
      child: ListTile(
        trailing: Image.network(
          DataConverter().fromIcon(day.icon),
        ),
        leading: Text(day.day),
        title: Text(day.description),
        subtitle: Text(day.minAndMax()),
      ),
    );
  }
}
