import 'package:flutter/material.dart';

import '../../../../generated/generated.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox.square(
        dimension: 48.0,
        child: recipe.photoUrl != null
            ? ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(recipe.photoUrl!),
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.image),
      ),
      title: Text(recipe.title),
      subtitle: const Text('...'),
    );
  }
}
