import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/constants.dart';
import '../../../../services/services.dart';
import '../../../../state/state.dart';
import '../../recipe.dart';

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
