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
}
