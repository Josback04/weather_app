class GroupWeather {
  int min;
  int max;
  String description;
  String icon;
  String day;

  GroupWeather(this.day, this.description, this.icon, this.max, this.min);

  String minAndMax() {
    return "Min: $min °C - Max: $max °C";
  }
}
