
import 'package:app_flutter/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required String location,
    required double temperature,
    required String condition,
    required String icon
  }) : super(
    location: location,
    temperature: temperature,
    condition: condition,
    icon: icon
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location']['name'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      icon: json['current']['condition']['icon']
    );
  }
}
