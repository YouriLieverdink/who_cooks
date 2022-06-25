import 'package:recipes/recipes.dart';

class RecipeDao extends NlIruoyWhocooksRecipeDao {
  RecipeDao() : super(connect: $.getAsync);
}
