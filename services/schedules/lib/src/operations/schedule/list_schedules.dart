import 'package:schedules/schedules.dart';

class CreateListSchedules {
  //
  const CreateListSchedules(
    this.dao,
  );

  final NlIruoyWhocooksScheduleDao dao;

  Future<List<Schedule>> call({
    List<String>? ids,
    NlIruoyWhocooksRecipesV0ModelsRecipe? recipe,
    int? limit,
    int? skip,
  }) async {
    //
    return dao.get(ids: ids, recipe: recipe, limit: limit, skip: skip);
  }
}
