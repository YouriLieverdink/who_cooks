import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

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

class Token extends Equatable {
  const Token({required this.token, required this.refreshToken});

  factory Token.fromJson(dynamic json) {
    return Token(
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }

  final String token;

  final String refreshToken;

  dynamic toJson() {
    return {
      'token': token,
      'refresh_token': refreshToken,
    };
  }

  @override
  List<Object?> get props {
    return [
      token,
      refreshToken,
    ];
  }
}

class TokenForm extends Equatable {
  const TokenForm({required this.email, required this.password});

  factory TokenForm.fromJson(dynamic json) {
    return TokenForm(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  final String email;

  final String password;

  dynamic toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props {
    return [
      email,
      password,
    ];
  }
}

class User extends Equatable {
  const User({required this.id, required this.email});

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
    );
  }

  final String id;

  final String email;

  dynamic toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      email,
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
        return Healthcheck.fromJson(json);

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

  Future<List<Recipe>> get({int? limit, int? offset}) async {
    final r = await client.get(
      Uri(
        host: baseUrl,
        path: '/recipes',
        queryParameters: {
          'limit': limit,
          'offset': offset,
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
      case 201:
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
          'Unsupported status code: ${r.statusCode}, expected: 201, 400, 401.',
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

class TokensResource {
  const TokensResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<Token> post(TokenForm tokenForm) async {
    final r = await client.post(
      Uri(
        host: baseUrl,
        path: '/tokens',
      ),
      body: jsonEncode(tokenForm),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return Token.fromJson(json);

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

  Future<Token> put(Token token) async {
    final r = await client.put(
      Uri(
        host: baseUrl,
        path: '/tokens',
      ),
      body: jsonEncode(token),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return Token.fromJson(json);

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
}

class UsersResource {
  const UsersResource({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<User> get() async {
    final r = await client.get(
      Uri(
        host: baseUrl,
        path: '/users/me',
      ),
    );

    final json = jsonDecode(r.body);

    switch (r.statusCode) {
      case 200:
        return User.fromJson(json);

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
}

class IruoyWhocooksV0Client {
  const IruoyWhocooksV0Client({required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  HealthchecksResource get healthchecks {
    return HealthchecksResource(baseUrl: baseUrl, client: client);
  }

  RecipesResource get recipes {
    return RecipesResource(baseUrl: baseUrl, client: client);
  }

  TokensResource get tokens {
    return TokensResource(baseUrl: baseUrl, client: client);
  }

  UsersResource get users {
    return UsersResource(baseUrl: baseUrl, client: client);
  }
}
