import 'package:http/http.dart';
import 'dart:convert';
import './nl_iruoy_whocooks_recipes_v0_json.dart';

class NlIruoyCommonV0ModelsHealthcheckResource {
  const NlIruoyCommonV0ModelsHealthcheckResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<NlIruoyCommonV0ModelsHealthcheck> get() async {
    final r = await client.get(Uri.parse('$baseUrl/_internal_/healthcheck'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyCommonV0ModelsHealthcheck.fromJson(json);
      case 422:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 422.'
        ]);
    }
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeResource {
  const NlIruoyWhocooksRecipesV0ModelsRecipeResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<NlIruoyWhocooksRecipesV0ModelsRecipe>> get(
      {List<String>? ids, String? title, int limit = 100, int skip = 0}) async {
    final r = await client
        .get(Uri.parse('$baseUrl/recipes').replace(queryParameters: {
      if (ids != null) ...{
        'ids': ids.map((v) => v).toList().join(','),
      },
      if (title != null) ...{
        'title': title,
      },
      'limit': jsonEncode(limit),
      'skip': jsonEncode(skip)
    }));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return (json as List)
            .map((v) => NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(v))
            .toList();
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200.'
        ]);
    }
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> post(
      NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm) async {
    final r = await client.post(Uri.parse('$baseUrl/recipes'),
        body: jsonEncode(recipeForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 201:
        return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(json);
      case 400:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 201, 400.'
        ]);
    }
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> getById(
      {required String id}) async {
    final r = await client.get(Uri.parse('$baseUrl/recipes/$id'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(json);
      case 404:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 404.'
        ]);
    }
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> putById(
      NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm,
      {required String id}) async {
    final r = await client.put(Uri.parse('$baseUrl/recipes/$id'),
        body: jsonEncode(recipeForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(json);
      case 400:
        throw Exception([r.statusCode, null]);
      case 404:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 400, 404.'
        ]);
    }
  }

  Future<void> deleteById({required String id}) async {
    final r = await client.delete(Uri.parse('$baseUrl/recipes/$id'));
    // final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 204:
        return;
      case 404:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 204, 404.'
        ]);
    }
  }
}

class NlIruoyWhocooksRecipesV0Client {
  const NlIruoyWhocooksRecipesV0Client(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  NlIruoyCommonV0ModelsHealthcheckResource get healthchecks {
    return NlIruoyCommonV0ModelsHealthcheckResource(
        baseUrl: baseUrl, client: client);
  }

  NlIruoyWhocooksRecipesV0ModelsRecipeResource get recipes {
    return NlIruoyWhocooksRecipesV0ModelsRecipeResource(
        baseUrl: baseUrl, client: client);
  }
}
