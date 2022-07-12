import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/core/use_case.dart';
import 'package:climate/domain/entities/city.dart';
import 'package:climate/domain/repos/city_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetCity implements UseCase<City, NoParams> {
  const GetCity(this.repo);

  final CityRepo repo;

  @override
  Future<Either<Failure, City>> call(NoParams params) => repo.getCity();
}

final getCityProvider = Provider((ref) => GetCity(ref.watch(cityRepoProvider)));
