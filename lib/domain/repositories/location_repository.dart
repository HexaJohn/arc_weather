import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/utils/result.dart';

abstract class LocationRespository {
  Future<Result<List<Location>>> get savedLocations;
  Future<Result<bool>> saveLocation(Location? location);
  Future<Result<bool>> deleteLocation(Location? location);
  Future<Result<Location>> getPrimaryLocation();
}
