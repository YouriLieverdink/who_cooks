import 'package:test/test.dart';
import 'package:validation/validation.dart';

void main() {
  const dynamic invalid = 42;
  const dynamic valid = 'valid';

  group(
    'StringRule',
    () {
      test(
        'returns an error message when the value is invalid',
        () {
          final rule = StringRule();

          expect(
            rule.validate(invalid),
            isNot(equals(null)),
          );
        },
      );

      test(
        'returns null when the value is valid',
        () {
          final rule = StringRule();

          expect(
            rule.validate(valid),
            equals(null),
          );
        },
      );
    },
  );
}
