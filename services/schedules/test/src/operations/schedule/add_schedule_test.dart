import 'package:mockito/mockito.dart';
import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

final scheduleForm = ScheduleForm(
  date: DateTime(2022),
  days: [],
  recipes: [],
);

final schedule = Schedule(
  id: id,
  date: DateTime(2022),
  days: [],
  recipes: [],
);

void main() {
  late ScheduleDao dao;
  late CreateAddSchedule addSchedule;

  setUp(() {
    dao = MockScheduleDao();
    addSchedule = CreateAddSchedule(dao);

    when(dao.insert(scheduleForm)).thenAnswer((_) => Future.value(schedule));
  });

  group('AddSchedule', () {
    test(
      'calls dao.insert with the correct parameters',
      () async {
        await addSchedule(scheduleForm);

        verify(dao.insert(scheduleForm)).called(1);
      },
    );
  });
}
