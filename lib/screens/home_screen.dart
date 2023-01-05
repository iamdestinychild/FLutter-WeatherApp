import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/utility/current_weather.dart';
import 'package:weather_app/utility/get_location.dart';
import 'package:weather_app/utility/get_weather.dart';
import 'package:unixtime/unixtime.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.locationWeather});

  final locationWeather;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? temperature;
  String? country;
  String? state;
  double? wind;
  double? pressure;
  int? humidity;
  String? description;
  DateTime? dt;

  void weatherData(d) {
    temperature = d['main']['temp'];
    country = d['sys']['country'];
    state = d['name'];
    String windConvert = (d['wind']['speed'] * 3.6).toStringAsPrecision(2);
    wind = double.parse(windConvert);
    pressure = d['main']['pressure'] * 0.75;
    humidity = d['main']['humidity'];
    description = d['weather'][0]['description'];
    int timestamp = d['dt'];
    dt = (timestamp.toUnixTime());

    print(d);
  }

  @override
  void initState() {
    super.initState();
    weatherData(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Color(0xFF060628),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          var data = await CurrentWeather().getCurrentWeather();
                          setState(() {
                              weatherData(data);
                          });
                        },
                        child: Icon(
                          FontAwesomeIcons.locationDot,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 100.0,
                    ),
                    GestureDetector(
                        onTap: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SearchScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            CurrentWeather currentWeather = CurrentWeather();
                            var data = await currentWeather.getCityWeather(typedName);
                            setState(() {
                              weatherData(data);
                            });
                          }
                        },
                        child: Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.white,
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Text(
                        '$country, $state',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '$dt',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$temperature °C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70.0,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '$description',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF0e0e30),
                          ),
                          height: 100.0,
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${wind}km/h',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF0e0e30),
                          ),
                          height: 100.0,
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Text(
                                'Pressure',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${pressure}mmHg',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF0e0e30),
                          ),
                          height: 100.0,
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '$humidity%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
