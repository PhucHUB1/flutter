// lib/main.dart
import 'package:app_flutter/features/weather/domain/use_cases/get_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/network/api_service.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/presentation/pages/weather_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(WeatherMapApp());
}

class WeatherMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ApiService('https://api.weatherapi.com/v1', http.Client()),
        ),
        Provider(
          create: (context) => WeatherRepositoryImpl(context.read<ApiService>()),
        ),
        Provider(
          create: (context) => GetWeather(context.read<WeatherRepositoryImpl>()),
        ),
      ],
      child: MaterialApp(
        title: 'Weather Map',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherPage(),
      ),
    );
  }
}
