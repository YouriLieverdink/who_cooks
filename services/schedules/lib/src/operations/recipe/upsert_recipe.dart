import 'package:schedules/schedules.dart';

class CreateUpsertRecipe {
  //
  const CreateUpsertRecipe(
    this.dao,
  );

  final NlIruoyWhocooksScheduleDao dao;

  Future<void> call(
    NlIruoyWhocooksRecipesV0ModelsRecipeUpserted event,
  ) async {
    //
    if (event.previous == null) {
      // The recipe was added, no need to walk through the schedules.
      return;
    }

    final schedules = await dao.get(recipe: event.previous);

    if (schedules.isEmpty) {
      // No schedules were found where the recipe should be updated.
      return;
    }

    await Future.wait([
      ...schedules.map((schedule) {
        //
        final recipes = schedule.recipes //
            .map((v) => v.id == event.previous!.id ? event.current : v)
            .toList();

        final form = ScheduleForm(
          date: schedule.date,
          days: schedule.days,
          recipes: recipes,
        );

        return dao.updateById(form, id: schedule.id);
      }),
    ]);
  }
}
