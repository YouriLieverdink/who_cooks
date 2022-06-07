import 'package:test/test.dart';
import 'package:validation/validation.dart';

void main() {
  group(
    'Required',
    () {
      test(
        'returns a validation error when the value is `null`',
        () {
          expect(
            Required().validate(null),
            isNot(equals(null)),
          );
        },
      );

      test(
        'returns null when the value is not `null`',
        () {
          expect(
            Required().validate('42'),
            equals(null),
          );
        },
      );
    },
  );
}
