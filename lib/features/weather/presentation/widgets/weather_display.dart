
import 'package:app_flutter/features/weather/domain/entities/weather.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weather.location,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '${weather.temperature}°C',
          style: TextStyle(fontSize: 48),
        ),
        SizedBox(height: 8),
        Text(
          weather.condition,
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}