import 'package:recipes/recipes.dart';

class CreateEditRecipe {
  //
  const CreateEditRecipe(
    this.dao,
    this.showRecipe,
  );

  final RecipeDao dao;

  final Future<Recipe> Function({required String id}) showRecipe;

  Future<Recipe> call(
    RecipeForm recipeForm, {
    required String id,
  }) async {
    //
    final existing = await showRecipe(id: id);

    final data = await dao.updateById(recipeForm, id: id);

    await _publish(existing, data);

    return data;
  }

  Future<void> _publish(
    Recipe previous,
    Recipe current,
  ) async {
    //
    final event = RecipeUpserted(
      id: ObjectId().$oid,
      timestamp: DateTime.now(),
      previous: previous,
      current: current,
    );

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromFirst(event));
  }
}
