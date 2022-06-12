import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe(
      {required this.id,
      required this.title,
      this.photoUrl,
      this.description,
      required this.ingredients});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        id: (json['id'] as String),
        title: (json['title'] as String),
        photoUrl: (json['photo_url'] as String?),
        description: (json['description'] as String?),
        ingredients:
            (json['ingredients'] as List).map((v) => (v as String)).toList());
  }

  final String id;

  final String title;

  final String? photoUrl;

  final String? description;

  final List<String> ingredients;

  dynamic toJson() {
    return {
      'id': id,
      'title': title,
      'photo_url': photoUrl,
      'description': description,
      'ingredients': ingredients.map((v) => v).toList()
    };
  }

  List<Object?> get props {
    return [id, title, photoUrl, description, ingredients];
  }
}

class RecipeForm extends Equatable {
  const RecipeForm(
      {required this.title,
      this.photoUrl,
      this.description,
      required this.ingredients});

  factory RecipeForm.fromJson(dynamic json) {
    return RecipeForm(
        title: (json['title'] as String),
        photoUrl: (json['photo_url'] as String?),
        description: (json['description'] as String?),
        ingredients:
            (json['ingredients'] as List).map((v) => (v as String)).toList());
  }

  final String title;

  final String? photoUrl;

  final String? description;

  final List<String> ingredients;

  dynamic toJson() {
    return {
      'title': title,
      'photo_url': photoUrl,
      'description': description,
      'ingredients': ingredients.map((v) => v).toList()
    };
  }

  List<Object?> get props {
    return [title, photoUrl, description, ingredients];
  }
}

class Error extends Equatable {
  const Error({required this.code, required this.message});

  factory Error.fromJson(dynamic json) {
    return Error(
        code: (json['code'] as String), message: (json['message'] as String));
  }

  final String code;

  final String message;

  dynamic toJson() {
    return {'code': code, 'message': message};
  }

  List<Object?> get props {
    return [code, message];
  }
}

class Healthcheck extends Equatable {
  const Healthcheck({required this.status});

  factory Healthcheck.fromJson(dynamic json) {
    return Healthcheck(status: (json['status'] as String));
  }

  final String status;

  dynamic toJson() {
    return {'status': status};
  }

  List<Object?> get props {
    return [status];
  }
}

class ValidationError extends Equatable {
  const ValidationError({required this.field, required this.errors});

  factory ValidationError.fromJson(dynamic json) {
    return ValidationError(
        field: (json['field'] as String),
        errors: (json['errors'] as List).map((v) => (v as String)).toList());
  }

  final String field;

  final List<String> errors;

  dynamic toJson() {
    return {'field': field, 'errors': errors.map((v) => v).toList()};
  }

  List<Object?> get props {
    return [field, errors];
  }
}
