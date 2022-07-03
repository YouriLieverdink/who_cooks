import 'package:schedules/schedules.dart';

class CreateListSchedules {
  //
  const CreateListSchedules(
    this.dao,
  );

  final ScheduleDao dao;

  Future<List<Schedule>> call({
    List<String>? ids,
    int? limit,
    int? skip,
  }) async {
    //
    return dao.get(ids: ids, limit: limit, skip: skip);
  }
}
