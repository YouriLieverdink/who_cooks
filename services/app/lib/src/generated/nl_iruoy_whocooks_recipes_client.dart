import 'package:http/http.dart';
import 'dart:convert';
import './nl_iruoy_whocooks_recipes_json.dart';

class NlIruoyCommonModelsHealthcheckResource {
  const NlIruoyCommonModelsHealthcheckResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<NlIruoyCommonModelsHealthcheck> get() async {
    final r = await client.get(Uri.parse('$baseUrl/_internal_/healthcheck'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyCommonModelsHealthcheck.fromJson(json);
      case 422:
        throw NlIruoyCommonModelsError.fromJson(json);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 422.'
        ]);
    }
  }
}

class NlIruoyWhocooksRecipesModelsRecipeResource {
  const NlIruoyWhocooksRecipesModelsRecipeResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<NlIruoyWhocooksRecipesModelsRecipe>> get(
      {num limit = 100, num skip = 0}) async {
    final r = await client.get(Uri.parse('$baseUrl/recipes').replace(
        queryParameters: {
          'limit': jsonEncode(limit),
          'skip': jsonEncode(skip)
        }));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return (json as List)
            .map((v) => NlIruoyWhocooksRecipesModelsRecipe.fromJson(v))
            .toList();
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200.'
        ]);
    }
  }

  Future<NlIruoyWhocooksRecipesModelsRecipe> post(
      NlIruoyWhocooksRecipesModelsRecipeForm recipeForm) async {
    final r = await client.post(Uri.parse('$baseUrl/recipes'),
        body: jsonEncode(recipeForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 201:
        return NlIruoyWhocooksRecipesModelsRecipe.fromJson(json);
      case 400:
        throw NlIruoyCommonModelsError.fromJson(json);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 201, 400.'
        ]);
    }
  }

  Future<NlIruoyWhocooksRecipesModelsRecipe> putById(
      NlIruoyWhocooksRecipesModelsRecipeForm recipeForm,
      {required String id}) async {
    final r = await client.put(Uri.parse('$baseUrl/recipes/$id'),
        body: jsonEncode(recipeForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksRecipesModelsRecipe.fromJson(json);
      case 400:
        throw NlIruoyCommonModelsError.fromJson(json);
      case 404:
        throw json;
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 400, 404.'
        ]);
    }
  }

  Future<void> deleteById({required String id}) async {
    final r = await client.delete(Uri.parse('$baseUrl/recipes/$id'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 204:
        return json;
      case 404:
        throw json;
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 204, 404.'
        ]);
    }
  }
}

class NlIruoyWhocooksRecipesClient {
  const NlIruoyWhocooksRecipesClient(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  NlIruoyCommonModelsHealthcheckResource get healthchecks {
    return NlIruoyCommonModelsHealthcheckResource(
        baseUrl: baseUrl, client: client);
  }

  NlIruoyWhocooksRecipesModelsRecipeResource get recipes {
    return NlIruoyWhocooksRecipesModelsRecipeResource(
        baseUrl: baseUrl, client: client);
  }
}
