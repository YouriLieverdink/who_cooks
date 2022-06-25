import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';

import '../../../../di.dart';
import '../../../../generated/generated.dart';
import '../recipe_show.dart';

class RecipeShowPageBody extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

  const RecipeShowPageBody({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 192.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              clipBehavior: Clip.hardEdge,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  recipe.photoUrl!,
                ),
                errorBuilder: (_, __, ___) => const Icon(Icons.image),
              ),
            ),
          ),
          const SizedBox(height: kPadding),
          Text(
            recipe.title,
            style: theme.textTheme.headlineSmall,
          ),
          if (recipe.description != null) ...[
            const SizedBox(height: kPadding / 4),
            Text(
              recipe.description!,
              style: theme.textTheme.bodyMedium,
            ),
          ],
          if (recipe.ingredients.isNotEmpty) ...[
            const SizedBox(height: kPadding),
            Text(
              translations.messages.labels.ingredients,
              style: theme.textTheme.bodyLarge,
            ),
            const Divider(height: kPadding),
            for (var ingredient in recipe.ingredients) ...[
              IngredientTile(ingredient: ingredient),
            ],
          ],
        ],
      ),
    );
  }
}
