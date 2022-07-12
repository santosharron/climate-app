import 'package:climate/domain/entities/unit_system.dart';
import 'package:climate/domain/utils/unit_conversion.dart';
import 'package:equatable/equatable.dart';

class DailyForecast extends Equatable {
  const DailyForecast({
    required this.date,
    required this.sunrise,
    required this.sunset,
    required this.minTemperature,
    required this.maxTemperature,
    required this.pop,
    required this.iconCode,
    required this.unitSystem,
  });

  final DateTime date;

  final DateTime sunrise;

  final DateTime sunset;

  final double minTemperature;

  final double maxTemperature;

  /// Probability of precipitation.
  final double pop;

  final String iconCode;

  final UnitSystem unitSystem;

  @override
  List<Object?> get props => [
        date,
        sunrise,
        sunset,
        minTemperature,
        maxTemperature,
        pop,
        iconCode,
        unitSystem
      ];

  DailyForecast changeUnitSystem(UnitSystem newUnitSystem) {
    if (unitSystem == newUnitSystem) {
      return this;
    }

    final double newMaxTemperature;
    final double newMinTemperature;

    switch (unitSystem) {
      case UnitSystem.imperial:
        newMaxTemperature = convertFahrenheitToCelsius(maxTemperature);
        newMinTemperature = convertFahrenheitToCelsius(minTemperature);
        break;

      case UnitSystem.metric:
        newMaxTemperature = convertCelsiusToFahrenheit(maxTemperature);
        newMinTemperature = convertCelsiusToFahrenheit(minTemperature);
    }

    return DailyForecast(
      date: date,
      iconCode: iconCode,
      sunrise: sunrise,
      sunset: sunset,
      pop: pop,
      maxTemperature: newMaxTemperature,
      minTemperature: newMinTemperature,
      unitSystem: newUnitSystem,
    );
  }
}
