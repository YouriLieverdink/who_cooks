import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/constants.dart';
import '../../../../services/services.dart';
import '../../recipe.dart';

class RecipeSearchPageBody extends StatelessWidget {
  const RecipeSearchPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();
    final theme = context.read<ThemeData>();

    return BlocBuilder<RecipeSearchBloc, RecipeSearchState>(
      builder: (context, state) {
        if (state is RecipeSearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RecipeSearchLoaded) {
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
                Icons.search_off,
                color: theme.colorScheme.onSurface,
                size: 32.0,
              ),
              const SizedBox(height: kPadding),
              Text(
                translations.messages.hints.noResults,
                style: theme.textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
    );
  }
}
