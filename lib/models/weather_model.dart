class Weather {
  final String? temp, humidity, temp_min, temp_max;
  Weather({this.humidity, this.temp, this.temp_max, this.temp_min});
}

class sky {
  final String? main, description;
  sky({this.main, this.description});
}

class cloud {
  final String? all;
  cloud({this.all});
}

class wind {
  final String? speed;
  wind({this.speed});
}
