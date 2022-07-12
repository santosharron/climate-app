import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/core/use_case.dart';
import 'package:climate/domain/entities/unit_system.dart';
import 'package:climate/domain/repos/unit_system_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

class SetUnitSystem implements UseCase<void, SetUnitSystemParams> {
  const SetUnitSystem(this.repo);

  final UnitSystemRepo repo;

  @override
  Future<Either<Failure, void>> call(SetUnitSystemParams params) =>
      repo.setUnitSystem(params.unitSystem);
}

class SetUnitSystemParams extends Equatable {
  const SetUnitSystemParams(this.unitSystem);

  final UnitSystem unitSystem;

  @override
  List<Object?> get props => [unitSystem];
}

final setUnitSystemProvider =
    Provider((ref) => SetUnitSystem(ref.watch(unitSystemRepoProvider)));
