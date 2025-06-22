import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';

abstract class WeatherCacheDatasource {
  Future<Weather> readWeather(Location location);
  Future<bool> writeWeather(Weather weather, Location location);
}
