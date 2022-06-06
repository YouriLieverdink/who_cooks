import 'package:collection/collection.dart';

import './rules/rules.dart';

Map<String, List<String>> validate(
  Map<String, dynamic> value,
  Map<String, List<Rule>> rules,
) {
  //
  final errors = <String, List<String>>{};

  for (final field in value.entries) {
    //
    final _rules = rules[field.key] ?? [];

    final _errors = _rules //
        .map((r) => r.validate(field.value, field.key))
        .whereNotNull()
        .toList();

    if (_errors.isNotEmpty) {
      errors.putIfAbsent(field.key, () => _errors);
    }
  }

  return errors;
}
