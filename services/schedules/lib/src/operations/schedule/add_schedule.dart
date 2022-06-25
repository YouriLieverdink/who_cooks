import 'package:schedules/schedules.dart';

class CreateAddSchedule {
  //
  const CreateAddSchedule({
    required this.dao,
  });

  final NlIruoyWhocooksScheduleDao dao;

  Future<Schedule> call(
    ScheduleForm recipeForm,
  ) async {
    //
    return dao.post(recipeForm);
  }
}
