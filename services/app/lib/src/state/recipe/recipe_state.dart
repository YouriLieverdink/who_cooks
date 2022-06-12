part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {
  const RecipeInitial();
}

class RecipeLoading extends RecipeState {
  const RecipeLoading();
}

class RecipeLoaded extends RecipeState {
  const RecipeLoaded(this.recipes);

  final List<Recipe> recipes;

  @override
  List<Object> get props => [recipes];
}

class RecipeNotLoaded extends RecipeState {
  const RecipeNotLoaded(this.error);

  final Error error;

  @override
  List<Object> get props => [error];
}
