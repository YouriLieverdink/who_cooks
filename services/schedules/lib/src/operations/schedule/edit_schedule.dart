import 'package:schedules/schedules.dart';

class CreateEditSchedule {
  //
  const CreateEditSchedule(
    this.dao,
    this.showSchedule,
  );

  final ScheduleDao dao;

  final Future<Schedule> Function({required String id}) showSchedule;

  Future<Schedule> call(
    ScheduleForm scheduleForm, {
    required String id,
  }) async {
    //
    await showSchedule(id: id);

    return dao.updateById(scheduleForm, id: id);
  }
}
