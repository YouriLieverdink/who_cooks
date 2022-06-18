import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../state/state.dart';
import '../recipe_show.dart';

class RecipeShowPage extends StatelessWidget {
  const RecipeShowPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to display.
  final String id;

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
            .first;

        return Scaffold(
          appBar: AppBar(
            title: Text(recipe.title),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: RecipeShowPageBody(recipe: recipe),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
        );
      },
    );
  }
}
