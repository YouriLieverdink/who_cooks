import 'package:test/test.dart';
import 'package:validation/validation.dart';

void main() {
  group(
    'IsA',
    () {
      test(
        'returns `null` when the type matches the type parameter',
        () {
          expect(
            IsA<String>().validate(''),
            equals(null),
          );
        },
      );

      test(
        'does not return `null` when the type does not match the type parameter',
        () {
          expect(
            IsA<String>().validate(0),
            isNot(equals(null)),
          );
        },
      );

      group(
        'String',
        () {
          test(
            'return a validation error when the value is not of type string',
            () {
              expect(
                IsA<String>().validate(0),
                equals(isNot(null)),
              );
            },
          );
        },
      );
    },
  );
}
