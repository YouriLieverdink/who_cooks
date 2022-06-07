part './rules/is_a.dart';
part './rules/required.dart';

abstract class Rule {
  const Rule();

  String? validate(
    dynamic value, [
    String name = 'value',
  ]);
}
