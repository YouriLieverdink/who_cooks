import 'package:app/src/generated/generated.dart';
import 'package:app/src/pages/recipe/recipe.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/state.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeShowPage extends StatefulWidget {
  const RecipeShowPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to display.
  final String id;

  @override
  State<RecipeShowPage> createState() => _RecipeShowPageState();
}

class _RecipeShowPageState extends State<RecipeShowPage> {
  @override
  void initState() {
    super.initState();

    context.read<RecipesBloc>().add(ShowRecipe(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();
    final translations = context.read<Translations>();

    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        //
        Recipe? recipe;

        if (state is RecipesLoaded) {
          recipe = state.recipes //
              .where((r) => r.id == widget.id)
              .firstOrNull;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              recipe != null //
                  ? recipe.title
                  : translations.messages.hints.notFound,
            ),
            centerTitle: false,
            actions: [
              if (recipe != null) ...[
                BlocProvider(
                  create: (_) => RecipeRemoveCubit(
                    recipe: recipe!,
                    repository: context.read(),
                    recipesBloc: context.read(),
                  ),
                  child: const RecipeRemoveButton(),
                ),
              ],
            ],
          ),
          body: Conditional(
            recipe != null,
            isTrue: (_) {
              return RecipeShowPageBody(recipe: recipe!);
            },
            isFalse: (_) {
              return EmptyPage(
                icon: Icons.error_outline,
                message: translations.messages.hints.notFound,
              );
            },
          ),
          floatingActionButton: Conditional(
            recipe != null,
            isTrue: (_) {
              return FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/recipes/add-edit',
                    arguments: recipe!.id,
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
              );
            },
          ),
        );
      },
    );
  }
}
