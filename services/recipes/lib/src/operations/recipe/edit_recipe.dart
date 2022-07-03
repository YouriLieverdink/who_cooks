import 'package:recipes/recipes.dart';

class CreateEditRecipe {
  //
  const CreateEditRecipe(
    this.dao,
    this.showRecipe,
    this.connectQueue,
  );

  final RecipeDao dao;

  final Future<Recipe> Function({required String id}) showRecipe;

  final Future<Queue> Function() connectQueue;

  Future<Recipe> call(
    RecipeForm recipeForm, {
    required String id,
  }) async {
    //
    await showRecipe(id: id);

    final data = await dao.updateById(recipeForm, id: id);

    await _publish(data);

    return data;
  }

  Future<void> _publish(
    Recipe recipe,
  ) async {
    //
    final event = RecipeUpdated(
      id: ObjectId().$oid,
      timestamp: DateTime.now(),
      recipe: recipe,
    );

    final queue = await connectQueue();
    await queue.add(RecipeEvent.fromSecond(event));
  }
}
