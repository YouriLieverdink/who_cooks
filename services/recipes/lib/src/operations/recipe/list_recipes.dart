import 'package:recipes/recipes.dart';

class CreateListRecipes {
  //
  const CreateListRecipes(
    this.dao,
  );

  final NlIruoyWhocooksRecipeDao dao;

  Future<List<Recipe>> call({
    List<String>? ids,
    String? title,
    int? limit,
    int? skip,
  }) async {
    //
    return dao.get(ids: ids, title: title, limit: limit, skip: skip);
  }
}
