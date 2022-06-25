import 'package:schedules/schedules.dart';

class CreateListSchedules {
  //
  const CreateListSchedules({
    required this.dao,
  });

  final NlIruoyWhocooksScheduleDao dao;

  Future<List<Schedule>> call({
    int? limit,
    int? skip,
  }) async {
    //
    return dao.get(limit: limit, skip: skip);
  }
}
