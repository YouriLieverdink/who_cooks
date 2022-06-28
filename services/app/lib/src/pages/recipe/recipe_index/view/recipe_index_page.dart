import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/services.dart';
import '../../../../state/state.dart';
import '../recipe_index.dart';

class RecipeIndexPage extends StatefulWidget {
  const RecipeIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipeIndexPage> createState() => _RecipeIndexPageState();
}

class _RecipeIndexPageState extends State<RecipeIndexPage> {
  @override
  void initState() {
    super.initState();

    context.read<RecipesBloc>().add(const LoadRecipes());
  }

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
          Icons.edit,
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
