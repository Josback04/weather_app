import 'package:shared_preferences/shared_preferences.dart';

class DataServices {
  final key = "cities";

  //obtenir
  Future<List<String>> getCities() async {
    final preferences = await SharedPreferences.getInstance();
    final list = preferences.getStringList(key);
    return list ?? [];
  }

  //ajouter
  Future<bool> addCity(String string) async {
    final prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(key) ?? [];
    list.add(string);
    return prefs.setStringList(key, list);
  }

  //supprimer
  Future<bool> removeCity(String string) async {
    final prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(key) ?? [];
    list.remove(string);
    return prefs.setStringList(key, list);
  }
}
