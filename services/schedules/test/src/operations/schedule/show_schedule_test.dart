import 'package:mockito/mockito.dart';
import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

final schedule = Schedule(
  id: id,
  date: DateTime(2022),
  days: [],
  recipes: [],
);

void main() {
  late ScheduleDao dao;
  late CreateShowSchedule showSchedule;

  setUp(() {
    dao = MockScheduleDao();
    showSchedule = CreateShowSchedule(dao);

    when(dao.getById(id: id)) //
        .thenAnswer((_) => Future.value(schedule));
  });

  group('ShowSchedule', () {
    test(
      'throws when the schedule was not found',
      () {
        when(dao.getById(id: id)).thenAnswer((_) => Future.value(null));

        expect(
          showSchedule(id: id),
          throwsA(isA<NlIruoyCommonV0ModelsError>()),
        );
      },
    );

    test(
      'does not throw when the schedule was found',
      () {
        expect(
          showSchedule(id: id),
          completes,
        );
      },
    );

    test(
      'calls dao.getById with the correct parameters',
      () async {
        await showSchedule(id: id);

        verify(dao.getById(id: id)).called(1);
      },
    );
  });
}
