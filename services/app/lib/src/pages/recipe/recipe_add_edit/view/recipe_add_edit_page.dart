import 'package:app/src/generated/generated.dart';
import 'package:app/src/pages/recipe/recipe_add_edit/recipe_add_edit.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeAddEditPage extends StatefulWidget {
  const RecipeAddEditPage({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe to edit or `null` when to add.
  final String? id;

  @override
  State<RecipeAddEditPage> createState() => _RecipeAddEditPageState();
}

class _RecipeAddEditPageState extends State<RecipeAddEditPage> {
  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      context.read<RecipesBloc>().add(ShowRecipe(id: widget.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        //
        Recipe? recipe;

        if (state is RecipesLoaded) {
          recipe = state.recipes //
              .where((v) => v.id == widget.id)
              .firstOrNull;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              recipe != null //
                  ? translations.messages.buttons.edit
                  : translations.messages.buttons.add,
            ),
            centerTitle: false,
          ),
          body: BlocProvider(
            create: (_) => RecipeAddEditCubit(
              recipe: recipe,
              recipesBloc: context.read(),
              repository: context.read(),
            ),
            child: const RecipeAddEditForm(),
          ),
        );
      },
    );
  }
}
