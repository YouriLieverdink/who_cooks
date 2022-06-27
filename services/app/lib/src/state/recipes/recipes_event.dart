part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object?> get props => [];
}

class _Failure extends RecipesEvent {
  const _Failure({
    required this.error,
  });

  final Object error;

  @override
  List<Object?> get props => [error];
}

class LoadRecipes extends RecipesEvent {
  const LoadRecipes({
    this.skip = 0,
    this.limit = 100,
  });

  final int skip;

  final int limit;

  @override
  List<Object?> get props => [skip, limit];
}

class AddRecipe extends RecipesEvent {
  const AddRecipe({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

class EditRecipe extends RecipesEvent {
  const EditRecipe({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}
