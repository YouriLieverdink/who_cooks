///
abstract class Rule {
  const Rule();

  String? validate(
    dynamic value, [
    String name = 'value',
  ]);
}
