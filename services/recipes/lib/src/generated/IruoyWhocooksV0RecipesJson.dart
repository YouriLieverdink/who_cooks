import 'package:equatable/equatable.dart';

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
