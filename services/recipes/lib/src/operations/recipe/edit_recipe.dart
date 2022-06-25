import 'package:recipes/recipes.dart';

class CreateEditRecipe {
  //
  const CreateEditRecipe({
    required this.dao,
    required this.showRecipe,
  });

  final NlIruoyWhocooksRecipeDao dao;

  final Future<Recipe> Function({required String id}) showRecipe;

  Future<Recipe> call(
    RecipeForm recipeForm, {
    required String id,
  }) async {
    //
    await showRecipe(id: id);

    final data = await dao.putById(recipeForm, id: id);

    await _publish(data);

    return data;
  }

  Future<void> _publish(
    Recipe recipe,
  ) async {
    //
    // final event = RecipeUpserted(
    //   id: ObjectId().$oid,
    //   timestamp: DateTime.now(),
    //   recipe: recipe,
    // );

    // final queue = await connect<Queue>();
    // await queue.add(RecipeEvent.fromFirst(event));
  }
}
