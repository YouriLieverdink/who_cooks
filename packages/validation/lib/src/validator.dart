import 'package:collection/collection.dart';

import './rule.dart';

class Validator {
  final Map<String, List<Rule>> rules;

  const Validator(
    this.rules,
  );

  Map<String, List<String>> validate(
    Map<String, dynamic> value,
  ) {
    //
    final Map<String, List<String>> errors = {};

    for (final field in rules.entries) {
      //
      final _value = value[field.key] ?? null;

      final _errors = field.value //
          .map((r) => r.validate(_value, field.key))
          .whereNotNull()
          .toList();

      if (_errors.isNotEmpty) {
        errors.putIfAbsent(field.key, () => _errors);
      }
    }

    return errors;
  }
}
