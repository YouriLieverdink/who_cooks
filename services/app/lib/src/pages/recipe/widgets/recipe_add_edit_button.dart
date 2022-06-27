import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../di.dart';
import '../../pages.dart';

class RecipeAddEditButton extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

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
      closedColor: theme.colorScheme.secondary,
      closedBuilder: (context, onPressed) {
        return FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonSize / 3),
          ),
          onPressed: onPressed,
          icon: Icon(
            id != null //
                ? Icons.edit
                : Icons.add,
            color: theme.colorScheme.onSecondary,
          ),
          label: Text(
            id != null //
                ? translations.messages.buttons.edit
                : translations.messages.buttons.add,
          ),
        );
      },
    );
  }
}
