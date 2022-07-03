import 'package:mockito/mockito.dart';
import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

final schedule = Schedule(
  id: id,
  date: DateTime(2022),
  days: const [],
  recipes: const [],
);

void main() {
  late ScheduleDao dao;
  late CreateListSchedules listSchedules;

  setUp(() {
    dao = MockScheduleDao();
    listSchedules = CreateListSchedules(dao);

    when(dao.get()) //
        .thenAnswer((_) => Future.value([schedule]));
  });

  group(
    'ListSchedules',
    () {
      test(
        'calls dao.insert with the correct parameters',
        () async {
          await listSchedules();

          verify(dao.get()).called(1);
        },
      );
    },
  );
}
