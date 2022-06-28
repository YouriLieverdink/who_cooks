import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../generated/generated.dart';
import '../../../../../services/services.dart';
import '../../../../../state/state.dart';

part 'recipe_remove_state.dart';

class RecipeRemoveCubit extends Cubit<RecipeRemoveState> {
  RecipeRemoveCubit({
    required this.recipe,
    required this.repository,
    required this.recipesBloc,
  }) : super(RecipeRemoveState(id: recipe.id));

  final Recipe recipe;

  final Repository repository;

  final RecipesBloc recipesBloc;

  void submit() async {
    //
    emit(state.copyWith(
      submission: FormzStatus.submissionInProgress,
    ));

    try {
      await repository.recipes.recipes.deleteById(id: state.id);

      recipesBloc.add(RemoveRecipe(recipe: recipe));

      emit(state.copyWith(
        submission: FormzStatus.submissionSuccess,
      ));
    } //
    catch (_) {
      emit(state.copyWith(
        submission: FormzStatus.submissionFailure,
      ));
    }
  }
}
