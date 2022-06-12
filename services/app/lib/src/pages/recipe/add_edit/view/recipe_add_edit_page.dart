import 'package:app/src/state/state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../add_edit.dart';

class RecipeAddEditPage extends StatelessWidget {
  const RecipeAddEditPage({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The unique identifier of the recipe, if any.
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeBloc, RecipeState>(
      listener: (context, state) {
        // We navigate back when we end up in an illegal state.
        if (state is! RecipeLoaded) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is RecipeLoaded) {
          // We retrieve the correct recipe using the provided id.
          final recipe = state.recipes //
              .where((v) => v.id == id)
              .firstOrNull;

          final cubit = AddEditCubit(
            recipeBloc: context.read(),
            recipe: recipe,
          );

          return Scaffold(
            appBar: AppBar(
              title: Text(
                '${id != null ? 'Edit' : 'Add'} recipe',
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async => cubit.remove(),
                )
              ],
            ),
            body: BlocListener<AddEditCubit, AddEditState>(
              bloc: cubit,
              listener: (context, state) {
                //
                if (state.status == FormzStatus.submissionSuccess) {
                  Navigator.pop(context);
                }
              },
              child: BlocProvider.value(
                value: cubit,
                child: const RecipeAddEditForm(),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
