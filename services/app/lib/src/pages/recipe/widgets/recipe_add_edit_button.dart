import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../pages.dart';

class RecipeAddEditButton extends StatelessWidget {
  const RecipeAddEditButton({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The id of the recipe used to open the [RecipeAddEditPage].
  ///
  /// This value can be left `null` to open the add a new recipe.
  final String? id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OpenContainer(
      openBuilder: (context, _) {
        return RecipeAddEditPage(id: id);
      },
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kButtonSize / 3),
      ),
      closedElevation: 6.0,
      closedColor: theme.colorScheme.secondary,
      closedBuilder: (context, onPressed) {
        return SizedBox.square(
          dimension: kButtonSize,
          child: Center(
            child: Icon(
              Icons.add,
              color: theme.colorScheme.onSecondary,
            ),
          ),
        );
      },
    );
  }
}
