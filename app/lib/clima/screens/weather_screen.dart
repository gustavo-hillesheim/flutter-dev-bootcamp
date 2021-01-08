import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/clima/screens/city_screen.dart';
import 'package:flutter_dev_bootcamp/clima/services/weather.dart';
import 'package:flutter_dev_bootcamp/clima/utilities/constants.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherModel weather;

  WeatherScreen({@required this.weather});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weather;

  @override
  void initState() {
    super.initState();
    this.weather = widget.weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clima/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      WeatherService.getCurrentLocationWeather()
                          .then((weather) {
                        setState(() {
                          this.weather = weather;
                        });
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      final searchedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CityScreen()));
                      if (searchedCityName != null) {
                        WeatherService.getCityWeather(searchedCityName)
                            .then((newWeather) {
                          setState(() {
                            this.weather = newWeather;
                          });
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${weather.temperature}º',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weather.getWeatherIcon(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weather.getMessage()} in ${weather.cityName}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final String
// print('$cityName, $condition, $temperature');
