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
  late CreateShowSchedule showSchedule;
  late CreateRemoveSchedule removeSchedule;

  setUp(() {
    dao = MockScheduleDao();
    showSchedule = CreateShowSchedule(dao);
    removeSchedule = CreateRemoveSchedule(dao, showSchedule);

    when(dao.getById(id: id)) //
        .thenAnswer((_) => Future.value(schedule));

    when(dao.deleteById(id: id)) //
        .thenAnswer((_) => Future.value());
  });

  group('RemoveSchedule', () {
    test(
      'throws when the schedule was not found',
      () {
        when(dao.getById(id: id)).thenAnswer((_) => Future.value());

        expect(
          removeSchedule(id: id),
          throwsA(isA<NlIruoyCommonV0ModelsError>()),
        );
      },
    );

    test(
      'does not throw when the schedule was found',
      () {
        expect(
          removeSchedule(id: id),
          completes,
        );
      },
    );

    test(
      'calls dao.deleteById with the correct parameters',
      () async {
        await removeSchedule(id: id);

        verify(dao.deleteById(id: id)).called(1);
      },
    );
  });
}
