import 'package:queue/queue.dart';
import 'package:test/test.dart';

class One {
  const One();
}

class Two {
  const Two();

  factory Two.fromJson(dynamic json) => Two();

  dynamic toJson() => {};
}

class User {
  const User(this.name);

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String);
  }

  final String name;

  dynamic toJson() {
    return {'name': name};
  }
}

void main() {
  const one = One();
  const two = Two();
  const user = User('Youri');

  group('Queue', () {
    late Queue events;

    setUp(() {
      events = Queue('0.0.0.0');
    });

    tearDown(() async {
      await Future.delayed(const Duration(milliseconds: 256));
      await events.close();
    });

    test('creates an instance internally when not provided', () {
      expect(
        () => Queue('0.0.0.0'),
        isNot(throwsException),
      );
    });

    group(
      'on',
      () {
        test(
          'throws when the provided type does not have `fromJson`',
          () {
            expect(
              () => events.on<One>((_) => {}),
              throwsException,
            );
          },
        );

        test(
          'does not throw when the provided type has `fromJson`',
          () {
            expect(
              () => events.on<Two>((_) => {}),
              returnsNormally,
            );
          },
        );
      },
    );

    group(
      'add',
      () {
        test(
          'throws when the provided type does not have `toJson`',
          () {
            expect(
              () async => events.add(one),
              throwsException,
            );
          },
        );

        test(
          'does not throw when the provided type has `toJson`',
          () {
            expect(
              () async => events.add(two),
              returnsNormally,
            );
          },
        );
      },
    );
  });
}
