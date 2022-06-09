import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

class Recipe extends Equatable {
  const Recipe({required this.id, required this.title});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  final String id;

  final String title;

  dynamic toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
    ];
  }
}

class RecipeForm extends Equatable {
  const RecipeForm({required this.title});

  factory RecipeForm.fromJson(dynamic json) {
    return RecipeForm(
      title: json['title'] as String,
    );
  }

  final String title;

  dynamic toJson() {
    return {
      'title': title,
    };
  }

  @override
  List<Object?> get props {
    return [
      title,
    ];
  }
}

class Error extends Equatable {
  const Error({required this.code, required this.message});

  factory Error.fromJson(dynamic json) {
    return Error(
      code: json['code'] as String,
      message: json['message'] as String,
    );
  }

  final String code;

  final String message;

  dynamic toJson() {
    return {
      'code': code,
      'message': message,
    };
  }

  @override
  List<Object?> get props {
    return [
      code,
      message,
    ];
  }
}

class Healthcheck extends Equatable {
  const Healthcheck({required this.status});

  factory Healthcheck.fromJson(dynamic json) {
    return Healthcheck(
      status: json['status'] as String,
    );
  }

  final String status;

  dynamic toJson() {
    return {
      'status': status,
    };
  }

  @override
  List<Object?> get props {
    return [
      status,
    ];
  }
}

class ValidationError extends Equatable {
  const ValidationError({required this.field, required this.errors});

  factory ValidationError.fromJson(dynamic json) {
    return ValidationError(
      field: json['field'] as String,
      errors: (json['errors'] as List).map((v) => v as String).toList(),
    );
  }

  final String field;

  final List<String> errors;

  dynamic toJson() {
    return {
      'field': field,
      'errors': errors.map((v) => v).toList(),
    };
  }

  @override
  List<Object?> get props {
    return [
      field,
      errors,
    ];
  }
}

class HealthchecksResource {
  const HealthchecksResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<Healthcheck> get() async {
    final r = await client.get(
      Uri(
        host: baseUrl,
        path: '/_internal_/healthcheck',
      ),
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
      Uri(
        host: baseUrl,
        path: '/recipes',
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
      Uri(
        host: baseUrl,
        path: '/recipes',
      ),
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
      Uri(
        host: baseUrl,
        path: '/recipes/$id',
      ),
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
      Uri(
        host: baseUrl,
        path: '/recipes/$id',
      ),
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
