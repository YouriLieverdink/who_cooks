import 'package:recipes/recipes.dart';

class CreateAddRecipe {
  //
  const CreateAddRecipe(
    this.dao,
    this.connectQueue,
  );

  final RecipeDao dao;

  final Future<Queue> Function() connectQueue;

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
    final event = RecipeInserted(
      id: ObjectId().$oid,
      timestamp: DateTime.now(),
      recipe: recipe,
    );

    final queue = await connectQueue();
    await queue.add(RecipeEvent.fromFirst(event));
  }
}
