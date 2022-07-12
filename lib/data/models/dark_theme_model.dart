import 'package:collection/collection.dart';

enum DarkThemeModel {
  darkGrey('darkGrey'),
  black('black');

  const DarkThemeModel(this.string);

  final String string;

  static DarkThemeModel parse(String string) {
    final theme = values.firstWhereOrNull((theme) => theme.string == string);

    if (theme == null) {
      throw FormatException('Invalid theme', string);
    }

    return theme;
  }

  @override
  String toString() => string;
}
