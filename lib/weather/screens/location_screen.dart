import 'package:flutter/material.dart';
import 'package:save_Earth/weather/services/weather.dart';
import 'package:save_Earth/weather/utilities/constants.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String weatherMessage;
  String name;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        weatherMessage = "Unable find the weather";
        name = "";
        return;
      }
      var condition = weatherData["weather"][0]["id"];
      weatherIcon = weather.getWeatherIcon(condition);
      print(weatherIcon);
      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature);
      name = weatherData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var weatherData = await weather.getLocationWeather();
              updateUI(weatherData);
            },
            child: Icon(
              Icons.near_me,
              size: 35.0,
            ),
          ),
          FlatButton(
            onPressed: () async {
              var typedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
              print(typedName);
              if (typedName != null) {
                var weatherData = await weather.getCityWeather(typedName);
                updateUI(weatherData);
              }
            },
            child: Icon(
              Icons.location_city,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "$temperature",
                    style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 100.0,
                        color: Colors.purple),
                  ),
                  Text(
                    weatherIcon,
                    style: kConditionTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                "$weatherMessage in $name!",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
