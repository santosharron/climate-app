import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/data/models/api_key_model.dart';
import 'package:climate/data/provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _apiKeyPrefsKey = 'open_weather_map_api_key';

class ApiKeyLocalDataSource {
  ApiKeyLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  Future<Either<Failure, ApiKeyModel>> getApiKey() async =>
      Right(ApiKeyModel.parse(_prefs.getString(_apiKeyPrefsKey)));

  Future<Either<Failure, void>> setApiKey(ApiKeyModel model) async {
    if (model.isCustom) {
      await _prefs.setString(_apiKeyPrefsKey, model.apiKey);
    } else {
      await _prefs.remove(_apiKeyPrefsKey);
    }

    return const Right(null);
  }
}

final apiKeyLocalDataSourceProvider = Provider(
  (ref) => ApiKeyLocalDataSource(ref.watch(sharedPreferencesProvider)),
);
