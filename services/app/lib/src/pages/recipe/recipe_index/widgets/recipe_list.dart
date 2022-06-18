import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../generated/generated.dart';
import '../../../pages.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];

        return OpenContainer(
          closedBuilder: (_, onTap) => RecipeTile(recipe: recipe, onTap: onTap),
          openBuilder: (_, __) => RecipeShowPage(id: recipe.id),
          closedElevation: 0.0,
          closedColor: theme.scaffoldBackgroundColor,
        );
      },
    );
  }
}
