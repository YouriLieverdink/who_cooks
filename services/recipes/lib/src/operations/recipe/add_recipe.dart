import 'package:recipes/recipes.dart';

class CreateAddRecipe {
  //
  const CreateAddRecipe(
    this.dao,
  );

  final RecipeDao dao;

  Future<Recipe> call(
    RecipeForm recipeForm,
  ) async {
    //
    final data = await dao.insert(recipeForm);

    await _publish(data);

    return data;
  }

  Future<void> _publish(
    Recipe recipe,
  ) async {
    //
    final event = RecipeUpserted(
      id: ObjectId().$oid,
      timestamp: DateTime.now(),
      current: recipe,
    );

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromFirst(event));
  }
}
