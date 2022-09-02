import 'package:weather_app/models/weather_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  Weather map = Weather();
  sky s1 = sky();
  cloud c1 = cloud();
  wind we = wind();
  Future<void> getWeath(String city) async {
    var Url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=332af2e86ccfaf550f2b2f72e7688b7c&units=metric');
    var response = await http.get(Url);
    if (response.statusCode != 200) throw Exception();
    var jsonData = jsonDecode(response.body);
    print('hello beta');
    Weather w = Weather(
        humidity: jsonData['main']['humidity'].toString(),
        temp: jsonData['main']['temp'].toString(),
        temp_max: jsonData['main']['temp_max'].toString(),
        temp_min: jsonData['main']['temp_min'].toString());
    // for (var element in jsonData['weather']) {
    // sky s = sky(main: element['main'], description: element['description']);
    // s1.add(s);
    // }
    wind wi = wind(speed: jsonData['wind']['speed'].round().toString());
    var element = jsonData['weather'][0];
    sky s = sky(main: element['main'], description: element['description']);
    s1 = s;
    cloud c = cloud(all: jsonData['clouds']['all'].toString());
    map = w;
    we = wi;
    c1 = c;
    print('yay');
  }
}
