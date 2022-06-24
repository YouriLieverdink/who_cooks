import 'package:recipes/recipes.dart';

class CreateShowRecipe {
  //
  const CreateShowRecipe({
    required this.dao,
  });

  final NlIruoyWhocooksRecipeDao dao;

  Future<Recipe> call({
    required String id,
  }) async {
    //
    final data = await dao.getById(id: id);

    if (data == null) {
      throw NotFoundException();
    }

    return data;
  }
}
