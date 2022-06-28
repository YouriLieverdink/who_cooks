part of 'recipe_search_bloc.dart';

abstract class RecipeSearchEvent extends Equatable {
  const RecipeSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchRecipes extends RecipeSearchEvent {
  const SearchRecipes({
    this.title = '',
  });

  final String title;

  @override
  List<Object?> get props => [title];
}
