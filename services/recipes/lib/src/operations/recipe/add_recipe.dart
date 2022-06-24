import 'package:recipes/recipes.dart';

class CreateAddRecipe {
  //
  const CreateAddRecipe({
    required this.dao,
    required this.connect,
  });

  final NlIruoyWhocooksRecipeDao dao;

  final Future<T> Function<T>() connect;

  Future<Recipe> call(
    RecipeForm recipeForm,
  ) async {
    //
    final data = await dao.post(recipeForm);

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
      recipe: recipe,
    );

    final queue = await connect<Queue>();
    await queue.add(RecipeEvent.fromFirst(event));
  }
}
