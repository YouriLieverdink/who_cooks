import 'package:equatable/equatable.dart';
import 'package:sealed_unions/sealed_unions.dart';

class NlIruoyWhocooksRecipesV0ModelsIngredient extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsIngredient(
      {required this.title, required this.amount, this.unit});

  factory NlIruoyWhocooksRecipesV0ModelsIngredient.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsIngredient(
        title: (json['title'] as String),
        amount: (json['amount'] as double),
        unit: (json['unit'] as String?));
  }

  final String title;

  final double amount;

  final String? unit;

  dynamic toJson() {
    return {'title': title, 'amount': amount, 'unit': unit};
  }

  @override
  List<Object?> get props {
    return [title, amount, unit];
  }

  NlIruoyWhocooksRecipesV0ModelsIngredient copyWith(
      {String? title, double? amount, String? unit}) {
    return NlIruoyWhocooksRecipesV0ModelsIngredient(
        title: title ?? this.title,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipe extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipe(
      {required this.id,
      this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipe(
        id: (json['id'] as String),
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksRecipesV0ModelsIngredient.fromJson(v))
            .toList());
  }

  final String id;

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksRecipesV0ModelsIngredient> ingredients;

  dynamic toJson() {
    return {
      'id': id,
      'photo_url': photoUrl,
      'title': title,
      'description': description,
      'ingredients': ingredients.map((v) => v.toJson()).toList()
    };
  }

  @override
  List<Object?> get props {
    return [id, photoUrl, title, description, ingredients];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipe copyWith(
      {String? id,
      String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksRecipesV0ModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipe(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeDeleted extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipeDeleted(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeDeleted.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeDeleted(
        id: (json['id'] as String),
        timestamp: DateTime.parse(json['timestamp']),
        recipe: NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(json['recipe']));
  }

  final String id;

  final DateTime timestamp;

  final NlIruoyWhocooksRecipesV0ModelsRecipe recipe;

  dynamic toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'recipe': recipe.toJson()
    };
  }

  @override
  List<Object?> get props {
    return [id, timestamp, recipe];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipeDeleted copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesV0ModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeDeleted(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        recipe: recipe ?? this.recipe);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeForm extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipeForm(
      {this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeForm.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeForm(
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksRecipesV0ModelsIngredient.fromJson(v))
            .toList());
  }

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksRecipesV0ModelsIngredient> ingredients;

  dynamic toJson() {
    return {
      'photo_url': photoUrl,
      'title': title,
      'description': description,
      'ingredients': ingredients.map((v) => v.toJson()).toList()
    };
  }

  @override
  List<Object?> get props {
    return [photoUrl, title, description, ingredients];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipeForm copyWith(
      {String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksRecipesV0ModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeForm(
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeUpserted extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipeUpserted(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeUpserted.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeUpserted(
        id: (json['id'] as String),
        timestamp: DateTime.parse(json['timestamp']),
        recipe: NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(json['recipe']));
  }

  final String id;

  final DateTime timestamp;

  final NlIruoyWhocooksRecipesV0ModelsRecipe recipe;

  dynamic toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'recipe': recipe.toJson()
    };
  }

  @override
  List<Object?> get props {
    return [id, timestamp, recipe];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipeUpserted copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesV0ModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeUpserted(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        recipe: recipe ?? this.recipe);
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

  @override
  List<Object?> get props {
    return [code, message];
  }

  NlIruoyCommonV0ModelsError copyWith({String? code, String? message}) {
    return NlIruoyCommonV0ModelsError(
        code: code ?? this.code, message: message ?? this.message);
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

  @override
  List<Object?> get props {
    return [status, version];
  }

  NlIruoyCommonV0ModelsHealthcheck copyWith({String? status, String? version}) {
    return NlIruoyCommonV0ModelsHealthcheck(
        status: status ?? this.status, version: version ?? this.version);
  }
}

class NlIruoyWhocooksRecipesV0UnionsRecipeEvent extends Union2Impl<
    NlIruoyWhocooksRecipesV0ModelsRecipeUpserted,
    NlIruoyWhocooksRecipesV0ModelsRecipeDeleted> {
  NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
      Union2<NlIruoyWhocooksRecipesV0ModelsRecipeUpserted,
              NlIruoyWhocooksRecipesV0ModelsRecipeDeleted>
          union)
      : super(union);

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromJson(dynamic json) {
    final discriminator = (json as Map).keys.first;

    switch (discriminator) {
      case 'recipe_upserted':
        return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(factory.first(
            NlIruoyWhocooksRecipesV0ModelsRecipeUpserted.fromJson(
                json['recipe_upserted'])));
      case 'recipe_deleted':
        return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(factory.second(
            NlIruoyWhocooksRecipesV0ModelsRecipeDeleted.fromJson(
                json['recipe_deleted'])));
      default:
        throw Exception([
          discriminator,
          'Unsupported type: $discriminator, expected: recipe_upserted, recipe_deleted.'
        ]);
    }
  }

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromFirst(
      NlIruoyWhocooksRecipesV0ModelsRecipeUpserted recipeUpserted) {
    return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
        factory.first(recipeUpserted));
  }

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromSecond(
      NlIruoyWhocooksRecipesV0ModelsRecipeDeleted recipeDeleted) {
    return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
        factory.second(recipeDeleted));
  }

  static final Doublet<NlIruoyWhocooksRecipesV0ModelsRecipeUpserted,
          NlIruoyWhocooksRecipesV0ModelsRecipeDeleted> factory =
      const Doublet<NlIruoyWhocooksRecipesV0ModelsRecipeUpserted,
          NlIruoyWhocooksRecipesV0ModelsRecipeDeleted>();

  dynamic toJson() {
    return join((first) {
      return {'recipe_upserted': first.toJson()};
    }, (second) {
      return {'recipe_deleted': second.toJson()};
    });
  }
}

typedef Ingredient = NlIruoyWhocooksRecipesV0ModelsIngredient;
typedef Recipe = NlIruoyWhocooksRecipesV0ModelsRecipe;
typedef RecipeDeleted = NlIruoyWhocooksRecipesV0ModelsRecipeDeleted;
typedef RecipeForm = NlIruoyWhocooksRecipesV0ModelsRecipeForm;
typedef RecipeUpserted = NlIruoyWhocooksRecipesV0ModelsRecipeUpserted;
typedef RecipeEvent = NlIruoyWhocooksRecipesV0UnionsRecipeEvent;
