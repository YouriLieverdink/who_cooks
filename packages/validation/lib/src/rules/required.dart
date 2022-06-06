import './abstract.dart';

class RequiredRule extends Rule {
  @override
  String? validate(
    value, [
    String name = 'value',
  ]) {
    if (value == null) {
      return 'The $name is required';
    }

    return null;
  }
}
