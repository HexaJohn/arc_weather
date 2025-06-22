import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';
import 'package:arc_weather/domain/repositories/weather_repository.dart';
import 'package:arc_weather/utils/result.dart';

class GetCurrentWeather {
  GetCurrentWeather({
    required this.weatherRepository,
  });
  final WeatherRepository weatherRepository;

  Future<Result<Weather?>> execute(Location location) async {
    try {
      final weather = await weatherRepository.getWeather(location);
      return weather;
    } catch (e) {
      throw Exception('GetCurrentWeather: Unable to get weather from weather repository');
    }
  }
}
