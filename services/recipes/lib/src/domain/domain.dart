import 'package:recipes/recipes.dart';

class RecipeDao extends NlIruoyWhocooksRecipesV0ModelsRecipeDao {
  RecipeDao() : super(connect: $.getAsync);
}
