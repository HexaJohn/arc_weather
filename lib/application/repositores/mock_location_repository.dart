import 'package:arc_weather/domain/entities/location.dart';
import 'package:arc_weather/domain/repositories/location_repository.dart';
import 'package:arc_weather/utils/result.dart';

class MockLocationRepository implements LocationRespository {
  @override
  Future<Result<bool>> deleteLocation(Location? location) async {
    // TODO: implement deleteLocation
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> saveLocation(Location? location) async {
    // TODO: implement saveLocation
    throw UnimplementedError();
  }

  @override
  Future<Result<Location>> getPrimaryLocation() async {
    return Result<Location>.ok(Location());
  }

  @override
  // TODO: implement savedLocations
  Future<Result<List<Location>>> get savedLocations => throw UnimplementedError();
}
