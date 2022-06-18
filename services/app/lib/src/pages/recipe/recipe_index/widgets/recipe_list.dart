import 'package:flutter/material.dart';

import '../../../../generated/generated.dart';
import '../recipe_index.dart';

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
        return RecipeTile(recipe: recipes[index]);
      },
    );
  }
}
