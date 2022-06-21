import 'package:equatable/equatable.dart';
import 'package:sealed_unions/sealed_unions.dart';

class NlIruoyWhocooksSchedulesModelsSchedule extends Equatable {
  const NlIruoyWhocooksSchedulesModelsSchedule(
      {required this.id,
      required this.date,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  factory NlIruoyWhocooksSchedulesModelsSchedule.fromJson(dynamic json) {
    return NlIruoyWhocooksSchedulesModelsSchedule(
        id: (json['id'] as String),
        date: DateTime.parse(json['date']),
        monday: json['monday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['monday']),
        tuesday: json['tuesday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['tuesday']),
        wednesday: json['wednesday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['wednesday']),
        thursday: json['thursday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['thursday']),
        friday: json['friday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['friday']),
        saturday: json['saturday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['saturday']),
        sunday: json['sunday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['sunday']));
  }

  final String id;

  final DateTime date;

  final NlIruoyWhocooksRecipesModelsRecipe? monday;

  final NlIruoyWhocooksRecipesModelsRecipe? tuesday;

  final NlIruoyWhocooksRecipesModelsRecipe? wednesday;

  final NlIruoyWhocooksRecipesModelsRecipe? thursday;

  final NlIruoyWhocooksRecipesModelsRecipe? friday;

  final NlIruoyWhocooksRecipesModelsRecipe? saturday;

  final NlIruoyWhocooksRecipesModelsRecipe? sunday;

  dynamic toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'monday': monday?.toJson(),
      'tuesday': tuesday?.toJson(),
      'wednesday': wednesday?.toJson(),
      'thursday': thursday?.toJson(),
      'friday': friday?.toJson(),
      'saturday': saturday?.toJson(),
      'sunday': sunday?.toJson()
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      date,
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday
    ];
  }

  NlIruoyWhocooksSchedulesModelsSchedule copyWith(
      {String? id,
      DateTime? date,
      NlIruoyWhocooksRecipesModelsRecipe? monday,
      NlIruoyWhocooksRecipesModelsRecipe? tuesday,
      NlIruoyWhocooksRecipesModelsRecipe? wednesday,
      NlIruoyWhocooksRecipesModelsRecipe? thursday,
      NlIruoyWhocooksRecipesModelsRecipe? friday,
      NlIruoyWhocooksRecipesModelsRecipe? saturday,
      NlIruoyWhocooksRecipesModelsRecipe? sunday}) {
    return NlIruoyWhocooksSchedulesModelsSchedule(
        id: id ?? this.id,
        date: date ?? this.date,
        monday: monday ?? this.monday,
        tuesday: tuesday ?? this.tuesday,
        wednesday: wednesday ?? this.wednesday,
        thursday: thursday ?? this.thursday,
        friday: friday ?? this.friday,
        saturday: saturday ?? this.saturday,
        sunday: sunday ?? this.sunday);
  }
}

class NlIruoyWhocooksSchedulesModelsScheduleForm extends Equatable {
  const NlIruoyWhocooksSchedulesModelsScheduleForm(
      {required this.date,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  factory NlIruoyWhocooksSchedulesModelsScheduleForm.fromJson(dynamic json) {
    return NlIruoyWhocooksSchedulesModelsScheduleForm(
        date: DateTime.parse(json['date']),
        monday: json['monday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['monday']),
        tuesday: json['tuesday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['tuesday']),
        wednesday: json['wednesday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['wednesday']),
        thursday: json['thursday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['thursday']),
        friday: json['friday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['friday']),
        saturday: json['saturday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['saturday']),
        sunday: json['sunday'] == null
            ? null
            : NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['sunday']));
  }

  final DateTime date;

  final NlIruoyWhocooksRecipesModelsRecipe? monday;

  final NlIruoyWhocooksRecipesModelsRecipe? tuesday;

  final NlIruoyWhocooksRecipesModelsRecipe? wednesday;

  final NlIruoyWhocooksRecipesModelsRecipe? thursday;

  final NlIruoyWhocooksRecipesModelsRecipe? friday;

  final NlIruoyWhocooksRecipesModelsRecipe? saturday;

  final NlIruoyWhocooksRecipesModelsRecipe? sunday;

  dynamic toJson() {
    return {
      'date': date.toIso8601String(),
      'monday': monday?.toJson(),
      'tuesday': tuesday?.toJson(),
      'wednesday': wednesday?.toJson(),
      'thursday': thursday?.toJson(),
      'friday': friday?.toJson(),
      'saturday': saturday?.toJson(),
      'sunday': sunday?.toJson()
    };
  }

  @override
  List<Object?> get props {
    return [
      date,
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday
    ];
  }

  NlIruoyWhocooksSchedulesModelsScheduleForm copyWith(
      {DateTime? date,
      NlIruoyWhocooksRecipesModelsRecipe? monday,
      NlIruoyWhocooksRecipesModelsRecipe? tuesday,
      NlIruoyWhocooksRecipesModelsRecipe? wednesday,
      NlIruoyWhocooksRecipesModelsRecipe? thursday,
      NlIruoyWhocooksRecipesModelsRecipe? friday,
      NlIruoyWhocooksRecipesModelsRecipe? saturday,
      NlIruoyWhocooksRecipesModelsRecipe? sunday}) {
    return NlIruoyWhocooksSchedulesModelsScheduleForm(
        date: date ?? this.date,
        monday: monday ?? this.monday,
        tuesday: tuesday ?? this.tuesday,
        wednesday: wednesday ?? this.wednesday,
        thursday: thursday ?? this.thursday,
        friday: friday ?? this.friday,
        saturday: saturday ?? this.saturday,
        sunday: sunday ?? this.sunday);
  }
}

class NlIruoyWhocooksRecipesModelsIngredient extends Equatable {
  const NlIruoyWhocooksRecipesModelsIngredient(
      {required this.title, required this.amount, this.unit});

  factory NlIruoyWhocooksRecipesModelsIngredient.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesModelsIngredient(
        title: (json['title'] as String),
        amount: json['amount'],
        unit: (json['unit'] as String?));
  }

  final String title;

  final num amount;

  final String? unit;

  dynamic toJson() {
    return {'title': title, 'amount': amount, 'unit': unit};
  }

  @override
  List<Object?> get props {
    return [title, amount, unit];
  }

  NlIruoyWhocooksRecipesModelsIngredient copyWith(
      {String? title, num? amount, String? unit}) {
    return NlIruoyWhocooksRecipesModelsIngredient(
        title: title ?? this.title,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit);
  }
}

class NlIruoyWhocooksRecipesModelsRecipe extends Equatable {
  const NlIruoyWhocooksRecipesModelsRecipe(
      {required this.id,
      this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksRecipesModelsRecipe.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesModelsRecipe(
        id: (json['id'] as String),
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksRecipesModelsIngredient.fromJson(v))
            .toList());
  }

  final String id;

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksRecipesModelsIngredient> ingredients;

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

  NlIruoyWhocooksRecipesModelsRecipe copyWith(
      {String? id,
      String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksRecipesModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksRecipesModelsRecipe(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }
}

class NlIruoyWhocooksRecipesModelsRecipeDeleted extends Equatable {
  const NlIruoyWhocooksRecipesModelsRecipeDeleted(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesModelsRecipeDeleted.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesModelsRecipeDeleted(
        id: (json['id'] as String),
        timestamp: DateTime.parse(json['timestamp']),
        recipe: NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['recipe']));
  }

  final String id;

  final DateTime timestamp;

  final NlIruoyWhocooksRecipesModelsRecipe recipe;

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

  NlIruoyWhocooksRecipesModelsRecipeDeleted copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesModelsRecipeDeleted(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        recipe: recipe ?? this.recipe);
  }
}

class NlIruoyWhocooksRecipesModelsRecipeForm extends Equatable {
  const NlIruoyWhocooksRecipesModelsRecipeForm(
      {this.photoUrl,
      required this.title,
      this.description,
      required this.ingredients});

  factory NlIruoyWhocooksRecipesModelsRecipeForm.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesModelsRecipeForm(
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String),
        description: (json['description'] as String?),
        ingredients: (json['ingredients'] as List)
            .map((v) => NlIruoyWhocooksRecipesModelsIngredient.fromJson(v))
            .toList());
  }

  final String? photoUrl;

  final String title;

  final String? description;

  final List<NlIruoyWhocooksRecipesModelsIngredient> ingredients;

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

  NlIruoyWhocooksRecipesModelsRecipeForm copyWith(
      {String? photoUrl,
      String? title,
      String? description,
      List<NlIruoyWhocooksRecipesModelsIngredient>? ingredients}) {
    return NlIruoyWhocooksRecipesModelsRecipeForm(
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients);
  }
}

class NlIruoyWhocooksRecipesModelsRecipeUpserted extends Equatable {
  const NlIruoyWhocooksRecipesModelsRecipeUpserted(
      {required this.id, required this.timestamp, required this.recipe});

  factory NlIruoyWhocooksRecipesModelsRecipeUpserted.fromJson(dynamic json) {
    return NlIruoyWhocooksRecipesModelsRecipeUpserted(
        id: (json['id'] as String),
        timestamp: DateTime.parse(json['timestamp']),
        recipe: NlIruoyWhocooksRecipesModelsRecipe.fromJson(json['recipe']));
  }

  final String id;

  final DateTime timestamp;

  final NlIruoyWhocooksRecipesModelsRecipe recipe;

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

  NlIruoyWhocooksRecipesModelsRecipeUpserted copyWith(
      {String? id,
      DateTime? timestamp,
      NlIruoyWhocooksRecipesModelsRecipe? recipe}) {
    return NlIruoyWhocooksRecipesModelsRecipeUpserted(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        recipe: recipe ?? this.recipe);
  }
}

class NlIruoyCommonModelsError extends Equatable {
  const NlIruoyCommonModelsError({required this.code, required this.message});

  factory NlIruoyCommonModelsError.fromJson(dynamic json) {
    return NlIruoyCommonModelsError(
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

  NlIruoyCommonModelsError copyWith({String? code, String? message}) {
    return NlIruoyCommonModelsError(
        code: code ?? this.code, message: message ?? this.message);
  }
}

class NlIruoyCommonModelsHealthcheck extends Equatable {
  const NlIruoyCommonModelsHealthcheck(
      {required this.status, required this.version});

  factory NlIruoyCommonModelsHealthcheck.fromJson(dynamic json) {
    return NlIruoyCommonModelsHealthcheck(
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

  NlIruoyCommonModelsHealthcheck copyWith({String? status, String? version}) {
    return NlIruoyCommonModelsHealthcheck(
        status: status ?? this.status, version: version ?? this.version);
  }
}

class NlIruoyWhocooksRecipesUnionsRecipeEvent extends Union2Impl<
    NlIruoyWhocooksRecipesModelsRecipeUpserted,
    NlIruoyWhocooksRecipesModelsRecipeDeleted> {
  NlIruoyWhocooksRecipesUnionsRecipeEvent._(
      Union2<NlIruoyWhocooksRecipesModelsRecipeUpserted,
              NlIruoyWhocooksRecipesModelsRecipeDeleted>
          union)
      : super(union);

  factory NlIruoyWhocooksRecipesUnionsRecipeEvent.fromJson(dynamic json) {
    final discriminator = (json as Map).keys.first;

    switch (discriminator) {
      case 'recipe_upserted':
        return NlIruoyWhocooksRecipesUnionsRecipeEvent._(
            factory.first(json['recipe_upserted']));
      case 'recipe_deleted':
        return NlIruoyWhocooksRecipesUnionsRecipeEvent._(
            factory.second(json['recipe_deleted']));
      default:
        throw Exception([
          discriminator,
          'Unsupported type: $discriminator, expected: recipe_upserted, recipe_deleted.'
        ]);
    }
  }

  static final Doublet<NlIruoyWhocooksRecipesModelsRecipeUpserted,
          NlIruoyWhocooksRecipesModelsRecipeDeleted> factory =
      const Doublet<NlIruoyWhocooksRecipesModelsRecipeUpserted,
          NlIruoyWhocooksRecipesModelsRecipeDeleted>();

  dynamic toJson() {
    return join((first) {
      return {'recipe_upserted': first};
    }, (second) {
      return {'recipe_deleted': second};
    });
  }
}

typedef Schedule = NlIruoyWhocooksSchedulesModelsSchedule;
typedef ScheduleForm = NlIruoyWhocooksSchedulesModelsScheduleForm;
