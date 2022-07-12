import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/domain/entities/city.dart';
import 'package:climate/domain/entities/full_weather.dart';
import 'package:riverpod/riverpod.dart';

abstract class FullWeatherRepo {
  Future<Either<Failure, FullWeather>> getFullWeather(City city);
}

final fullWeatherRepoProvider =
    Provider<FullWeatherRepo>((ref) => throw UnimplementedError());
