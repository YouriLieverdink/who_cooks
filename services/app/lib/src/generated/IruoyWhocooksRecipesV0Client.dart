import 'dart:convert';

import 'package:http/http.dart';

import './IruoyWhocooksRecipesV0Json.dart';

class HealthchecksResource {
  const HealthchecksResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<Healthcheck> get() async {
    final r = await client.get(
      Uri.parse('$baseUrl/_internal_/healthcheck'),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return json;

      case 500:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200, 500.',
        ]);
    }
  }
}

class RecipesResource {
  const RecipesResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<Recipe>> get({int? skip, int? limit}) async {
    final r = await client.get(
      Uri.parse('$baseUrl/recipes').replace(
        queryParameters: {
          'skip': skip,
          'limit': limit,
        },
      ),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return (json as List).map((v) => Recipe.fromJson(v)).toList();

      case 401:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200, 401.',
        ]);
    }
  }

  Future<Recipe> post(RecipeForm recipeForm) async {
    final r = await client.post(
      Uri.parse('$baseUrl/recipes'),
      body: jsonEncode(recipeForm),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return Recipe.fromJson(json);

      case 400:
        throw Exception([
          r.statusCode,
          null,
        ]);

      case 401:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200, 400, 401.',
        ]);
    }
  }

  Future<Recipe> putById(RecipeForm recipeForm, {required String id}) async {
    final r = await client.put(
      Uri.parse('$baseUrl/recipes/$id'),
      body: jsonEncode(recipeForm),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return Recipe.fromJson(json);

      case 400:
        throw Exception([
          r.statusCode,
          null,
        ]);

      case 401:
        throw Exception([
          r.statusCode,
          null,
        ]);

      case 404:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200, 400, 401, 404.',
        ]);
    }
  }

  Future<void> deleteById({required String id}) async {
    final r = await client.delete(
      Uri.parse('$baseUrl/recipes/$id'),
    );

    switch (r.statusCode) {
      case 204:
        return;

      case 401:
        throw Exception([
          r.statusCode,
          null,
        ]);

      case 404:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 204, 401, 404.',
        ]);
    }
  }
}

class IruoyWhocooksRecipesV0Client {
  const IruoyWhocooksRecipesV0Client(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  HealthchecksResource get healthchecks {
    return HealthchecksResource(baseUrl: baseUrl, client: client);
  }

  RecipesResource get recipes {
    return RecipesResource(baseUrl: baseUrl, client: client);
  }
}
