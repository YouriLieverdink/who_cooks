import 'package:flutter/material.dart';

import '../generated/generated.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    Key? key,
    required this.recipe,
    required this.onTap,
  }) : super(key: key);

  final Recipe recipe;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox.square(
        dimension: 48.0,
        child: recipe.photoUrl != null
            ? ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(recipe.photoUrl!),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image),
                ),
              )
            : const Icon(Icons.image),
      ),
      isThreeLine: true,
      title: Text(recipe.title),
      subtitle: Text(
        recipe.description ?? '...',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
