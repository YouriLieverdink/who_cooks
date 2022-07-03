import 'package:recipes/recipes.dart';

class CreateRemoveRecipe {
  //
  const CreateRemoveRecipe(
    this.dao,
    this.showRecipe,
    this.connectQueue,
  );

  final RecipeDao dao;

  final Future<Recipe> Function({required String id}) showRecipe;

  final Future<Queue> Function() connectQueue;

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

    final queue = await connectQueue();
    await queue.add(RecipeEvent.fromThird(event));
  }
}
