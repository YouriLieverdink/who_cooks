import './abstract.dart';

class StringRule extends Rule {
  @override
  String? validate(
    value, [
    String name = 'value',
  ]) {
    if (value is! String) {
      return 'The $name must a String';
    }

    return null;
  }
}
