import 'package:arc_weather/domain/entities/forecast.dart';
import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';
import 'package:arc_weather/domain/repositories/weather_repository.dart';
import 'package:arc_weather/utils/result.dart';

class MockWeatherRepository implements WeatherRepository {
  @override
  Future<Result<Forecast>> getForecast(Location? location) async {
    // TODO: implement getForecast
    throw UnimplementedError();
  }

  @override
  Future<Result<Weather>> getWeather(Location? location) async {
    return Result<Weather>.ok(Weather());
  }
}
