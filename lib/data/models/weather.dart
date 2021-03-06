import 'dart:convert';

class Weather {
  final double temp;
  final double pressure;
  final double humidity;

  Weather({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temp: map['temp'] as double,
      pressure: (map['pressure'] as int).toDouble(),
      humidity: (map['humidity'] as int).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));
}
