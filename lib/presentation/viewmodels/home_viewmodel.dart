import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/entities/weather.dart';
import 'package:arc_weather/domain/repositories/location_repository.dart';
import 'package:arc_weather/domain/repositories/weather_repository.dart';
import 'package:arc_weather/utils/command.dart';
import 'package:arc_weather/utils/logger.dart';
import 'package:arc_weather/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required LocationRespository locationRepository,
    required WeatherRepository weatherRepository,
  })  : _locationRepository = locationRepository,
        _weatherRepository = weatherRepository {
    load = Command0(_load)..execute();
  }

  final Logger _log = Logger('HomeViewModel');

  final LocationRespository _locationRepository;
  final WeatherRepository _weatherRepository;

  Location? _location;
  Weather? _weather;

  late Command0 load;

  String get currentWeather => '_weather';

  Future<Result> _load() async {
    try {
      final locationResult = await _locationRepository.getPrimaryLocation();

      switch (locationResult) {
        case Ok<Location>():
          _location = locationResult.value;
          _log.info('got location');

        case Error<Location>():
          _log.info('failed to load location');
      }

      final weatherResult = await _weatherRepository.getWeather(_location);

      switch (weatherResult) {
        case Ok<Weather>():
          _weather = weatherResult.value;
        case Error<Weather>():
          _log.info('failed to load weather');
      }

      return weatherResult;
    } finally {
      notifyListeners();
    }
  }
}
