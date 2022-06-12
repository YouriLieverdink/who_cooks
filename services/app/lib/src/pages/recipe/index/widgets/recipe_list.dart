import 'package:flutter/material.dart';

import '../../../../generated/IruoyWhocooksRecipesV0Json.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        //
        final recipe = recipes[index];

        return ListTile(
          title: Text(recipe.title),
        );
      },
    );
  }
}
