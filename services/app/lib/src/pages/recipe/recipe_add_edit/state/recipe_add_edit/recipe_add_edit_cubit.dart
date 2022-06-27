import 'package:app/src/state/state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../di.dart';
import '../../../../../generated/generated.dart';
import '../../recipe_add_edit.dart';

part 'recipe_add_edit_state.dart';

class RecipeAddEditCubit extends Cubit<RecipeAddEditState> {
  RecipeAddEditCubit({
    Recipe? recipe,
    required RecipesBloc recipesBloc,
    required Repository repository,
  })  : _recipe = recipe,
        _recipesBloc = recipesBloc,
        _repository = repository,
        super(const RecipeAddEditState()) {
    // When a recipe was provided, set the state with it.
    if (recipe != null) {
      emit(RecipeAddEditState(
        title: TitleInput.dirty(value: recipe.title),
        description: recipe.description,
        photoUrl: recipe.photoUrl,
      ));
    }
  }

  final Recipe? _recipe;

  final RecipesBloc _recipesBloc;

  final Repository _repository;

  void setTitle(String value) {
    final title = TitleInput.dirty(value: value);
    emit(state.copyWith(title: title));
  }

  void setDescription(String value) {
    emit(state.copyWith(description: value));
  }

  void setPhotoUrl(String value) {
    emit(state.copyWith(photoUrl: value));
  }

  void submit() async {
    if (!state.status.isValid) return;

    emit(state.copyWith(submission: FormzStatus.submissionInProgress));

    try {
      final form = RecipeForm(
        title: state.title.value,
        description: state.description,
        photoUrl: state.photoUrl,
        ingredients: const [],
      );

      if (_recipe != null) {
        // The recipe is being edited.
        final recipe = await _repository.recipes.recipes.putById(
          form,
          id: _recipe!.id,
        );

        _recipesBloc.add(EditRecipe(recipe: recipe));
      } //
      else {
        // The recipe is being added.
        final recipe = await _repository.recipes.recipes.post(form);

        _recipesBloc.add(AddRecipe(recipe: recipe));
      }

      emit(state.copyWith(submission: FormzStatus.submissionSuccess));
    } //
    catch (_) {
      emit(state.copyWith(submission: FormzStatus.submissionFailure));
    }
  }
}
