import 'package:flutter/material.dart';

import '../../../generated/generated.dart';
import './recipe_tile.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];

        return RecipeTile(
          recipe: recipe,
          onTap: () {
            Navigator.of(context).pushNamed(
              '/recipes/show',
              arguments: recipe.id,
            );
          },
        );
      },
    );
  }
}
