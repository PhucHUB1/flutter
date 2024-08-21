// lib/features/weather/presentation/pages/weather_page.dart
import 'package:app_flutter/features/weather/domain/entities/weather.dart';
import 'package:app_flutter/features/weather/domain/use_cases/get_weather.dart';
import 'package:app_flutter/features/weather/presentation/widgets/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController locationController = TextEditingController();
  Weather? weather;

  @override
  Widget build(BuildContext context) {
    final getWeather = Provider.of<GetWeather>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Map'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Enter Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final fetchedWeather = await getWeather.execute(locationController.text);
                setState(() {
                  weather = fetchedWeather;
                });
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            weather != null
                ? WeatherDisplay(weather: weather!)
                : Text('Enter a location to get weather information'),
          ],
        ),
      ),
    );
  }
}
