import 'package:recipes/recipes.dart';

class CreateRemoveRecipe {
  //
  const CreateRemoveRecipe({
    required this.dao,
    required this.showRecipe,
  });

  final NlIruoyWhocooksRecipeDao dao;

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
    // final event = RecipeDeleted(
    //   id: ObjectId().$oid,
    //   timestamp: DateTime.now(),
    //   recipe: recipe,
    // );

    // final queue = await connect<Queue>();
    // await queue.add(RecipeEvent.fromSecond(event));
  }
}
