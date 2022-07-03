import 'package:queue/queue.dart';
import 'package:test/test.dart';

class One {
  const One(this.title);

  final String title;
}

class Two {
  const Two(this.title);

  // ignore: avoid_unused_constructor_parameters
  factory Two.fromJson(dynamic json) => const Two('Hi!');

  final String title;

  dynamic toJson() {
    return {'title': title};
  }
}

void main() {
  group(
    'hasFromJson',
    () {
      test(
        'returns false when the provided type does not have a `fromJson`',
        () {
          expect(
            hasFromJson<One>(),
            equals(false),
          );
        },
      );

      test(
        'returns true when the provided has a `fromJson`',
        () {
          expect(
            hasFromJson<Two>(),
            equals(true),
          );
        },
      );
    },
  );

  group(
    'hasToJson',
    () {
      test(
        'returns false when the provided type does not have a `hasToJson`',
        () {
          expect(
            hasToJson<One>(),
            equals(false),
          );
        },
      );

      test(
        'returns true when the provided has a `hasToJson`',
        () {
          expect(
            hasToJson<Two>(),
            equals(true),
          );
        },
      );
    },
  );
}
