import 'package:equatable/equatable.dart';

class NlIruoyWhocooksV0ModelsIngredient extends Equatable {
  const NlIruoyWhocooksV0ModelsIngredient(
      {required this.title, required this.amount});

  factory NlIruoyWhocooksV0ModelsIngredient.fromJson(dynamic json) {
    return NlIruoyWhocooksV0ModelsIngredient(
        title: (json['title'] as String), amount: json['amount']);
  }

  final String title;

  final num amount;

  dynamic toJson() {
    return {'title': title, 'amount': amount};
  }

  NlIruoyWhocooksV0ModelsIngredient copyWith({String? title, num? amount}) {
    return NlIruoyWhocooksV0ModelsIngredient(
        title: title ?? this.title, amount: amount ?? this.amount);
  }

  @override
  List<Object?> get props {
    return [title, amount];
  }
}

class NlIruoyWhocooksV0ModelsRecipe extends Equatable {
  const NlIruoyWhocooksV0ModelsRecipe(
      {required this.id,
      this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksV0ModelsRecipe.fromJson(dynamic json) {
    return NlIruoyWhocooksV0ModelsRecipe(
        id: (json['id'] as String),
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksV0ModelsIngredient.fromJson(v))
            .toList());
  }

  final String id;

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksV0ModelsIngredient> ingredients;

  dynamic toJson() {
    return {
      'id': id,
      'photo_url': photoUrl,
      'title': title,
      'description': description,
      'ingredients': ingredients.map((v) => v.toJson()).toList()
    };
  }

  NlIruoyWhocooksV0ModelsRecipe copyWith(
      {String? id,
      String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksV0ModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksV0ModelsRecipe(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }

  @override
  List<Object?> get props {
    return [id, photoUrl, title, description, ingredients];
  }
}

class NlIruoyWhocooksV0ModelsRecipeForm extends Equatable {
  const NlIruoyWhocooksV0ModelsRecipeForm(
      {this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksV0ModelsRecipeForm.fromJson(dynamic json) {
    return NlIruoyWhocooksV0ModelsRecipeForm(
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksV0ModelsIngredient.fromJson(v))
            .toList());
  }

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksV0ModelsIngredient> ingredients;

  dynamic toJson() {
    return {
      'photo_url': photoUrl,
      'title': title,
      'description': description,
      'ingredients': ingredients.map((v) => v.toJson()).toList()
    };
  }

  NlIruoyWhocooksV0ModelsRecipeForm copyWith(
      {String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksV0ModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksV0ModelsRecipeForm(
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }

  @override
  List<Object?> get props {
    return [photoUrl, title, description, ingredients];
  }
}

class NlIruoyCommonV0ModelsError extends Equatable {
  const NlIruoyCommonV0ModelsError({required this.code, required this.message});

  factory NlIruoyCommonV0ModelsError.fromJson(dynamic json) {
    return NlIruoyCommonV0ModelsError(
        code: (json['code'] as String), message: (json['message'] as String));
  }

  final String code;

  final String message;

  dynamic toJson() {
    return {'code': code, 'message': message};
  }

  NlIruoyCommonV0ModelsError copyWith({String? code, String? message}) {
    return NlIruoyCommonV0ModelsError(
        code: code ?? this.code, message: message ?? this.message);
  }

  @override
  List<Object?> get props {
    return [code, message];
  }
}

class NlIruoyCommonV0ModelsHealthcheck extends Equatable {
  const NlIruoyCommonV0ModelsHealthcheck(
      {required this.status, required this.version});

  factory NlIruoyCommonV0ModelsHealthcheck.fromJson(dynamic json) {
    return NlIruoyCommonV0ModelsHealthcheck(
        status: (json['status'] as String),
        version: (json['version'] as String));
  }

  final String status;

  final String version;

  dynamic toJson() {
    return {'status': status, 'version': version};
  }

  NlIruoyCommonV0ModelsHealthcheck copyWith({String? status, String? version}) {
    return NlIruoyCommonV0ModelsHealthcheck(
        status: status ?? this.status, version: version ?? this.version);
  }

  @override
  List<Object?> get props {
    return [status, version];
  }
}

typedef Ingredient = NlIruoyWhocooksV0ModelsIngredient;
typedef Recipe = NlIruoyWhocooksV0ModelsRecipe;
typedef RecipeForm = NlIruoyWhocooksV0ModelsRecipeForm;
