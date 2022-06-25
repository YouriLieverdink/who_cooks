import 'package:schedules/schedules.dart';

class CreateRemoveSchedule {
  //
  const CreateRemoveSchedule({
    required this.dao,
    required this.showSchedule,
  });

  final NlIruoyWhocooksScheduleDao dao;

  final Future<Schedule> Function({required String id}) showSchedule;

  Future<void> call({
    required String id,
  }) async {
    //
    await showSchedule(id: id);

    await dao.deleteById(id: id);
  }
}
