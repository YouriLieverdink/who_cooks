import 'package:recipes/recipes.dart';

class CreateShowRecipe {
  //
  const CreateShowRecipe(
    this.dao,
  );

  final NlIruoyWhocooksRecipeDao dao;

  Future<Recipe> call({
    required String id,
  }) async {
    //
    final data = await dao.getById(id: id);

    if (data == null) {
      throw NlIruoyCommonV0ModelsError(
        code: 'not-found',
        message: 'The recipe with id: $id has not been found.',
      );
    }

    return data;
  }
}
