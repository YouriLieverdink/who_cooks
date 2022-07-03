import 'package:app/config/constants.dart';
import 'package:app/src/pages/recipe/recipe.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeIndexPageBody extends StatelessWidget {
  const RecipeIndexPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();
    final theme = context.read<ThemeData>();

    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        if (state is RecipesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RecipesLoaded) {
          // Only display the list when recipes are present.
          if (state.recipes.isNotEmpty) {
            return RecipeList(recipes: state.recipes);
          }
        }

        // Display that there are no results as default.
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: theme.colorScheme.onSurface,
                size: 32.0,
              ),
              const SizedBox(height: kPadding),
              Text(
                translations.messages.hints.noYet(
                  translations.messages.resources.recipe(3),
                ),
                style: theme.textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}
