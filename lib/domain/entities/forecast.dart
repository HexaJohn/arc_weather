import 'package:arc_weather/domain/entities/weather.dart';

abstract class Forecast {
  Map<DateTime, Weather> get data;
}
