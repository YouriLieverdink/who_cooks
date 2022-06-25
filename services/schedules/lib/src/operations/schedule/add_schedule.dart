import 'package:schedules/schedules.dart';

class CreateAddSchedule {
  //
  const CreateAddSchedule(
    this.dao,
  );

  final NlIruoyWhocooksScheduleDao dao;

  Future<Schedule> call(
    ScheduleForm scheduleForm,
  ) async {
    //
    return dao.post(scheduleForm);
  }
}
