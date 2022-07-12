import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/data/models/city_model.dart';
import 'package:climate/data/provider.dart';
import 'package:climate/domain/entities/city.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityLocalDataSource {
  CityLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  Future<Either<Failure, CityModel?>> getCity() async {
    final cityName = _prefs.getString('name');

    if (cityName == null) return const Right(null);

    return Right(CityModel(City(name: cityName)));
  }

  Future<Either<Failure, void>> setCity(City city) async {
    await _prefs.setString('name', city.name);

    return const Right(null);
  }
}

final cityLocalDataSourceProvider = Provider(
  (ref) => CityLocalDataSource(ref.watch(sharedPreferencesProvider)),
);
