import 'package:app/config/config.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../generated/IruoyWhocooksRecipesV0Client.dart';
import '../../generated/IruoyWhocooksRecipesV0Json.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  /// The client used to communicate with the recieps service.
  late final IruoyWhocooksRecipesV0Client client;

  RecipeBloc() : super(const RecipeInitial()) {
    //
    client = IruoyWhocooksRecipesV0Client(
      client: $.get<Client>(),
      baseUrl: baseUrl,
    );

    on<ListRecipes>(_onListRecipes);
    on<AddRecipe>(_onAddRecipe);
    on<EditRecipe>(_onEditRecipe);
    on<RemoveRecipe>(_onRemoveRecipe);
  }

  Future<void> _onListRecipes(
    ListRecipes event,
    Emitter<RecipeState> emit,
  ) async {
    //
    emit(const RecipeLoading());

    try {
      final data = await client.recipes.get();

      emit(RecipeLoaded(data));
    } //
    catch (e) {
      const error = Error(
        code: 'unknown',
        message: 'An unknown error occured',
      );

      emit(const RecipeNotLoaded(error));
    }
  }

  void _onAddRecipe(
    AddRecipe event,
    Emitter<RecipeState> emit,
  ) {
    final _state = state;

    if (_state is RecipeLoaded) {
      final recipes = [..._state.recipes, event.recipe];

      emit(RecipeLoaded(recipes));
    }
  }

  void _onEditRecipe(
    EditRecipe event,
    Emitter<RecipeState> emit,
  ) {
    final _state = state;

    if (_state is RecipeLoaded) {
      final recipes = _state.recipes //
          .map((v) => v.id == event.recipe.id ? event.recipe : v)
          .toList();

      emit(RecipeLoaded(recipes));
    }
  }

  void _onRemoveRecipe(
    RemoveRecipe event,
    Emitter<RecipeState> emit,
  ) {
    final _state = state;

    if (_state is RecipeLoaded) {
      final recipes = _state.recipes //
          .where((v) => v.id != event.recipe.id)
          .toList();

      emit(RecipeLoaded(recipes));
    }
  }

  @override
  Future<void> close() {
    client.client.close();

    return super.close();
  }
}
