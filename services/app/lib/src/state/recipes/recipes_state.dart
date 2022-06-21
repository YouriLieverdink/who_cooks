part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object?> get props => [];
}

class RecipesInitial extends RecipesState {
  const RecipesInitial();
}

class RecipesLoading extends RecipesState {
  const RecipesLoading();
}

class RecipesLoaded extends RecipesState {
  const RecipesLoaded({
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  List<Object?> get props => [recipes];
}

class RecipesNotLoaded extends RecipesState {
  const RecipesNotLoaded({
    required this.error,
  });

  final NlIruoyCommonModelsError error;

  @override
  List<Object?> get props => [error];
}
