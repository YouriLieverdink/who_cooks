import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

void main() {
  late Db db;
  late Queue queue;

  Future<Db> connectDb() => Future.value(db);

  Future<Queue> connectQueue() => Future.value(queue);

  setUp(() {
    db = MockDb();
    queue = MockQueue();
  });

  group(
    'ShowHealthcheck',
    () {
      test(
        'throws a generic error when connectDb throws',
        () {
          Future<Db> _connectDb() => throw Exception();

          final operation = CreateShowHealthcheck(_connectDb, connectQueue);

          expect(
            operation(),
            throwsA(isA<NlIruoyCommonV0ModelsError>()),
          );
        },
      );

      test(
        'throws a generic error when connectQueue throws',
        () {
          Future<Queue> _connectQueue() => throw Exception();

          final operation = CreateShowHealthcheck(connectDb, _connectQueue);

          expect(
            operation(),
            throwsA(isA<NlIruoyCommonV0ModelsError>()),
          );
        },
      );

      test(
        'returns healthy when no failures were detected',
        () async {
          final operation = CreateShowHealthcheck(connectDb, connectQueue);

          final data = await operation();

          expect(
            data.status,
            equals('healthy'),
          );
        },
      );
    },
  );
}
