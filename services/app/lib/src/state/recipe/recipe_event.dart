part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class ListRecipes extends RecipeEvent {
  const ListRecipes();
}

class AddRecipe extends RecipeEvent {
  const AddRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

class EditRecipe extends RecipeEvent {
  const EditRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

class RemoveRecipe extends RecipeEvent {
  const RemoveRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}
