import 'dart:convert';
import 'package:bhoomi_seva/classes/language_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<StatefulWidget> createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  List<Current> weather = [];
  Color weatherColour = Colors.white;
  int hour = DateTime.now().hour;
  @override
  void initState() {
    List<Color> temp = getcolor();
    weatherColour = temp[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: weatherColour,
      body: FutureBuilder<List<Forecast>>(
          future: getweather(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            } else {
              //print(snapshot.data);
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: getcolor()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          (translation(context).weather),
                          style: GoogleFonts.poppins(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 140,
                            width: 140,
                            child: Image.asset(
                              getWeatherIcon(weather[0].id),
                              fit: BoxFit.fill,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${(weather[0].temp - 273.15).toStringAsFixed(1)}°",
                              style: GoogleFonts.poppins(
                                  fontSize: 60, color: Colors.white),
                            ),
                            Text(
                              weather[0].weather,
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (translation(context).humidity),
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${(weather[0].humidity).toStringAsFixed(1)}%",
                              style: GoogleFonts.poppins(
                                  fontSize: 44, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (translation(context).pressure),
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${(weather[0].pressure)}",
                              style: GoogleFonts.poppins(
                                  fontSize: 44, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          (translation(context).forecast),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )),
                    Expanded(
                      child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.5,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5.0),
                          children: snapshot.data!.map((document) {
                            return Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEEE').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          document.dt * 1000)),
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Image.asset(
                                          getWeatherIcon(document.desc)),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          //(translation(context).max :  ${(document.max - 273.15).toStringAsFixed(1)}°),
                                          'Max:  ${(document.max - 273.15).toStringAsFixed(1)}°',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Min:  ${(document.min - 273.15).toStringAsFixed(1)}°',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList()),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  List<Color> getcolor() {
    if (hour >= 6 && hour <= 11) {
      return [
        const Color(0xFF83eaf1),
        const Color(0xFF3eadcf)
      ]; //const Color(0xFF83eaf1), const Color(0xFF3eadcf)
    } else if (hour > 11 && hour <= 16) {
      return [const Color(0xFFFFDF00), const Color(0xFFF6D108)];
    } else if (hour > 16 && hour < 19) {
      return [
        const Color(0xFF4e54c8),
        const Color(0xFF9795ef),
      ];
    } else {
      return [const Color(0xFF001D37), const Color(0xFF01162E)];
    }
  }

  String getWeatherIcon(int condition) {
    Text(translation(context).storm);
    Text(translation(context).smoke);
    Text(translation(context).rainy);
    Text(translation(context).snow);
    Text(translation(context).clear);
    Text(translation(context).cloudy);
    Text(translation(context).unknown);
    if (condition < 300) {
      return 'assets/ic_storm_weather.png';
    } else if (condition < 400) {
      return 'assets/ic_rainy_weather.png';
    } else if (condition < 600) {
      return 'assets/ic_rainy_weather.png';
    } else if (condition < 700) {
      return 'assets/ic_snow_weather.png';
    } else if (condition < 800) {
      return 'assets/ic_mostly_cloudy.png';
    } else if (condition == 800) {
      return 'assets/ic_clear_day.png';
    } else if (condition <= 804) {
      return 'assets/ic_cloudy_weather.png';
    } else {
      return 'assets/ic_unknown.png';
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<List<Forecast>> getweather() async {
    try {
      Position p = await _determinePosition();
      Response r = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/onecall?lat=${p.latitude}&lon=${p.longitude}&exclude=hourly,minutely&appid=8cb6386fe572b5b0befe4eba9bfa7c2f"));
      //print(r.body);
      Map<String, dynamic> x = jsonDecode(r.body);
      //print(x['current']);
      weather.add(Current(
          x['current']['temp'],
          x['current']['weather'][0]['description'],
          x['current']['weather'][0]['main'],
          x['current']['humidity'],
          x['current']['weather'][0]['id'],
          x['current']['pressure']));
      dynamic y = x['daily'];
      if (kDebugMode) {
        print(y);
      }
      List<Forecast> z = [];
      for (dynamic i = 1; i < 5; i++) {
        //print(y[i]['weather'][0]['id']);
        z.add(Forecast(
            y[i]['dt'],
            y[i]['humidity'],
            y[i]['temp']['max'],
            y[i]['temp']['min'],
            y[i]['weather'][0]['main'],
            y[i]['weather'][0]['id']));
      }

      return z;
    } catch (e) {
      List<Forecast> z = [];
      return z;
    }
  }
}

class Current {
  dynamic temp;
  dynamic pressure;
  dynamic humidity;
  dynamic weather;
  dynamic id;
  dynamic desc;
  Current(this.temp, this.desc, this.weather, this.humidity, this.id,
      this.pressure);
}

class Forecast {
  dynamic dt;
  dynamic max;
// ignore: prefer_typing_uninitialized_variables
  dynamic humidity;
  dynamic min;
// ignore: prefer_typing_uninitialized_variables
  dynamic weather;
  dynamic desc;
  Forecast(this.dt, this.humidity, this.max, this.min, this.weather, this.desc);
}
