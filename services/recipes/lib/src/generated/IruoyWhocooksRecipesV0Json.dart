import 'package:equatable/equatable.dart';

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
