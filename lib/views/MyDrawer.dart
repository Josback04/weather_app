import 'package:flutter/material.dart';
import 'package:weather_app/model/GeoPosition.dart';

class MyDrawerView extends StatelessWidget {
  GeoPosition? myPosition;
  List<String> cities;
  Function(String) onTap;
  MyDrawerView(
      {required this.myPosition, required this.cities, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final itemCount =
        (myPosition == null) ? cities.length + 1 : cities.length + 2;
    return Drawer(
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) return header(context);
            if (index == 1 && myPosition != null)
              return tappable(myPosition!.city);
            if (myPosition == null) return tappable(cities[index - 1]);
            return tappable(cities[index + 2]);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: itemCount),
    );
  }

  DrawerHeader header(BuildContext context) {
    return DrawerHeader(
        child: Column(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 25,
          color: Theme.of(context).primaryColor,
        ),
        const Text('Mes villes'),
      ],
    ));
  }

  ListTile tappable(String string) {
    return ListTile(
      title: Text(string),
      onTap: (() => onTap(string)),
    );
  }
}
