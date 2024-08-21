

import 'package:app_flutter/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String location);
}
