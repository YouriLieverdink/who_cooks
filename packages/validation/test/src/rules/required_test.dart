import 'package:test/test.dart';
import 'package:validation/validation.dart';

void main() {
  const dynamic invalid = null;
  const dynamic valid = 'valid';

  group(
    'RequiredRule',
    () {
      test(
        'returns an error message when the value is invalid',
        () {
          final rule = RequiredRule();

          expect(
            rule.validate(invalid),
            isNot(equals(null)),
          );
        },
      );

      test(
        'returns null when the value is valid',
        () {
          final rule = RequiredRule();

          expect(
            rule.validate(valid),
            equals(null),
          );
        },
      );
    },
  );
}
