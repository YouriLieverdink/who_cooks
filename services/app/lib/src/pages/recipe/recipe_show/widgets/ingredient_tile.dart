import 'package:flutter/material.dart';

import '../../../../generated/generated.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.title),
      subtitle: Text('${ingredient.amount} ${ingredient.unit}'),
    );
  }
}
