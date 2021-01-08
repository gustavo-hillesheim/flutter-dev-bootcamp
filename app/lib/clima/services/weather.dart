import 'package:flutter_dev_bootcamp/clima/services/location.dart';
import 'package:flutter_dev_bootcamp/clima/services/networking.dart';
import 'package:flutter_dev_bootcamp/clima/utilities/constants.dart';

class WeatherService {
  static Future<WeatherModel> getCityWeather(String cityName) {
    return _fetchCityWeatherData(cityName).then(_convertWeatherDataToModel);
  }

  static Future<WeatherModel> getCurrentLocationWeather() {
    return _getLocation()
        .then(_fetchLocationWeatherData)
        .then(_convertWeatherDataToModel);
  }

  static Future<Map<String, dynamic>> _fetchCityWeatherData(String cityName) {
    return NetworkHelper(_cityWeatherApiUrl(cityName)).getData();
  }

  static String _cityWeatherApiUrl(String cityName) {
    final query = 'q=$cityName&appid=$kWeatherApiKey&units=metric';
    return '$kOpenWeatherMapUrl?$query';
  }

  static Future<Location> _getLocation() async {
    return await Location.getCurrentLocation();
  }

  static Future<Map<String, dynamic>> _fetchLocationWeatherData(
      Location location) {
    return NetworkHelper(_locationWeatherApiUrl(location)).getData();
  }

  static String _locationWeatherApiUrl(Location location) {
    final query =
        'lat=${location.latitude}&lon=${location.longitude}&appid=$kWeatherApiKey&units=metric';
    return '$kOpenWeatherMapUrl?$query';
  }

  static WeatherModel _convertWeatherDataToModel(Map<String, dynamic> data) =>
      WeatherModel(
        cityName: data['name'] ?? '',
        condition: data['weather'][0]['id'],
        temperature: data['main']['temp'].toInt(),
      );
}

class WeatherModel {
  final int condition;
  final int temperature;
  final String cityName;

  WeatherModel({this.condition, this.temperature, this.cityName});

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
