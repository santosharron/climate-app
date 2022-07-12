import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/core/use_case.dart';
import 'package:climate/domain/entities/unit_system.dart';
import 'package:climate/domain/repos/unit_system_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetUnitSystem implements UseCase<UnitSystem, NoParams> {
  const GetUnitSystem(this.repo);

  final UnitSystemRepo repo;

  @override
  Future<Either<Failure, UnitSystem>> call(NoParams params) =>
      repo.getUnitSystem();
}

final getUnitSystemProvider =
    Provider((ref) => GetUnitSystem(ref.watch(unitSystemRepoProvider)));
