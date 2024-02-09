class APIResponse {
  String cod;
  String message;
  int cnt;
  List<Forecast> list;

  APIResponse(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list});
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
}

class Main {
  double temp;
  double temp_min;
  double temp_max;
  int pressure;
  int sea_level;
  int grnd_level;
  int humidity;
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
}

class Clouds {
  int all;
  Clouds({required this.all});
}

class Wind {
  double speed;
  int deg;
  double gust;
  Wind({required this.speed, required this.deg, required this.gust});
}
