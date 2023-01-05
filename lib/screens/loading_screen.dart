import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:unixtime/unixtime.dart';
import 'package:weather_app/utility/current_weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getPosition();
  }

  getPosition() async{

    var data = await CurrentWeather().getCurrentWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(locationWeather: data);
    }));
  }

  final spinkit = SpinKitFadingCube(
    color: Colors.white,
    size: 70,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: spinkit,
      ),
    );
  }
}
