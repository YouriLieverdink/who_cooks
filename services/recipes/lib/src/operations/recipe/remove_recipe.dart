import 'package:recipes/recipes.dart';

class CreateRemoveRecipe {
  //
  const CreateRemoveRecipe(
    this.dao,
    this.showRecipe,
  );

  final RecipeDao dao;

  final Future<Recipe> Function({required String id}) showRecipe;

  Future<void> call({
    required String id,
  }) async {
    //
    final data = await showRecipe(id: id);

    await dao.deleteById(id: id);

    await _publish(data);
  }

  Future<void> _publish(
    Recipe recipe,
  ) async {
    //
    final event = RecipeDeleted(
      id: ObjectId().$oid,
      timestamp: DateTime.now(),
      recipe: recipe,
    );

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromThird(event));
  }
}
