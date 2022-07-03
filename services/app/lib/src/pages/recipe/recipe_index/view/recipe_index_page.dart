import 'package:app/src/pages/recipe/recipe_index/recipe_index.dart';
import 'package:app/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeIndexPage extends StatelessWidget {
  const RecipeIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();
    final theme = context.read<ThemeData>();

    return Scaffold(
      appBar: AppBar(
        title: Text(translations.messages.pages.recipes),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: theme.colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/recipes/search');
            },
          ),
        ],
      ),
      body: const RecipeIndexPageBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/recipes/add-edit',
          );
        },
        icon: Icon(
          Icons.add,
          color: theme.colorScheme.onSecondary,
        ),
        label: Text(
          translations.messages.buttons.add,
          style: theme.textTheme.button?.apply(
            color: theme.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
