import 'package:schedules/schedules.dart';

class CreateShowSchedule {
  //
  const CreateShowSchedule(
    this.dao,
  );

  final NlIruoyWhocooksScheduleDao dao;

  Future<Schedule> call({
    required String id,
  }) async {
    //
    final data = await dao.getById(id: id);

    if (data == null) {
      throw NlIruoyCommonV0ModelsError(
        code: 'not-found',
        message: 'The recipe with id: $id has not been found.',
      );
    }

    return data;
  }
}
