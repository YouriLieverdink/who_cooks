import 'dart:convert';
import 'package:http/http.dart';
import './NlIruoyWhocooksV0Json.dart';

class HealthchecksResource {
  const HealthchecksResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<NlIruoyCommonV0ModelsHealthcheck> get() async {
    final r = await client.get(
      Uri.parse('$baseUrl/_internal_/healthcheck'),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return NlIruoyCommonV0ModelsHealthcheck.fromJson(json);

      case 422:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200, 422.',
        ]);
    }
  }
}

class RecipesResource {
  const RecipesResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<NlIruoyWhocooksV0ModelsRecipe>> get(
      {num limit = 100, num skip = 0}) async {
    final r = await client.get(
      Uri.parse('$baseUrl/recipes').replace(
        queryParameters: {
          'limit': jsonEncode(limit),
          'skip': jsonEncode(skip),
        },
      ),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return (json as List)
            .map((v) => NlIruoyWhocooksV0ModelsRecipe.fromJson(v))
            .toList();

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 200.',
        ]);
    }
  }

  Future<NlIruoyWhocooksV0ModelsRecipe> post(
      NlIruoyWhocooksV0ModelsRecipeForm recipeForm) async {
    final r = await client.post(
      Uri.parse('$baseUrl/recipes'),
      body: jsonEncode(recipeForm),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 201:
        return NlIruoyWhocooksV0ModelsRecipe.fromJson(json);

      case 400:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 201, 400.',
        ]);
    }
  }

  Future<NlIruoyWhocooksV0ModelsRecipe> putById(
      NlIruoyWhocooksV0ModelsRecipeForm recipeForm,
      {required String id}) async {
    final r = await client.put(
      Uri.parse('$baseUrl/recipes/$id'),
      body: jsonEncode(recipeForm),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksV0ModelsRecipe.fromJson(json);

      case 400:
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
          'Unsupported status code: ${r.statusCode}, expected: 200, 400, 404.',
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

      case 404:
        throw Exception([
          r.statusCode,
          null,
        ]);

      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected: 204, 404.',
        ]);
    }
  }
}

class NlIruoyWhocooksV0Client {
  const NlIruoyWhocooksV0Client({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  HealthchecksResource get healthchecks {
    return HealthchecksResource(baseUrl: baseUrl, client: client);
  }

  RecipesResource get recipes {
    return RecipesResource(baseUrl: baseUrl, client: client);
  }
}
