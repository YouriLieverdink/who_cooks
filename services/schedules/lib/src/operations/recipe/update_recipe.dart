import 'package:schedules/schedules.dart';

class CreateUpdateRecipe {
  //
  const CreateUpdateRecipe(
    this.dao,
  );

  final ScheduleDao dao;

  Future<void> call(
    NlIruoyWhocooksRecipesV0ModelsRecipeUpdated event,
  ) async {
    //
    final schedules = await dao.get(recipes: [event.recipe]);

    if (schedules.isEmpty) {
      // No schedules were found where the recipe should be updated.
      return;
    }

    await Future.wait([
      ...schedules.map((schedule) {
        //
        final recipes = schedule.recipes //
            .map((v) => v.id == event.recipe.id ? event.recipe : v)
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
