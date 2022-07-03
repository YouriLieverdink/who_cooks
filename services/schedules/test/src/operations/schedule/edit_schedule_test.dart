import 'package:mockito/mockito.dart';
import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

final scheduleForm = ScheduleForm(
  date: DateTime(2022),
  days: const [],
  recipes: const [],
);

final schedule = Schedule(
  id: id,
  date: DateTime(2022),
  days: const [],
  recipes: const [],
);

void main() {
  late ScheduleDao dao;
  late CreateShowSchedule showSchedule;
  late CreateEditSchedule editSchedule;

  setUp(() {
    dao = MockScheduleDao();
    showSchedule = CreateShowSchedule(dao);
    editSchedule = CreateEditSchedule(dao, showSchedule);

    when(dao.getById(id: id)) //
        .thenAnswer((_) => Future.value(schedule));

    when(dao.updateById(scheduleForm, id: id)) //
        .thenAnswer((_) => Future.value(schedule));
  });

  group('EditSchedule', () {
    test(
      'throws when the schedule was not found',
      () {
        when(dao.getById(id: id)).thenAnswer((_) => Future.value());

        expect(
          editSchedule(scheduleForm, id: id),
          throwsA(isA<NlIruoyCommonV0ModelsError>()),
        );
      },
    );

    test(
      'does not throw when the schedule was found',
      () {
        expect(
          editSchedule(scheduleForm, id: id),
          completes,
        );
      },
    );

    test(
      'calls dao.updateById with the correct parameters',
      () async {
        await editSchedule(scheduleForm, id: id);

        verify(dao.updateById(scheduleForm, id: id)).called(1);
      },
    );
  });
}
