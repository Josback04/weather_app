import 'package:weather_app/services/Data_converter.dart';

class APIResponse {
  String cod;
  int message;
  int cnt;
  List<Forecast> list;

  APIResponse(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list});

  APIResponse.fromJson(Map<String, dynamic> map)
      : cod = map["cod"],
        message = map["message"],
        cnt = map["cnt"],
        list = DataConverter()
            .listMappable(map["list"])
            .map((e) => Forecast.fromJson(e))
            .toList();
}

class Forecast {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  String dt_txt;

  Forecast(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.dt_txt});

  Forecast.fromJson(Map<String, dynamic> map)
      : dt = map["dt"],
        main = Main.fromJson(map["main"]),
        weather = DataConverter()
            .listMappable(map["weather"])
            .map((e) => Weather.fromJson(e))
            .toList(),
        clouds = Clouds.fromJson(map["clouds"]),
        wind = Wind.fromJson(map["wind"]),
        visibility = map["visibility"],
        dt_txt = map["dt_txt"];
}

class Main {
  double temp;
  double temp_min;
  double temp_max;
  double pressure;
  double sea_level;
  double grnd_level;
  double humidity;
  double temp_kf;

  Main(
      {required this.temp,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.sea_level,
      required this.grnd_level,
      required this.humidity,
      required this.temp_kf});

  Main.fromJson(Map<String, dynamic> map)
      : temp = map["temp"].toDouble(),
        temp_min = map["temp_min"].toDouble(),
        temp_max = map["temp_max"].toDouble(),
        pressure = map["pressure"].toDouble(),
        sea_level = map["sea_level"].toDouble(),
        grnd_level = map["grnd_level"].toDouble(),
        humidity = map["humidity"].toDouble(),
        temp_kf = map["temp_kf"].toDouble();
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});
  Weather.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        main = map["main"],
        description = map["description"],
        icon = map["icon"];
}

class Clouds {
  int all;
  Clouds({required this.all});
  Clouds.fromJson(Map<String, dynamic> map) : all = map["all"];
}

class Wind {
  double speed;
  int deg;
  double gust;
  Wind({required this.speed, required this.deg, required this.gust});

  Wind.fromJson(Map<String, dynamic> map)
      : speed = map["speed"].toDouble(),
        deg = map["deg"],
        gust = map["gust"].toDouble();
}
