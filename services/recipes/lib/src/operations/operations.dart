import 'package:recipes/recipes.dart';

import './healthcheck/show_healthcheck.dart';
import './recipe/add_recipe.dart';
import './recipe/edit_recipe.dart';
import './recipe/list_recipes.dart';
import './recipe/remove_recipe.dart';
import './recipe/show_recipe.dart';

final dao = NlIruoyWhocooksRecipeDao(connect: $.getAsync);

final showHealthcheck = CreateShowHealthcheck();

final showRecipe = CreateShowRecipe(dao);
final addRecipe = CreateAddRecipe(dao);
final editRecipe = CreateEditRecipe(dao, showRecipe);
final removeRecipe = CreateRemoveRecipe(dao, showRecipe);
final listRecipes = CreateListRecipes(dao);
