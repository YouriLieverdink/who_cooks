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
      {required this.id, this.photoUrl, required this.title, this.description});

  factory NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipe(
        id: (json['id'] as String),
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?));
  }

  final String id;

  final String? photoUrl;

  final String title;

  final String? description;

  dynamic toJson() {
    return {
      'id': id,
      'photo_url': photoUrl,
      'title': title,
      'description': description
    };
  }

  @override
  List<Object?> get props {
    return [id, photoUrl, title, description];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipe copyWith(
      {String? id, String? photoUrl, String? title, String? description}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipe(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description);
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
      {this.photoUrl, required this.title, this.description});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeForm.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeForm(
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?));
  }

  final String? photoUrl;

  final String title;

  final String? description;

  dynamic toJson() {
    return {'photo_url': photoUrl, 'title': title, 'description': description};
  }

  @override
  List<Object?> get props {
    return [photoUrl, title, description];
  }

  NlIruoyWhocooksRecipesV0ModelsRecipeForm copyWith(
      {String? photoUrl, String? title, String? description}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeForm(
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeInserted extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipeInserted(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeInserted.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeInserted(
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

  NlIruoyWhocooksRecipesV0ModelsRecipeInserted copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesV0ModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeInserted(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        recipe: recipe ?? this.recipe);
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeUpdated extends Equatable {
  const NlIruoyWhocooksRecipesV0ModelsRecipeUpdated(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesV0ModelsRecipeUpdated.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeUpdated(
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

  NlIruoyWhocooksRecipesV0ModelsRecipeUpdated copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesV0ModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesV0ModelsRecipeUpdated(
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

class NlIruoyWhocooksRecipesV0UnionsRecipeEvent extends Union3Impl<
    NlIruoyWhocooksRecipesV0ModelsRecipeInserted,
    NlIruoyWhocooksRecipesV0ModelsRecipeUpdated,
    NlIruoyWhocooksRecipesV0ModelsRecipeDeleted> {
  NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
      Union3<
              NlIruoyWhocooksRecipesV0ModelsRecipeInserted,
              NlIruoyWhocooksRecipesV0ModelsRecipeUpdated,
              NlIruoyWhocooksRecipesV0ModelsRecipeDeleted>
          union)
      : super(union);

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromJson(dynamic json) {
    final discriminator = (json as Map).keys.first;

    switch (discriminator) {
      case 'recipe_inserted':
        return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(factory.first(
            NlIruoyWhocooksRecipesV0ModelsRecipeInserted.fromJson(
                json['recipe_inserted'])));
      case 'recipe_updated':
        return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(factory.second(
            NlIruoyWhocooksRecipesV0ModelsRecipeUpdated.fromJson(
                json['recipe_updated'])));
      case 'recipe_deleted':
        return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(factory.third(
            NlIruoyWhocooksRecipesV0ModelsRecipeDeleted.fromJson(
                json['recipe_deleted'])));
      default:
        throw Exception([
          discriminator,
          'Unsupported type: $discriminator, expected: recipe_inserted, recipe_updated, recipe_deleted.'
        ]);
    }
  }

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromFirst(
      NlIruoyWhocooksRecipesV0ModelsRecipeInserted recipeInserted) {
    return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
        factory.first(recipeInserted));
  }

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromSecond(
      NlIruoyWhocooksRecipesV0ModelsRecipeUpdated recipeUpdated) {
    return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
        factory.second(recipeUpdated));
  }

  factory NlIruoyWhocooksRecipesV0UnionsRecipeEvent.fromThird(
      NlIruoyWhocooksRecipesV0ModelsRecipeDeleted recipeDeleted) {
    return NlIruoyWhocooksRecipesV0UnionsRecipeEvent._(
        factory.third(recipeDeleted));
  }

  static const Triplet<
          NlIruoyWhocooksRecipesV0ModelsRecipeInserted,
          NlIruoyWhocooksRecipesV0ModelsRecipeUpdated,
          NlIruoyWhocooksRecipesV0ModelsRecipeDeleted> factory =
      Triplet<
          NlIruoyWhocooksRecipesV0ModelsRecipeInserted,
          NlIruoyWhocooksRecipesV0ModelsRecipeUpdated,
          NlIruoyWhocooksRecipesV0ModelsRecipeDeleted>();

  dynamic toJson() {
    return join((first) {
      return {'recipe_inserted': first.toJson()};
    }, (second) {
      return {'recipe_updated': second.toJson()};
    }, (third) {
      return {'recipe_deleted': third.toJson()};
    });
  }
}

typedef Ingredient = NlIruoyWhocooksRecipesV0ModelsIngredient;
typedef Recipe = NlIruoyWhocooksRecipesV0ModelsRecipe;
typedef RecipeDeleted = NlIruoyWhocooksRecipesV0ModelsRecipeDeleted;
typedef RecipeForm = NlIruoyWhocooksRecipesV0ModelsRecipeForm;
typedef RecipeInserted = NlIruoyWhocooksRecipesV0ModelsRecipeInserted;
typedef RecipeUpdated = NlIruoyWhocooksRecipesV0ModelsRecipeUpdated;
typedef RecipeEvent = NlIruoyWhocooksRecipesV0UnionsRecipeEvent;
