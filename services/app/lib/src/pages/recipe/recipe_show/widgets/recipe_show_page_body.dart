import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/generated.dart';

class RecipeShowPageBody extends StatelessWidget {
  const RecipeShowPageBody({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();

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
                  recipe.photoUrl ?? '',
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
          const SizedBox(height: kPadding / 4),
          Text(
            recipe.description ?? '...',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
