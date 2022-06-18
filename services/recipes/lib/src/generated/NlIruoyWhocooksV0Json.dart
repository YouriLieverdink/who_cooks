import 'package:equatable/equatable.dart';

class NlIruoyWhocooksV0ModelsRecipe extends Equatable {
  const NlIruoyWhocooksV0ModelsRecipe(
      {required this.id, this.photoUrl, required this.title});

  factory NlIruoyWhocooksV0ModelsRecipe.fromJson(dynamic json) {
    return NlIruoyWhocooksV0ModelsRecipe(
        id: (json['id'] as String),
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String));
  }

  final String id;

  final String? photoUrl;

  final String title;

  dynamic toJson() {
    return {'id': id, 'photo_url': photoUrl, 'title': title};
  }

  NlIruoyWhocooksV0ModelsRecipe copyWith(
      {String? id, String? photoUrl, String? title}) {
    return NlIruoyWhocooksV0ModelsRecipe(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        title: title ?? this.title);
  }

  @override
  List<Object?> get props {
    return [id, photoUrl, title];
  }
}

class NlIruoyWhocooksV0ModelsRecipeForm extends Equatable {
  const NlIruoyWhocooksV0ModelsRecipeForm({this.photoUrl, required this.title});

  factory NlIruoyWhocooksV0ModelsRecipeForm.fromJson(dynamic json) {
    return NlIruoyWhocooksV0ModelsRecipeForm(
        photoUrl: (json['photo_url'] as String?),
        title: (json['title'] as String));
  }

  final String? photoUrl;

  final String title;

  dynamic toJson() {
    return {'photo_url': photoUrl, 'title': title};
  }

  NlIruoyWhocooksV0ModelsRecipeForm copyWith(
      {String? photoUrl, String? title}) {
    return NlIruoyWhocooksV0ModelsRecipeForm(
        photoUrl: photoUrl ?? this.photoUrl, title: title ?? this.title);
  }

  @override
  List<Object?> get props {
    return [photoUrl, title];
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

typedef Recipe = NlIruoyWhocooksV0ModelsRecipe;
typedef RecipeForm = NlIruoyWhocooksV0ModelsRecipeForm;
