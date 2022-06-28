import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../di.dart';
import '../../../../../generated/generated.dart';

part 'recipe_search_event.dart';
part 'recipe_search_state.dart';

class RecipeSearchBloc extends Bloc<RecipeSearchEvent, RecipeSearchState> {
  ///
  static const debounce = Duration(milliseconds: 512);

  RecipeSearchBloc({
    required this.repository,
  }) : super(const RecipeSearchInitial()) {
    //
    on<SearchRecipes>(
      _onSearchRecipes,
      transformer: (e, m) => e.debounceTime(debounce).switchMap(m),
    );
  }

  final Repository repository;

  Future<void> _onSearchRecipes(
    SearchRecipes event,
    Emitter<RecipeSearchState> emit,
  ) async {
    //
    if (event.title.isEmpty) {
      return emit(const RecipeSearchInitial());
    }

    try {
      emit(const RecipeSearchLoading());

      final recipes = await repository.recipes.recipes.get(
        title: event.title,
      );

      emit(RecipeSearchLoaded(recipes: recipes));
    } //
    catch (_) {
      emit(const RecipeSearchNotLoaded());
    }
  }
}
