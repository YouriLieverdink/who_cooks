import 'package:recipes/recipes.dart';

export './healthcheck/show_healthcheck.dart';
export './recipe/add_recipe.dart';
export './recipe/edit_recipe.dart';
export './recipe/list_recipes.dart';
export './recipe/remove_recipe.dart';
export './recipe/show_recipe.dart';

final dao = RecipeDao();

final showHealthcheck = CreateShowHealthcheck($.getAsync, $.getAsync);

final showRecipe = CreateShowRecipe(dao);
final addRecipe = CreateAddRecipe(dao, $.getAsync);
final editRecipe = CreateEditRecipe(dao, showRecipe, $.getAsync);
final removeRecipe = CreateRemoveRecipe(dao, showRecipe, $.getAsync);
final listRecipes = CreateListRecipes(dao);
