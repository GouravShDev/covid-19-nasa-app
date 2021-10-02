import 'dart:convert';

import 'package:covid_19_app/data/models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RemoteDataSources {
  final http.Client client;
  RemoteDataSources(this.client);

  // Future<> getCovidData() async {
  //   final response = await client.get(
  //       'https://api.covid19api.com/summary');
  //   if (response.statusCode == 200) {
  //     return CovidData.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

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
      return Weather.fromJson(res['current']['value']);
    } else {
      throw ServerException();
    }
  }
}

class ServerException {}
