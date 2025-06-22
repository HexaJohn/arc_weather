import 'package:arc_weather/application/repositores/mock_location_repository.dart';
import 'package:arc_weather/application/repositores/mock_weather_repository.dart';
import 'package:arc_weather/domain/repositories/location_repository.dart';
import 'package:arc_weather/domain/repositories/weather_repository.dart';
import 'package:arc_weather/presentation/screens/home.dart';
import 'package:arc_weather/presentation/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final LocationRespository locationRepository = MockLocationRepository();
  final WeatherRepository weatherRepository = MockWeatherRepository();

  late final HomeViewModel homeViewModel = HomeViewModel(
    locationRepository: locationRepository,
    weatherRepository: weatherRepository,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView(viewModel: homeViewModel));
  }
}
