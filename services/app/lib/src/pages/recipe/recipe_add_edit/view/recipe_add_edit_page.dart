import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../state/state.dart';
import '../recipe_add_edit.dart';

class RecipeAddEditPage extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

  const RecipeAddEditPage({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to edit or `null` when to add.
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesBloc, RecipesState>(
      listener: (context, state) {
        // Ensures we are not in an invalid state.
        if (state is! RecipesLoaded) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is! RecipesLoaded) {
          return const SizedBox();
        }

        final recipe = state.recipes //
            .where((v) => v.id == id)
            .firstOrNull;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              recipe != null //
                  ? translations.messages.hints.edit
                  : translations.messages.hints.add,
            ),
            centerTitle: false,
          ),
          body: BlocProvider(
            create: (_) => RecipeAddEditCubit(
              recipe: recipe,
              recipesBloc: context.read(),
              repository: $.get(),
            ),
            child: const RecipeAddEditForm(),
          ),
        );
      },
    );
  }
}
