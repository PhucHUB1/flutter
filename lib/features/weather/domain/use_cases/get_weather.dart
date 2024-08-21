
import 'package:app_flutter/features/weather/data/repositories/weather_repository.dart';
import 'package:app_flutter/features/weather/domain/entities/weather.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Weather> execute(String location) {
    return repository.getWeather(location);
  }
}