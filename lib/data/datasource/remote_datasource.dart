import 'dart:convert';

import 'package:covid_19_app/data/models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RemoteDataSources {
  final http.Client client;
  RemoteDataSources(this.client);

  Future<int> getCovidData(Position position) async {
    final data = {
      "lon": position.longitude.toInt(),
      "lat": position.latitude.toInt()
    };
    final String stateName = await getStateName(position);
    final response = await client.post(
      Uri.parse(
        'https://covid--predict-api.herokuapp.com/predict',
      ),
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
      },
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['prediction'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Weather> getWeatherData(Position position) async {
    final String apiKey = '19717c12b4a603188f4d14cac46c22f3';
    final String lat = position.latitude.toString();
    final String lon = position.longitude.toString();
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,daily,minutely&appid=$apiKey';
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      return Weather.fromMap(res['current']);
    } else {
      throw ServerException();
    }
  }

  Future<String> getStateName(Position position) async {
    final String lat = position.latitude.toString();
    final String lon = position.longitude.toString();
    final String apiKey = '95f57ceca5b4e6908637420dd6da9f6d';
    String url =
        'http://api.positionstack.com/v1/reverse?access_key=$apiKey&query=$lat,$lon';
    final response = await client.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      return res['data'][0]['region'];
    } else {
      throw ServerException();
    }
  }
}

class ServerException {}
