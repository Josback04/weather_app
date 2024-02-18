import 'package:flutter/material.dart';
import 'package:weather_app/model/GeoPosition.dart';

class MyDrawerView extends StatelessWidget {
  GeoPosition? myPosition;
  List<String> cities;
  Function(String) onTap;
  Function(String) onDelete;
  MyDrawerView(
      {required this.myPosition,
      required this.cities,
      required this.onTap,
      required this.onDelete});
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
              return tappable(myPosition!.city, false);
            if (myPosition == null) return tappable(cities[index - 1], true);
            return tappable(cities[index - 2], true);
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

  ListTile tappable(String string, bool canDelete) {
    return ListTile(
        title: Text(string),
        onTap: (() => onTap(string)),
        trailing: (canDelete)
            ? IconButton(
                onPressed: () => (canDelete) ? onDelete(string) : null,
                icon: const Icon(Icons.delete_forever_outlined),
              )
            : null);
  }
}
