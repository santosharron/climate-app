import 'package:climate/domain/entities/city.dart';
import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  const CityModel(this.city);

  final City city;

  @override
  List<Object?> get props => [city];
}
