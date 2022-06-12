import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class IngredientFieldList extends StatelessWidget {
  const IngredientFieldList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AddEditCubit, AddEditState>(
      buildWhen: (previous, current) {
        return previous.ingredients != current.ingredients;
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: theme.textTheme.subtitle1,
                ),
                FloatingActionButton.small(
                  onPressed: () => context //
                      .read<AddEditCubit>()
                      .addIngredient(),
                  heroTag: null,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: kPadding / 2),
            if (state.ingredients.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(top: kPadding),
                child: Text(
                  'Click + to add an ingredient',
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ],
            for (int i = 0; i < state.ingredients.length; i++) ...[
              Row(
                children: [
                  Expanded(
                    child: IngredientField(
                      input: state.ingredients[i],
                      onChanged: (value) => context //
                          .read<AddEditCubit>()
                          .editIngredient(value, index: i),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => context //
                        .read<AddEditCubit>()
                        .removeIngredient(index: i),
                  ),
                ],
              ),
              const SizedBox(height: kPadding / 2),
            ]
          ],
        );
      },
    );
  }
}
