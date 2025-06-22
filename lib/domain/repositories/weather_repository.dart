import 'package:arc_weather/domain/entities/forecast.dart';
import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';
import 'package:arc_weather/utils/result.dart';

abstract class WeatherRepository {
  Future<Result<Weather>> getWeather(Location? location);
  Future<Result<Forecast>> getForecast(Location? location);
}
