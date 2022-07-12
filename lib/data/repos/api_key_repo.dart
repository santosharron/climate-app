import 'dart:async';

import 'package:climate/core/either.dart';
import 'package:climate/core/failure.dart';
import 'package:climate/data/data_sources/api_key_local_data_source.dart';
import 'package:climate/data/models/api_key_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class ApiKeyRepo {
  ApiKeyRepo(this.localDataSource);

  final ApiKeyLocalDataSource localDataSource;

  Future<Either<Failure, ApiKeyModel>> getApiKey() =>
      localDataSource.getApiKey();

  Future<Either<Failure, void>> setApiKey(ApiKeyModel apiKeyModel) async {
    if (!apiKeyModel.isCustom) {
      return localDataSource.setApiKey(apiKeyModel);
    }

    final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        queryParameters: {'appid': apiKeyModel.apiKey},
      ),
    );

    switch (response.statusCode) {
      case 400:
        return localDataSource.setApiKey(apiKeyModel);

      case 401:
        return const Left(InvalidApiKey());

      case 503:
        return const Left(ServerDown());

      default:
        return const Left(FailedToParseResponse());
    }
  }
}

final apiKeyRepoProvider =
    Provider((ref) => ApiKeyRepo(ref.watch(apiKeyLocalDataSourceProvider)));
