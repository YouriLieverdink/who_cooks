part of 'recipe_search_bloc.dart';

abstract class RecipeSearchState extends Equatable {
  const RecipeSearchState();

  @override
  List<Object?> get props => [];
}

class RecipeSearchInitial extends RecipeSearchState {
  const RecipeSearchInitial();
}

class RecipeSearchLoading extends RecipeSearchState {
  const RecipeSearchLoading();
}

class RecipeSearchLoaded extends RecipeSearchState {
  const RecipeSearchLoaded({
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  List<Object?> get props => [recipes];
}

class RecipeSearchNotLoaded extends RecipeSearchState {
  const RecipeSearchNotLoaded();
}
