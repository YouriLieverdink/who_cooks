import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../generated/generated.dart';
import '../../services/services.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  /// The repository to use.
  final Repository repository;

  RecipesBloc({
    required this.repository,
  }) : super(const RecipesInitial()) {
    on<_Failure>(_onFailure);
    on<LoadRecipes>(_onLoadRecipes);
  }

  void _onFailure(
    _Failure event,
    Emitter<RecipesState> emit,
  ) {
    var error = event.error;

    if (error is NlIruoyCommonV0ModelsError) {
      return emit(RecipesNotLoaded(error: error));
    }

    error = const NlIruoyCommonV0ModelsError(
      code: 'unknown',
      message: 'An unknown error occured.',
    );

    emit(RecipesNotLoaded(error: error));
  }

  void _onLoadRecipes(
    LoadRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    emit(const RecipesLoading());

    try {
      final recipes = await repository.client.recipes.get(
        skip: event.skip,
        limit: event.limit,
      );

      emit(RecipesLoaded(recipes: recipes));
    } //
    catch (e) {
      add(_Failure(error: e));
    }
  }
}
