import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../state/state.dart';
import '../../recipe.dart';

class RecipeIndexPage extends StatefulWidget {
  const RecipeIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipeIndexPage> createState() => _RecipeIndexPageState();
}

class _RecipeIndexPageState extends State<RecipeIndexPage> {
  ///
  static final translations = $.get<Translations>();

  @override
  void initState() {
    super.initState();

    context.read<RecipesBloc>().add(const LoadRecipes());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations.messages.pages.recipes,
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RecipesNotLoaded) {
            return const Center(
              child: Text('Er is een fout opgetreden'),
            );
          }

          if (state is RecipesLoaded) {
            return RecipeList(recipes: state.recipes);
          }

          return const SizedBox();
        },
      ),
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
