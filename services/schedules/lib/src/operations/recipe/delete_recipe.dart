import 'package:schedules/schedules.dart';

class CreateDeleteRecipe {
  //
  const CreateDeleteRecipe(
    this.dao,
  );

  final ScheduleDao dao;

  Future<void> call(
    NlIruoyWhocooksRecipesV0ModelsRecipeDeleted event,
  ) async {
    //
    final schedules = await dao.get(recipes: [event.recipe]);

    if (schedules.isEmpty) {
      // No schedules were found where the recipe should be removed.
      return;
    }

    await Future.wait([
      ...schedules.map((schedule) {
        //
        final recipes = schedule.recipes //
            .where((v) => v.id != event.recipe.id)
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
