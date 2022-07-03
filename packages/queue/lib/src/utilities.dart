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
      .containsKey(const Symbol('toJson'));
}

T? fromJson<T>(
  dynamic value,
) {
  //
  try {
    final mirror = reflectClass(T);

    final result = mirror.newInstance(const Symbol('fromJson'), [value]);

    return result.reflectee as T;
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

    final result = mirror.invoke(const Symbol('toJson'), []);

    return result.reflectee as Map<String, dynamic>;
  } //
  catch (_) {
    return null;
  }
}
