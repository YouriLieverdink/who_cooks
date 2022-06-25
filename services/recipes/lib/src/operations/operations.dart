import 'package:recipes/recipes.dart';

import './healthcheck/show_healthcheck.dart';
import './recipe/add_recipe.dart';
import './recipe/edit_recipe.dart';
import './recipe/list_recipes.dart';
import './recipe/remove_recipe.dart';
import './recipe/show_recipe.dart';

// Dependencies.
final recipeDao = NlIruoyWhocooksRecipeDao(connect: $.getAsync);

final showHealthcheck = CreateShowHealthcheck();

final showRecipe = CreateShowRecipe(dao: recipeDao);
final addRecipe = CreateAddRecipe(dao: recipeDao);
final editRecipe = CreateEditRecipe(dao: recipeDao, showRecipe: showRecipe);
final removeRecipe = CreateRemoveRecipe(dao: recipeDao, showRecipe: showRecipe);
final listRecipes = CreateListRecipes(dao: recipeDao);
