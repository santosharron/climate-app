import 'package:collection/collection.dart';

enum ThemeModel {
  systemDefault('systemDefault'),
  light('light'),
  dark('dark');

  const ThemeModel(this.string);

  final String string;

  static ThemeModel parse(String string) {
    final theme = values.firstWhereOrNull((theme) => theme.string == string);

    if (theme == null) {
      throw FormatException('Invalid theme', string);
    }

    return theme;
  }

  @override
  String toString() => string;
}
