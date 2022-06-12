import 'package:app/config/config.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:collection/collection.dart';

import '../../../../../generated/IruoyWhocooksRecipesV0Client.dart';
import '../../../../../generated/IruoyWhocooksRecipesV0Json.dart';
import '../../../../../state/state.dart';
import '../../add_edit.dart';

part 'add_edit_state.dart';

class AddEditCubit extends Cubit<AddEditState> {
  /// The global recipe state.
  final RecipeBloc recipeBloc;

  /// The client used to communicate with the recieps service.
  late final IruoyWhocooksRecipesV0Client _client;

  /// The recipe that is being edited, or null when the user is adding.
  late final Recipe? _recipe;

  AddEditCubit({
    required this.recipeBloc,
    Recipe? recipe,
  }) : super(const AddEditState()) {
    //
    _client = IruoyWhocooksRecipesV0Client(
      client: $.get<Client>(),
      baseUrl: baseUrl,
    );

    _recipe = recipe;

    // Emit the initial state when the recipe is not null.
    if (recipe != null) {
      emit(AddEditState(
        title: TitleInput.dirty(value: recipe.title),
        photoUrl: recipe.photoUrl,
        description: recipe.description,
        ingredients: recipe.ingredients //
            .map((v) => IngredientInput.dirty(value: v))
            .toList(),
        status: FormzStatus.pure,
      ));
    }
  }

  void setTitle(String value) {
    final title = TitleInput.dirty(value: value);

    emit(state.copyWith(
      title: title,
      status: Formz.validate([title, ...state.ingredients]),
    ));
  }

  void setPhotoUrl(String value) {
    emit(state.copyWith(photoUrl: value));
  }

  void setDescription(String value) {
    emit(state.copyWith(description: value));
  }

  void addIngredient() {
    emit(state.copyWith(
      ingredients: [...state.ingredients, const IngredientInput.pure()],
    ));
  }

  void editIngredient(String value, {required int index}) {
    final ingredient = IngredientInput.dirty(value: value);

    final ingredients = state.ingredients //
        .mapIndexed((i, v) => i == index ? ingredient : v)
        .toList();

    emit(state.copyWith(
      ingredients: ingredients,
      status: Formz.validate([state.title, ...ingredients]),
    ));
  }

  void removeIngredient({required int index}) {
    final ingredients = state.ingredients //
        .whereIndexed((i, _) => i != index)
        .toList();

    emit(state.copyWith(
      ingredients: ingredients,
      status: Formz.validate([state.title, ...ingredients]),
    ));
  }

  Future<void> addEdit() async {
    if (state.status.isInvalid) return;

    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final form = RecipeForm(
        title: state.title.value,
        photoUrl: state.photoUrl,
        description: state.description,
        ingredients: state.ingredients.map((v) => v.value).toList(),
      );

      if (_recipe != null) {
        //
        final r = await _client.recipes.putById(form, id: _recipe!.id);

        recipeBloc.add(EditRecipe(r));
      } //
      else {
        //
        final r = await _client.recipes.post(form);

        recipeBloc.add(AddRecipe(r));
      }

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } //
    catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> remove() async {
    if (_recipe == null) {
      // We emit this state to automatically navigate back the user.
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return;
    }

    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await _client.recipes.deleteById(id: _recipe!.id);

      recipeBloc.add(RemoveRecipe(_recipe!));

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } //
    catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    _client.client.close();

    return super.close();
  }
}
