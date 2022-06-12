import 'package:flutter/material.dart';

import '../../../../generated/IruoyWhocooksRecipesV0Json.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: recipe.photoUrl != null //
          ? SizedBox(
              width: 48.0,
              height: 48.0,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(recipe.photoUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : const SizedBox(
              height: double.infinity,
              width: 48.0,
              child: Icon(
                Icons.image,
                size: 32.0,
              ),
            ),
      title: Text(
        recipe.title,
      ),
      subtitle: Text(
        recipe.description ?? '...',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      isThreeLine: true,
      onTap: () {
        //
        Navigator.of(context).pushNamed(
          '/recipes/add-edit',
        );
      },
    );
  }
}
