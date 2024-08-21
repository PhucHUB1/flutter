import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/weather/data/models/weather_model.dart';
import 'package:app_flutter/features/weather/data/repositories/weather_repository.dart';
import 'package:app_flutter/features/weather/domain/entities/weather.dart';
import 'dart:convert';


class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<Weather> getWeather(String location) async {
    final response = await apiService.get('/current.json?key=4e8ab5e20e3e49c59f522056241908&q=$location');
    final weatherJson = jsonDecode(response.body);
    return WeatherModel.fromJson(weatherJson);
  }
}