import 'package:schedules/schedules.dart';

class CreateEditSchedule {
  //
  const CreateEditSchedule({
    required this.dao,
    required this.showSchedule,
  });

  final NlIruoyWhocooksScheduleDao dao;

  final Future<Schedule> Function({required String id}) showSchedule;

  Future<Schedule> call(
    ScheduleForm recipeForm, {
    required String id,
  }) async {
    //
    await showSchedule(id: id);

    return dao.putById(recipeForm, id: id);
  }
}
