import 'package:app/src/generated/generated.dart';
import 'package:app/src/pages/recipe/recipe.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RecipeShowPage extends StatelessWidget {
  const RecipeShowPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to display.
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesBloc, RecipesState>(
      listener: (context, state) {
        // Ensures we are not in an invalid state.
        if (state is! RecipesLoaded) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is! RecipesLoaded) {
          return const SizedBox();
        }

        final recipe = state.recipes //
            .where((v) => v.id == id)
            .firstOrNull;

        if (recipe == null) {
          return const SizedBox();
        }

        return BlocProvider(
          create: (context) => RecipeRemoveCubit(
            recipe: recipe,
            repository: context.read(),
            recipesBloc: context.read(),
          ),
          child: _RecipeShowView(recipe: recipe),
        );
      },
    );
  }
}

class _RecipeShowView extends StatelessWidget {
  const _RecipeShowView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();
    final translations = context.read<Translations>();

    return BlocListener<RecipeRemoveCubit, RecipeRemoveState>(
      listener: (context, state) {
        if (state.submission == FormzStatus.submissionSuccess) {
          // The operation was successful.
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(recipe.title),
          centerTitle: false,
          actions: const [
            RecipeRemoveButton(),
          ],
        ),
        body: RecipeShowPageBody(recipe: recipe),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/recipes/add-edit',
              arguments: recipe.id,
            );
          },
          icon: Icon(
            Icons.edit,
            color: theme.colorScheme.onSecondary,
          ),
          label: Text(
            translations.messages.buttons.edit,
            style: theme.textTheme.button?.apply(
              color: theme.colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
