import 'dart:mirrors';

bool hasFromJson<T>() {
  //
  final mirror = reflectClass(T);

  return mirror //
      .declarations
      .containsKey(Symbol('$T.fromJson'));
}

bool hasToJson<T>() {
  //
  final mirror = reflectClass(T);

  return mirror //
      .declarations
      .containsKey(Symbol('toJson'));
}

T? fromJson<T>(
  dynamic value,
) {
  //
  try {
    final mirror = reflectClass(T);

    final result = mirror.newInstance(Symbol('fromJson'), [value]);

    return result.reflectee;
  } //
  catch (_) {
    return null;
  }
}

Map<String, dynamic>? toJson<T>(
  T value,
) {
  //
  try {
    final mirror = reflect(value);

    final result = mirror.invoke(Symbol('toJson'), []);

    return result.reflectee;
  } //
  catch (_) {
    return null;
  }
}
