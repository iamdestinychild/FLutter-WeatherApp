import 'package:geolocator/geolocator.dart';
import 'package:weather_app/utility/get_location.dart';
import 'package:weather_app/utility/get_weather.dart';

class CurrentWeather {
  String apiKey = 'apikey';

  Future<dynamic> getCurrentWeather() async {
    GetGeoLocation geoLocation = GetGeoLocation();

    Position position = await geoLocation.getPosition();

    GetWeather getWeather = await GetWeather(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKey}&units=metric');

    return await getWeather.currentWeather();
  }

  Future<dynamic> getCityWeather(String typedName) async {
    GetWeather getWeather = await GetWeather(
        'https://api.openweathermap.org/data/2.5/weather?q=$typedName&appid=$apiKey&units=metric');
    
    return getWeather.currentWeather();
  }
}
