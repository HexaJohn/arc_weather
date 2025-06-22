import 'package:arc_weather/application/datasources/abstract/weather_cache_datasource.dart';
import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';

class MemoryWeatherCacheDatasource implements WeatherCacheDatasource {
  final Map<Location, Weather> memoryWeatherData = {};

  @override
  Future<Weather> readWeather(Location location) async {
    try {
      if (memoryWeatherData.isEmpty) throw Exception('No weather data');

      if (!memoryWeatherData.containsKey(location)) throw Exception('Location does not exist');

      final Weather? weather = memoryWeatherData[location];

      if (weather == null) throw Exception('Weather data for location does not exist');

      return weather;
    } catch (e) {
      throw Exception('MemoryWeatherCacheDatasource::readWeather: unable to read weather');
    }
  }

  @override
  Future<bool> writeWeather(Weather weather, Location location) async {
    try {
      memoryWeatherData.update(
        location,
        (existing) => weather,
        ifAbsent: () => weather,
      );

      return true;
    } catch (e) {
      throw Exception('MemoryWeatherCacheDatasource::writeWeather: Unable to write weather');
    }
  }
}
