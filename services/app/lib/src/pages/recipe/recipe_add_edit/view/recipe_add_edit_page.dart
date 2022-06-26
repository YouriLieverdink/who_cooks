import 'package:flutter/material.dart';

import '../../../../generated/generated.dart';

class RecipeAddEditPage extends StatelessWidget {
  const RecipeAddEditPage({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to edit or `null` when to add.
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${id != null ? 'Edit' : 'Add'} recipe',
        ),
      ),
    );
  }
}
