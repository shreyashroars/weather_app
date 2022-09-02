import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Weather_data.dart';
import '../models/weather_model.dart';

class CityWeatherScreen extends StatefulWidget {
  late String city;
  CityWeatherScreen(this.city);

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  bool _loading = true;

  Weather w = Weather();
  sky s = sky();
  cloud c = cloud();
  wind wi = wind();
  @override
  void initState() {
    super.initState();
    getWeathRepo();
  }

  getWeathRepo() async {
    WeatherData wnews = WeatherData();
    await wnews.getWeath(widget.city);
    w = wnews.map;
    s = wnews.s1;
    c = wnews.c1;
    wi = wnews.we;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getImage(sky s) {
      Image im;
      if (s.main == 'Thunderstorm')
        im = Image.asset(
          'assets/pngwing.png',
        );
      else if (s.main == 'Clouds')
        im = Image.asset('assets/cloud.png');
      else if (s.main == 'Haze' || s.main == 'Mist')
        im = Image.asset('assets/001-haze.png');
      else if (s.main == 'Clear')
        im = Image.asset('assets/clear.png');
      else
        im = Image.asset('assets/rain.png');
      return im;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Weatherly',
        style: GoogleFonts.acme(),
      )),
      body: _loading
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              )),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          widget.city.toUpperCase(),
                          style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 250,
                    child: getImage(s),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          w.temp! + ' °C',
                          style: GoogleFonts.arvo(
                              textStyle: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w200)),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    s.main!,
                    style: GoogleFonts.arvo(textStyle: TextStyle(fontSize: 30)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.water_drop_sharp,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                Text(
                                  w.humidity! + '%',
                                  style: GoogleFonts.arvo(
                                      textStyle: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                            Text(
                              'Humidity',
                              style: GoogleFonts.arvo(
                                  textStyle: TextStyle(fontSize: 13)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.water_rounded,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                  c.all! + '%',
                                  style: GoogleFonts.arvo(
                                      textStyle: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                            Text(
                              'Chance of rain',
                              style: GoogleFonts.arvo(
                                  textStyle: TextStyle(fontSize: 13)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                  wi.speed! + 'km/hr',
                                  style: GoogleFonts.arvo(
                                      textStyle: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                            Text(
                              'Wind',
                              style: GoogleFonts.arvo(
                                  textStyle: TextStyle(fontSize: 13)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
