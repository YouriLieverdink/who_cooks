import 'package:schedules/schedules.dart';

class CreateAddSchedule {
  //
  const CreateAddSchedule(
    this.dao,
  );

  final ScheduleDao dao;

  Future<Schedule> call(
    ScheduleForm scheduleForm,
  ) async {
    //
    return dao.insert(scheduleForm);
  }
}
