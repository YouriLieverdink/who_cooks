import 'package:recipes/recipes.dart';

class CreateListRecipes {
  //
  const CreateListRecipes(
    this.dao,
  );

  final NlIruoyWhocooksRecipeDao dao;

  Future<List<Recipe>> call({
    int? limit,
    int? skip,
  }) async {
    //
    return dao.get(limit: limit, skip: skip);
  }
}
