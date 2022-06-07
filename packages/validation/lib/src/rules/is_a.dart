part of '../rule.dart';

class IsA<T> extends Rule {
  @override
  String? validate(
    value, [
    String name = 'value',
  ]) {
    if (value is! T) {
      if (T == String) {
        return 'The $name should be of type string';
      }
    }

    return null;
  }
}
