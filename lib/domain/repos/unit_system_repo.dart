import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/domain/entities/unit_system.dart';
import 'package:riverpod/riverpod.dart';

abstract class UnitSystemRepo {
  Future<Either<Failure, UnitSystem>> getUnitSystem();

  Future<Either<Failure, void>> setUnitSystem(UnitSystem unitSystem);
}

final unitSystemRepoProvider =
    Provider<UnitSystemRepo>((ref) => throw UnimplementedError());
