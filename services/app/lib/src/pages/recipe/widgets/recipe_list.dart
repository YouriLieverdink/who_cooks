import 'package:app/config/constants.dart';
import 'package:app/src/generated/generated.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(
        bottom: kPadding * 2.5,
      ),
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
